import 'package:flutter/material.dart';
import 'package:jopedia/modules/login/LoginScreen.dart';
import 'package:jopedia/modules/register/RegisterScreen.dart';

class StartApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F9FA),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Color(0xffF6F9FA),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Expanded(
            child: Image(
              width: 300.0,
              /*fit: BoxFit.cover,*/
              image: AssetImage(
                  "assets/images/L O G O.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              color: Color(0xff50B3CF),
              minWidth: double.infinity,
              height: 50.0,
              child: Text(
                'Create account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=>RegisterScreen(),),);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 40.0,),
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder:(context)=>LoginScreen(),),);
            },
              child: Text(
              'I have account',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Color(0xff50B3CF),
              ),
            ),),
          ),
        ],
      ),
    );
  }
}