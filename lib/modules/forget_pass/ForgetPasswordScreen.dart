import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jopedia/shared/components/component.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgetPasswordScreen>{
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff50B3CF)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Change Password',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    'Receive an email to reset your password',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.0,
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

                MaterialButton(
                  color: Color(0xff50B3CF),
                  minWidth: double.infinity,
                  height: 45.0,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                          Icons.email,
                        color: Colors.white,
                      ),

                      SizedBox(
                        width: 7.0,
                      ),

                      Text(
                        'Reset Password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onPressed: verifyEmail,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),

      ),
    );

    Future verifyEmail() async{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());


    }
  }
