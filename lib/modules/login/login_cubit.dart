import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/bloc/states.dart';
import 'package:bloc/bloc.dart';

class login_cubit extends Cubit<AppState> {
  login_cubit() : super(SuffixInitialState());

  static login_cubit get(context) => BlocProvider.of(context);
  bool ispassword = true;

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

