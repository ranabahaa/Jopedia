import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/layout/home_layout_state.dart';

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
}