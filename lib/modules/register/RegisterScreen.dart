import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jopedia/modules/login/LoginScreen.dart';
import 'package:jopedia/shared/components/component.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var PhoneNumberController = TextEditingController();
  var NameController = TextEditingController();

  final _auth = FirebaseAuth.instance;

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
                  'Create Account',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  'Get started with new account',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
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
                controller: emailController,
                type: TextInputType.emailAddress,
                SuffixIcon:Icons.email,
                hint: 'Email',
              ),
              SizedBox(
                height: 20.0,
              ),
              DefaultTextField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                SuffixIcon:Icons.remove_red_eye,
                hint: 'Password',
                isPassword:true,
              ),
              SizedBox(
                height: 20.0,
              ),
              DefaultTextField(
                controller: confirmPasswordController,
                type: TextInputType.visiblePassword,
                SuffixIcon:Icons.remove_red_eye,
                hint: 'Re-Password',
                isPassword:true,

              ),
              SizedBox(
                height: 20.0,
              ),
              DefaultTextField(
                controller: PhoneNumberController,
                type: TextInputType.number,
                hint: 'Phone number',
              ),
              SizedBox(
                height: 50.0,
              ),

              MaterialButton(

                color: Color(0xff50B3CF),
                minWidth: double.infinity,
                height: 40.0,
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: ()
                async {
                  var email= emailController.text;
                  var password = passwordController.text;
                 try{
                   await _auth.createUserWithEmailAndPassword(
                     email: email,
                     password: password,
                   );
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => LoginScreen()),
                   );
                 }
                 catch(error){
                   print(error);
                 }
                },
              ),

              SizedBox(
                height: 10.0,
              ),

            ],
          ),
        ),

      ),
    );
  }
}