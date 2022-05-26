import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/layout/home_layout.dart';
import 'package:jopedia/modules/login/LoginScreen.dart';
import 'package:jopedia/modules/register/register_cubit.dart';
import 'package:jopedia/modules/register/register_state.dart';
import 'package:jopedia/shared/components/component.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../bloc/states.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var PhoneNumberController = TextEditingController();
  var NameController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => register_cubit(),
      child: BlocConsumer<register_cubit, RegisterStates>(
        listener: (BuildContext context, state) {
          if (state is CreateUserSuccessState) {
            navigateAndFinish(
              context,
              Home_layout(register_cubit.get(context).user),
            );
          }
        },
        builder: (BuildContext context, state) {
          var cubit = register_cubit.get(context);
          return Scaffold(
            backgroundColor: Color(0xffF6F9FA),
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xff0F4C5C),
                  size: 25.0,
                ),
              ),
              backgroundColor: Color(0xffF6F9FA),
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: MyText(
                        text: 'Create Account',
                        colors: Color(0xff0F4C5C),
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Center(
                      child: MyText(
                        text: 'Get started with new account',
                        colors: Color(0xff0F4C5C).withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    DefaultTextField(
                      controller: NameController,
                      type: TextInputType.text,
                      hint: 'Full name',
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    DefaultTextField(
                      maxlines: 1,
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      SuffixIcon: Icons.email,
                      hint: 'Email',
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    DefaultTextField(
                      maxlines: 1,
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      hint: 'Password',
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    DefaultTextField(
                      maxlines: 1,
                      controller: confirmPasswordController,
                      type: TextInputType.visiblePassword,
                      hint: 'Re-Password',
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    DefaultTextField(
                      maxlines: 1,
                      controller: PhoneNumberController,
                      type: TextInputType.number,
                      SuffixIcon: Icons.phone,
                      hint: 'Phone number',
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    MaterialButton(
                      color: Color(0xff50B3CF),
                      minWidth: double.infinity,
                      height: 50.0,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: ()  {
                        register_cubit.get(context).userRegister(
                          name: NameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phone: PhoneNumberController.text,
                        );
                      },
                    ),
                    SizedBox(height: 10.0,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
