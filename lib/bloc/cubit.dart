import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(InitialState());

  static AppBloc get(context) => BlocProvider.of(context);

  void CreatJob({
    //@required String JOB_ID,
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
    PostDataModel model = PostDataModel(
      DISCREPTION: DISCREPTION,
      JOB_LOCATION: JOB_LOCATION,
      JOB_TITLE: JOB_TITLE,
      JOB_SALARY: JOB_SALARY,
      StartDate : StartDate,
      EndDate : EndDate,
      StartTime : StartTime,
      EndTime : EndTime,
      PostTime : PostTime ,
      //USER_ID : USER_ID;
      //WORKER_ID : WORKER_ID;
      //COMPLETED_JOB : COMPLETED_JOB;
    );

    FirebaseFirestore.instance.collection('post')
        .add(model.toJson())
        .then((value) {
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
    required String WORKER_ID,
  }) {
    RequestDataModel model = RequestDataModel(
      JOB_ID: JOB_ID,
      JOB_SALARY: JOB_SALARY,
      USER_ID: USER_ID,
      WORKER_ID : WORKER_ID,
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
}