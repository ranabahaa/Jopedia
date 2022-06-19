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
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../models/job/job_model.dart';
import '../models/request/request_model.dart';
import '../models/user/user_model.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(InitialState());

  /*static AppBloc get(context) => BlocProvider.of(context);*/

  static AppBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

/*
  late File image;
  late String imageUrl;
  sendData() async{
    var imageRef = FirebaseStorage.instance.ref().child("profiles/"+widget.user.uId);
    await imageRef.putFile(image);
    imageUrl = await imageRef.getDownloadURL();
    widget.user.image = imageUrl;
    await FirebaseFirestore.instance.collection('users').doc(widget.user.uId).update(
        { 'image' : imageUrl.toString()  });
    setState(() {});
  }
  Future getImage() async {

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final imageTemp = File(image!.path);
    setState(() => this.image = imageTemp);
    if (image != null){
      sendData();
    }
  }*/


  bool isAllTrue = true;
  bool isSaveTrue = false;
  bool isDuration = true;

  void isAllTrueYes() {
    isAllTrue = true;
    emit(NearbyJobs());
  }

  void isAllTrueNo() {
    isAllTrue = false;
    emit(NearbyJobs());
  }

  void isSaveTrueYes() {
    isSaveTrue = true;
    emit(SavedJobs());
  }

  void isSaveTrueNo() {
    isSaveTrue = false;
    emit(SavedJobs());
  }

  void isDurationYes() {
    isDuration = true;
  }

  void isDurationNo() {
    isDuration = false;
  }
