import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/bloc/states.dart';
import 'package:bloc/bloc.dart';
import 'package:jopedia/modules/register/register_state.dart';
import '../../models/user/user_model.dart';



class register_cubit extends Cubit<RegisterStates> {
  register_cubit() : super(RegisterInitialState());

  static register_cubit get(context) => BlocProvider.of(context);
  late UserModel user;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    print('hello');

    emit(RegisterLoadingState());


    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(
        uId: value.user!.uid,
        phone: phone,
        email: email,
        name: name,
      );
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      image: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
      about: 'Write About Yourself',
      balance: 0.0,
    );
    user = model;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value)
    {
      emit(CreateUserSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }
}