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

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var FormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => login_cubit(),
      child: BlocConsumer<login_cubit, AppState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = login_cubit.get(context);
          return Scaffold(
            appBar: AppBar(backgroundColor: Color(0xff50B3CF)),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: FormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Login',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      DefaultTextField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          PrefixIcon:Icons.email,
                          hint: 'Email Address',
                          validateTixt: "Email"
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      DefaultTextField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          PrefixIcon:Icons.lock,
                          SuffixIcon:cubit.ispassword ? Icons.visibility_off: Icons.visibility,
                          hint: 'Password',
                          isPassword:cubit.ispassword,
                          validateTixt: "Password",
                          SuffixPress: (){
                            cubit.changVisibility();
                          }
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      MaterialButton(

                        color: Color(0xff50B3CF),
                        minWidth: double.infinity,
                        height: 40.0,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: ()
                        async {
                          if(FormKey.currentState!.validate()){
                            var email= emailController.text;
                            var password = passwordController.text;
                            try{
                              final user = await _auth.signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              if (user != null)
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Home_layout()),
                                );
                              }
                            }
                            catch(error){
                              print(error);
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder:(context)=>RegisterScreen(),),
                              );
                            },
                            child: Text(
                              'Register Now',
                              style: TextStyle(color: Color(0xff50B3CF)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Did you forget password?',

                          ),
                          TextButton(
                            onPressed: () {

                              Navigator.push(context, MaterialPageRoute(
                                builder:(context)=>ForgetPasswordScreen(),),);

                            },
                            child: Text(
                              'Change password',
                              style: TextStyle(color: Color(0xff50B3CF)),
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