void JopView(){
    emit(JopViewSuccess());
}
  late UserModel post_user_model;


  Future<void> GetPostUserData(String id) async {
    emit(GetPostUserDataLoading());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get()
        .then((value) {
      post_user_model = UserModel.fromJson((value.data()!));
        emit(GetPostUserDataSuccsess());
    }).catchError((error) {
      print(error.toString());
      emit(GetPostUserDataError(error.toString()));
    });
  }

  late UserModel user_model;

  Future<void> GetUserData() async {
    emit(GetUserDataLoading());
    final user = await FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((value) {
      print(value.data());
      user_model = UserModel.fromJson((value.data()!));
      emit(GetUserDataSuccsess());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataError(error.toString()));
    });
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
    required String WORKER_ID,
    required bool MORE_THAN_DAY,
  }) {
    final user = FirebaseAuth.instance.currentUser;
    PostDataModel model = PostDataModel(
      JOBID: JOBID,
      DISCREPTION: DISCREPTION,
      JOB_LOCATION: JOB_LOCATION,
      JOB_TITLE: JOB_TITLE,
      JOB_SALARY: JOB_SALARY,
      StartDate: StartDate,
      EndDate: EndDate,
      StartTime: StartTime,
      EndTime: EndTime,
      PostTime: PostTime,
      MORE_THAN_DAY: MORE_THAN_DAY,
      USER_ID: user!.uid,
      WORKER_ID: WORKER_ID,
    );

    FirebaseFirestore.instance
        .collection('post')
        .add(model.toJson())
        .then((value) {
      model.JOBID = value.id;
      print("ppp");
      emit(CreatJobSuccess());
    }).catchError((error) {
      print("false");
      debugPrint(error.toString());
      emit(CreatJobError(
        message: error.toString(),
      ));
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
    FirebaseFirestore.instance
        .collection('post')
        .doc(id)
        .delete()
        .then((value) {
      print("true");
    }).catchError((onError) {
      print(onError.toString());
      print("false");
    });
  }

  void SendRequest({
    required String JOB_ID,
    required String JOB_SALARY,
    required String USER_ID,
    String? name,
    required String JOB_TITLE,
  }) {
    final user = FirebaseAuth.instance.currentUser;
    RequestDataModel model = RequestDataModel(
      JOB_ID: JOB_ID,
      JOB_SALARY: JOB_SALARY,
      USER_ID: USER_ID,
      WORKER_ID: user!.uid,
      name: "Ahmed",
      JOB_TITLE: JOB_TITLE,
    );

    FirebaseFirestore.instance
        .collection('request')
        .add(model.toJson())
        .then((value) {
      print("ppp");
      emit(SendRequestSuccess());
    }).catchError((error) {
      print("false");
      debugPrint(error.toString());
      emit(SendRequestError(
        message: error.toString(),
      ));
    });
  }

  void RejectRequest({required String id}) {
    FirebaseFirestore.instance
        .collection('request')
        .doc(id)
        .delete()
        .then((value) {})
        .catchError((onError) {
      print(onError.toString());
    });
  }

  List<RequestDataModel> requests = [];
  void GetRequestsData() {
    FirebaseFirestore.instance.collection('request').get().then((value) {
      value.docs.forEach((element) {
        requests.add(RequestDataModel.fromJson(element.data(), element.id));
      });
    });
  }

  Future<PostDataModel?> ShowContract(String jobId) async {
    final DocPost = FirebaseFirestore.instance
        .collection('post')
        .doc(jobId);
    final snapshot = await DocPost.get();
    if (snapshot.exists) {
      return PostDataModel.fromJson(snapshot.data()!, snapshot.id);
    }
  }

  //this returns a list not one record

   /* List<PostDataModel> progressPosts=[];
      Stream<List<PostDataModel>> ShowJobsInProgress() => FirebaseFirestore.instance.collection('post')
          //.where('COMPLETED_JOB'==2)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => progressPosts.add(PostDataModel.fromJson(doc.data(), doc.id))));

  */


  List<PostDataModel> posts = [];

  void GetPostsData() {
    emit(GetPostsDataLoading());
    FirebaseFirestore.instance.collection('post').get().then((value) {
      value.docs.forEach((element) {
        posts.add(PostDataModel.fromJson(element.data(), element.id));
      });
      emit(GetPostsDataSuccsess());
    }).catchError((error) {
      print(error.toString());
      emit(GetPostsDataError(error.toString()));
    });
  }


  List<PostDataModel> currentPosts = [];
  void GetCurrentJobsData() {
    final user = FirebaseAuth.instance.currentUser;
    currentPosts = [];
    emit(GetCurrentPostsDataLoading());
    FirebaseFirestore.instance.collection('post').where('COMPLETED_JOB', isEqualTo: '2').where('USER_ID', isEqualTo: user!.uid).get().then((value) {
      //where(user!.uid, whereIn: ['WORKER_ID','USER_ID'])
      value.docs.forEach((element) {
        currentPosts.add(PostDataModel.fromJson(element.data(), element.id));
      });
      emit(GetCurrentPostsDataSuccsess());
    }).catchError((error) {
      print(error.toString());
      emit(GetCurrentPostsDataError(error.toString()));
    });
  }


  void SaveJob(String jopId) {
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
  void deleteSaveJob(String jopId) {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .collection('savedPosts')
        .doc(jopId).delete()
        .then((value) {
      print('DeleteSavedSuccess');
      emit(DeleteSavedSuccessState());
    }).catchError((error) {
      print('DeleteSavedError');
      emit(DeleteSavedErrorState(error.toString()));
    });
  }

  PostDataModel? model;
  Future<void> GetCurrentPost(String jobId) async {
    await FirebaseFirestore.instance
        .collection('post')
        .doc(jobId)
        .get()
        .then((value) {
      model = PostDataModel.fromJson((value.data()), value.id);
    }).catchError((error) {
      print(error.toString());
    });
  }

  List<String>? savedId = [];
  List<PostDataModel>? savedPosts = [];

  void GetSavedPostsData () {
    emit(GetSavedPostsDataLoading());
    final user = FirebaseAuth.instance.currentUser;
    savedId = [];
    savedPosts = [];
    FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('savedPosts').get().then((value)
    {
      value.docs.forEach((element) {
        savedId!.add(element.id);
      });
      print('saved ${savedId}');


      emit(GetSavedPostsLoading());
      FirebaseFirestore.instance.collection('post').get().then((value)
      {

        value.docs.forEach((element) {

          if (savedId!.contains(element.id))
          {
          savedPosts?.add(PostDataModel.fromJson(element.data(), element.id));
          }

        });
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
  void CheckUid() {
    final user = FirebaseAuth.instance.currentUser;
    var uid = user?.uid;
    if (uid != null) {
      emit(LoginSuccsess());
      print('Success');
    } else {
      emit(LoginFailed());
      print('Failed');
    }
  }


  late UserModel modele;
  var mod;
  var dataJob;
  var dataUser;
  var dataWorker;


  void DepositToWallet(TextEditingController data) {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      dataUser = UserModel.fromJson((value.data()!));
      final DocWallet = FirebaseFirestore.instance.collection('users').doc(
          dataUser.uId);
        DocWallet.update({
          'balance': dataUser.balance + int.parse(data.text),
        });
    });
  }


  void WithdrawlFromWallet(TextEditingController data) {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      modele = UserModel.fromJson((value.data()!));
      final DocWallet = FirebaseFirestore.instance.collection('users').doc(
          modele.uId);
      DocWallet.update({
        'balance': modele.balance - int.parse(data.text),
      });
    });
  }


  Future<void> AddWallet(TextEditingController name,
      TextEditingController number,
      TextEditingController cvv,
      TextEditingController expdate,
      TextEditingController PIN,) async {
    final user = FirebaseAuth.instance.currentUser;

    final Docuser = FirebaseFirestore.instance.collection('users').doc(
        user!.uid);
    final snapshot2 = await Docuser.get();
    dataUser = UserModel.fromJson(snapshot2.data()!);

    final DocWallet = FirebaseFirestore.instance.collection('users').doc(
        user!.uid);
    if(dataUser.card_name =='' && dataUser.card_number==''
        && dataUser.CVV=='' && dataUser.EXPIRATION_DATE== ''
        && dataUser.PIN=='') {
      DocWallet.update({
        'card_name': name.text,
        'card_number': number.text,
        'CVV': cvv.text,
        'EXPIRATION_DATE': expdate.text,
        'PIN': PIN.text,
      });
    }
    else {
      print('You already Added a card');
    }
  }

  Future<void> deleteWallet() async {
    final user = FirebaseAuth.instance.currentUser;
    final DocWallet = FirebaseFirestore.instance.collection('users').doc(
        user!.uid);
      DocWallet.update({
        'card_name': '',
        'card_number': '',
        'CVV': '',
        'EXPIRATION_DATE': '',
        'PIN': '',
      });

    // else {
    //   print('you dont have wallet to delete');
    //
    // }
  }

  Future<UserModel?> Readbalance() async {
    final user = FirebaseAuth.instance.currentUser;
    final Docuser = FirebaseFirestore.instance.collection('users').doc(
        user!.uid);
    final snapshot2 = await Docuser.get();
    if (snapshot2.exists) {
      return UserModel.fromJson(snapshot2.data()!);
    }
  }

}
