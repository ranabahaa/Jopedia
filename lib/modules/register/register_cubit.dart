
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/bloc/states.dart';
import 'package:bloc/bloc.dart';



class register_cubit extends Cubit<AppState> {
  register_cubit() : super(SuffixInitialState());

  static register_cubit get(context) => BlocProvider.of(context);
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