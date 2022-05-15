import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:jopedia/modules/button_widget.dart';
import '../../bloc/cubit.dart';
import '../../shared/components/component.dart';

class JobProgressScreen extends StatefulWidget {
  const JobProgressScreen({Key? key}) : super(key: key);

  @override
  _JobProgressScreenState createState() => _JobProgressScreenState();
}

class _JobProgressScreenState extends State<JobProgressScreen> {
  double progress2 = 120.0;
  double progress = 120.0;
  static const maxSeconds = 50;
  int seconds = maxSeconds;
  Timer? timer;
  var color = Color(0xff50B3CF);

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
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },

          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: MyText(
                      text: 'Current Progress',
                      colors:  color,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 7.0,
                ),
                Icon(
                  Icons.bike_scooter,
                  color:  color,

                ),
              ],
            ),
            SizedBox(height: 50.0,),
            Column(
             crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                
                Row(
                  children: [
                    MyText(
                      text:"Timer".toUpperCase(),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      colors: color,
                    ),
                    Expanded(
                      child: Slider(
                        value:progress2,
                        max: 220.0,
                        min: 80.0,
                        onChanged:(value){
                          setState(() {
                            progress = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0,bottom: 30.0),
              child: FittedBox(
                child: Container(
                  width: 220.0,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10.0),
                  ) ,
                  child: MaterialButton(
                    child:MyText(
                        text:"job Completed".toUpperCase(),
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                    onPressed:(){
                    },

                  ),
                ),
              ),
            ),
          ],
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
        mainAxisAlignment: MainAxisAlignment.center,
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
      return Icon(Icons.done,color: Colors.redAccent,size: 112,);
    }
    else
    {
      return MyText(
          text:'$seconds',
          fontSize: 35.0
      );
    }

  }
  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: color,

      content: Column(

        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            'Are you sure you want to cancel this job ?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),

          Text(
            'WARNNING : ',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 13.5,
            ),
          ),

        ],
      ),
      actions:[
        Row(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: TextButton(
                child: Text("yes cancel".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),),
                onPressed: (){
                  FirebaseFirestore.instance.collection('post')
                      .doc("ov7WJUtAdwxYG7rBv311").delete().then((value) {
                    print("true");
                    Navigator.pop(context);
                  }).catchError((onError) {
                    print(onError.toString());
                    print("false");
                  });
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}


@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}