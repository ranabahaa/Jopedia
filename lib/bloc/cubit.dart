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

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(InitialState());

  static AppBloc get(context) => BlocProvider.of(context);

  void CreatJob({
    //@required String JOB_ID,
    required String DISCREPTION,
    required String JOB_LOCATION,
    required String JOB_TITLE,
    required String JOB_SALARY,
    //@required String USER_ID,
    //@required String WORKER_ID,
    //@required String COMPLETED_JOB,
})  {
    PostDataModel model= PostDataModel(
        DISCREPTION : DISCREPTION,
        JOB_LOCATION : JOB_LOCATION,
        JOB_TITLE : JOB_TITLE,
        JOB_SALARY : JOB_SALARY,
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


     /*FirebaseFirestore.instance.collection('post')
        .doc("8itrczhlAnL7bbmaODoI").delete().then((value) {
      print("true");
    }).catchError((onError){
      print(onError.toString());
      print("false");}
      );*/

    /*jopRef.doc("3211").set({
      "DISCREPTION" : DISCREPTION,
      "JOB_LOCATION" : JOB_LOCATION,
      "JOB_TITLE" : JOB_TITLE,
      "JOB_SALARY" : JOB_SALARY,}).then((value) {
      print("true");
    }).catchError((onError){print(onError.toString()); print("false");});*/


  }
}
