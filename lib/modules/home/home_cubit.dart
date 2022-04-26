import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/modules/home/home_states.dart';

class HomeCubit extends Cubit <HomeStates>{
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get (BuildContext context){

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
}