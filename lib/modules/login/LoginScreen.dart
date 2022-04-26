import 'package:flutter/material.dart';
import 'package:jopedia/modules/forget_pass/ForgetPasswordScreen.dart';
import 'package:jopedia/modules/register/RegisterScreen.dart';
import 'package:jopedia/shared/components/component.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff50B3CF)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                onType:(){},
                PrefixIcon:Icons.email,
                hint: 'Email Address',
              ),
              SizedBox(
                height: 40.0,
              ),
              DefaultTextField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                onType:(){},
                PrefixIcon:Icons.lock,
                SuffixIcon:Icons.remove_red_eye,
                hint: 'Password',
                isPassword:true,

              ),
              SizedBox(
                height: 60.0,
              ),
              DefaultButton(text: 'LOGIN',function :(){}),

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
    );
  }
}