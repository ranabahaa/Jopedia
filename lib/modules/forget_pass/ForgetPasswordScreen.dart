import 'package:flutter/material.dart';
import 'package:jopedia/shared/components/component.dart';

class ForgetPasswordScreen extends StatelessWidget {
  var ConfirmpasswordController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 60.0,
                ),
                DefaultTextField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  SuffixIcon:Icons.remove_red_eye,
                  hint: 'New Password',

                ),
                SizedBox(
                  height: 20.0,
                ),
                DefaultTextField(
                  controller: ConfirmpasswordController,
                  type: TextInputType.visiblePassword,
                  SuffixIcon:Icons.remove_red_eye,
                  hint: 'Confirm-Password',

                ),
                SizedBox(
                  height: 50.0,
                ),
                DefaultButton(text: 'Save password',function :(){}),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}