import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/layout/home_layout.dart';
import 'package:jopedia/layout/home_layout_state.dart';
import 'package:jopedia/modules/forget_pass/ForgetPasswordScreen.dart';
import 'package:jopedia/modules/home/HomeScreen.dart';
import 'package:jopedia/modules/register/RegisterScreen.dart';
import 'package:jopedia/shared/components/component.dart';

import '../../bloc/states.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var FormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if(state is LoginSuccessState)
          {
              navigateAndFinish(
                context,
                Home_layout(),
              );
          }
        },
        builder: (BuildContext context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Color(0xffF6F9FA),
            appBar: AppBar(
              backgroundColor: Color(0xffF6F9FA),
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: FormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: MyText(
                          text: 'Login',
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          colors: Color(0xff0F4C5C),
                        ),
                      ),
                      SizedBox(height: 40.0,),
                      DefaultTextField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          PrefixIcon:Icons.email,
                          hint: 'Email Address',
                          validateTixt: "Email"
                      ),
                      SizedBox(height: 20.0,),
                      DefaultTextField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          PrefixIcon:Icons.lock,
                          SuffixIcon:cubit.isPassword ? Icons.visibility_off: Icons.visibility,
                          hint: 'Password',
                          isPassword:cubit.isPassword,
                          validateTixt: "Password",
                          SuffixPress: (){
                            cubit.changePasswordVisibility();
                          }
                      ),
                      SizedBox(height: 20.0,),
                      MaterialButton(
                        color: Color(0xff50B3CF),
                        minWidth: double.infinity,
                        height: 50.0,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: ()
                        {
                          cubit.userLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                        },
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text: 'Don\'t have an account ?',
                            fontSize: 12.0,
                            colors:Color(0xff0F4C5C).withOpacity(0.4),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder:(context)=>RegisterScreen(),),
                              );
                            },
                            child: MyText(
                              text: 'Register now',
                              colors: Color(0xff50B3CF),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text: 'Did you forget password ?',
                            fontSize: 12.0,
                            colors:Color(0xff0F4C5C).withOpacity(0.4),
                          ),
                          TextButton(
                            onPressed: () {

                              Navigator.push(context, MaterialPageRoute(
                                builder:(context)=>ForgetPasswordScreen(),),);

                            },
                            child: MyText(
                              text: 'Change password',
                              colors: Color(0xff50B3CF),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}