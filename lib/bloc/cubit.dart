import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jopedia/bloc/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/modules/home/home_states.dart';
import '../models/job/job_model.dart';
import '../models/request/request_model.dart';
import '../models/user/user_model.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(InitialState());

  /*static AppBloc get(context) => BlocProvider.of(context);*/

  static AppBloc get (BuildContext context){

    return BlocProvider.of(context);

  }

  bool isAllTrue = true;
  bool isSaveTrue = false;
  bool isDuration = true;

  void isAllTrueYes (){
    isAllTrue=true;
    emit(NearbyJobs());
  }
  void isAllTrueNo (){
    isAllTrue=false;
    emit(NearbyJobs());
  }
  void isSaveTrueYes (){
    isSaveTrue=true;
    emit(SavedJobs());
  }
  void isSaveTrueNo (){
    isSaveTrue=false;
    emit(SavedJobs());
  }
  void isDurationYes (){
    isDuration=true;
  }
  void isDurationNo (){
    isDuration=false;
  }

  void CreatJob({
    required String JOBID,
    required String DISCREPTION,
    required String JOB_LOCATION,
    required String JOB_TITLE,
    required String JOB_SALARY,
    required String StartDate,
    required String EndDate,
    required String StartTime,
    required String EndTime,
    required String PostTime,
    //@required String USER_ID,
    //@required String WORKER_ID,
    //@required String COMPLETED_JOB,
  }) {
    final user = FirebaseAuth.instance.currentUser;
    PostDataModel model = PostDataModel(
      JOBID: JOBID,
      DISCREPTION: DISCREPTION,
      JOB_LOCATION: JOB_LOCATION,
      JOB_TITLE: JOB_TITLE,
      JOB_SALARY: JOB_SALARY,
      StartDate : StartDate,
      EndDate : EndDate,
      StartTime : StartTime,
      EndTime : EndTime,
      PostTime : PostTime ,
      USER_ID : user!.uid,
      //WORKER_ID : WORKER_ID;
      //COMPLETED_JOB : COMPLETED_JOB;
    );

    FirebaseFirestore.instance.collection('post')
        .add(model.toJson())
        .then((value) {
          model.JOBID = value.id;
      print("ppp");
      emit(CreatJobSuccess());
    }).catchError((error) {
      print("false");
      debugPrint(error.toString());
      emit(CreatJobError(message: error.toString(),));
    });


    /*jopRef.doc("3211").set({
      "DISCREPTION" : DISCREPTION,
      "JOB_LOCATION" : JOB_LOCATION,
      "JOB_TITLE" : JOB_TITLE,
      "JOB_SALARY" : JOB_SALARY,}).then((value) {
      print("true");
    }).catchError((onError){print(onError.toString()); print("false");});*/


  }


  void DeleteJob({required String id}) {
    FirebaseFirestore.instance.collection('post')
        .doc(id).delete().then((value) {
      print("true");
    }).catchError((onError) {
      print(onError.toString());
      print("false");
    }
    );
  }

  void SendRequest({
    required String JOB_ID,
    required String JOB_SALARY,
    required String USER_ID,
  }) {
    final user = FirebaseAuth.instance.currentUser;
    RequestDataModel model = RequestDataModel(
      JOB_ID: JOB_ID,
      JOB_SALARY: JOB_SALARY,
      USER_ID: USER_ID,
      WORKER_ID : user!.uid,
    );

    FirebaseFirestore.instance.collection('request')
        .add(model.toJson())
        .then((value) {
      print("ppp");
      emit(SendRequestSuccess());
    }).catchError((error) {
      print("false");
      debugPrint(error.toString());
      emit(SendRequestError(message: error.toString(),));
    });

  }

  void RejectRequest({required String id}) {
    FirebaseFirestore.instance.collection('request')
        .doc(id).delete().then((value) {
    }).catchError((onError) {
      print(onError.toString());
    }
    );
  }

  Future<PostDataModel?> ShowContract() async{

    final DocPost = FirebaseFirestore.instance.collection('post').doc('bARLIywCJSgrYXQnQil5');
    final snapshot = await DocPost.get();
    if(snapshot.exists){
      return PostDataModel.fromJson(snapshot.data()!, snapshot.id);
    }
  }
  //this returns a list not one record
/*
    Stream<List<PostDataModel>> ShowContract() => FirebaseFirestore.instance.collection('post')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PostDataModel.fromJson(doc.data())).toList()) ;
*/
  List<PostDataModel> posts =[];

  void GetPostsData (){
    emit(GetPostsDataLoading());
    FirebaseFirestore.instance
        .collection('post')
        .get()
        .then((value)
    {
      value.docs.forEach((element) {
        posts.add(PostDataModel.fromJson(element.data(), element.id));
      });
      emit(GetPostsDataSuccsess());
    })
        .catchError((error){
      print(error.toString());
      emit(GetPostsDataError(error.toString()));
    }
    );
  }
  void SaveJob (String jopId){
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .collection('savedPosts')
        .doc(jopId)
        .set({
      'Save': true,
    }).then((value) {
      print('SavedSuccess');
      emit(SavedSuccessState());
    }).catchError((error) {
      print('SavedError');
      emit(SavedErrorState(error.toString()));
    });

  }
  PostDataModel? model;
  Future<void> GetCurrentPost (String jobId) async {
    await FirebaseFirestore.instance
        .collection('post')
        .doc(jobId)
        .get()
        .then((value)
    {
       model = PostDataModel.fromJson((value.data()),value.id);
      print (value.data());
    })
        .catchError((error){
      print(error.toString());

    }
    );
  }
  List<String>? savedId=[];
  List<PostDataModel>? savedPosts = [];

  void GetSavedPostsData (){
    emit(GetSavedPostsDataLoading());
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('savedPosts').get().then((value)
    {
      value.docs.forEach((element) {
        savedId!.add(element.id);
      });
      emit(GetSavedPostsLoading());
      FirebaseFirestore.instance.collection('post').get().then((value)
      {
        /*print(savedId!.length);*/
        for(int i=1 ;i >= savedId!.length; i++ ){
          value.docs.forEach((element) {
            print(element.id);
            /*if (element.id==savedId?[i])
            {*/
            print(i);
              print('done');
              /*savedPosts?.add(PostDataModel.fromJson(element.data(), element.id));*/
            /*}*/
            print(savedPosts);

          });
        }
        emit(GetSavedPostsSuccsess());
      }).catchError((error){
        print(error.toString());
        emit(GetSavedPostsError(error.toString()));
      }
      );
      emit(GetSavedPostsDataSuccsess());
    }).catchError((error){
      print(error.toString());
      emit(GetSavedPostsDataError(error.toString()));
    }
    );
  }


  /*void GetSavedPosts (){
    emit(GetSavedPostsLoading());
    FirebaseFirestore.instance.collection('post').get().then((value)
    {
      print(savedId!.length);
      for(int i=1 ;i >= savedId!.length; i++ ){
        value.docs.forEach((element) {
          if (element.id==savedId?[i])
          {
            savedPosts?.add(PostDataModel.fromJson(element.data(), element.id));
          }
          print(savedPosts);

        });
      }

      emit(GetSavedPostsSuccsess());
    }).catchError((error){
      print(error.toString());
      emit(GetSavedPostsError(error.toString()));
    }
    );
  }*/


}