import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jopedia/shared/components/component.dart';
import '../../bloc/cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:jopedia/modules/button_widget.dart';

class trytimer extends StatefulWidget {
    trytimer({Key? key}) : super(key: key);

  @override
  State<trytimer> createState() => _trytimerState();
}

class _trytimerState extends State<trytimer> {
  //var color = Color(0xff2fff);
  double progress = 120.0;
  var color = Color(0xff50B3CF);
  static const maxSeconds = 50;
  int seconds = maxSeconds;
  Timer? timer;
  void resetTimer() => setState(()=>seconds = maxSeconds);
  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(Duration(milliseconds: 50), (_) {
     // setState(() => seconds--);
       if(seconds>0){
      setState(() => seconds--);
      }
      else
        {
          stopTimer(reset: false);
        }
    });
  }
  void stopTimer({bool reset = true}){
    if(reset){
      resetTimer();
    }
    setState(() =>timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF6F9FA),
        elevation: 0.0,
        titleSpacing: 20.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color:  color,
          ),
        ),
        actions: [
          MaterialButton(
            child:MyText(
              text:'Cancel',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              colors: color,
            ),
            onPressed:(){

            },

          ),
        ],

      ),
      body: Container(
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTimer(),
              const SizedBox(height: 50),
              BuildButtons(),
            ],
          ),
        ),
      ),
    );
  }
  Widget BuildButtons(){
      final isRunning = timer == null ? false : timer!.isActive;
      final isCompleted = seconds == maxSeconds || seconds == 0 ;
      return isRunning  || !isCompleted ?
      Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            button_widget(
              text: isRunning ?  'Pause' : 'Resume',
              onClicked: (){
                if (isRunning) {
                  stopTimer(reset: false);
                }
                else{
                  startTimer(reset: false);
                }
              },
            ),
            SizedBox(width: 20.0,),
            button_widget(
              text:'Cancel' ,
              onClicked: (){
                stopTimer();
              },
            ),
          ],
        ),
      ): button_widget(
          text:'start timer' ,
          onClicked: (){
        startTimer();
      },);
  }
  Widget buildTimer() => SizedBox(
    width: 200,
    height: 200,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          value: seconds/maxSeconds,
          valueColor: AlwaysStoppedAnimation(Colors.white),
          backgroundColor: color,
          strokeWidth: 12,
        ),
        Center(
        child: BuildTime(),
        ),
      ]
    ),
  );
  Widget BuildTime(){
    if(seconds==0){
      return Icon(Icons.done,color: Colors.white,size: 112,);
    }
    else
    {
      return MyText(
          text:'$seconds',
          fontSize: 35.0
      );
    }

  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

