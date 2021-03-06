import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/layout/home_layout_state.dart';
import 'package:jopedia/models/job/job_model.dart';
import 'package:jopedia/models/user/user_model.dart';
import '../modules/home/HomeScreen.dart';
import '../modules/notification/NotificationScreen.dart';
import '../modules/saved_jobs/SavedJobScreen.dart';
import '../modules/wallet/WalletScreen.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitState());
  static HomeLayoutCubit get (BuildContext context){
    return BlocProvider.of(context);
  }


  int currentIndex = 0;
  List<Widget> screen = [
    HomeScreen(),
    NotificationScreen(),
    SavedJobScreen(),
    WalletScreen(),
  ];

  void currentIndexChange (index){
    currentIndex=index;
    emit(BottomNavigationTrue());
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

}