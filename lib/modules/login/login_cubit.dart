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


class login_cubit extends Cubit<AppState> {
  login_cubit() : super(SuffixInitialState());

  static login_cubit get(context) => BlocProvider.of(context);
  bool ispassword = false;

  void changVisibility(){
    ispassword = !ispassword;
    if(ispassword){
      emit(SuffixVisible());
    }
    else{
      emit(SuffixVisibleOff());
    }
  }
}