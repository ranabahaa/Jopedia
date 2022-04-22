import 'package:flutter/material.dart';
import 'package:jopedia/shared/components/component.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var PhoneNumberController = TextEditingController();
  var NameController = TextEditingController();

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
                onType:(){},
                hint: 'Full name',
              ),
              SizedBox(
                height: 20.0,
              ),
              DefaultTextField(
                controller: emailController,
                type: TextInputType.emailAddress,
                onType:(){},
                SuffixIcon:Icons.email,
                hint: 'Email',
              ),
              SizedBox(
                height: 20.0,
              ),
              DefaultTextField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                onType:(){},
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
                onType:(){},
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
                onType:(){},
                hint: 'Phone number',


              ),

              SizedBox(
                height: 50.0,
              ),

              DefaultButton(text: 'Register',function :(){}),

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