import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:intl/intl.dart';
import 'package:jopedia/modules/button_widget.dart';
import '../../bloc/cubit.dart';
import '../../layout/home_layout.dart';
import '../../models/user/user_model.dart';
import '../../shared/components/component.dart';
import 'package:jopedia/models/job/job_model.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

var CommentController = TextEditingController();
double rating=3;
var mod;
var dataJob;
var dataUser;
var dataWorker;


class JobProgressScreen extends StatefulWidget {

  String? jobId;
  JobProgressScreen({this.jobId});

  @override
  _JobProgressScreenState createState() => _JobProgressScreenState();
}

class _JobProgressScreenState extends State<JobProgressScreen> {
  bool visible = false;
  bool jobCompletedVisisbility = false;
  bool startJobVisibility = true;
  Duration duration = Duration();
  /*var initialIndicatorValue=0.0;
  var incIndecatorBy=0.001;*/
  //var sum ;
  //var lastIndicatorValue=initialIndicatorValue +incIndecatorBy;
  int totalSeconds = 60;
  int totalMinutes=30;
  int totalHours=60;
  double progressFraction = 0.0;
  int percentage = 0;
  var sec;
  var mins;
  var hrs;
  var totalTime;
  Timer? timer;
  var color = Color(0xff50B3CF);

/*void initState(){

}*/
  //void resetTimer() => setState(()=>seconds = maxSeconds);
  void startTimer() {
    ReadTime();

    timer = Timer.periodic(Duration(seconds: 1 ), (_) {

      visible=true;
      if(sec>0){
        if (mounted) {
          setState(() => sec--);
        }
      }
      if (sec==0){
        if (mounted) {
          setState(
                  () => mins--);
          setState(()=> sec=60);
          setState(()=> sec--);
        }
      }
      if ((sec==0 && mins==0 ) || mins<0){
        if (mounted) {
          setState(() => hrs--);
          setState(()=> mins=60);
          setState(()=> sec=0);
        }
      }
      if (mounted) {
        setState(() {
          totalTime=totalMinutes+totalHours+totalSeconds;
          // progressFraction = (totalSeconds - sec) / totalSeconds;
          progressFraction = ((totalMinutes+hrs) - mins) / totalMinutes;
          percentage = (progressFraction*100).floor();

        });
      }


    });
  }
  void stopTimer(){
    setState(() =>timer?.cancel());
    startJobVisibility =false;
  }
  Future<PostDataModel?> ReadTime() async {
    final DocPost = FirebaseFirestore.instance.collection('post').doc(widget.jobId);
    final snapshot = await DocPost.get();
    if(snapshot.exists){
      //final post = snapshot.data!;
      final data = PostDataModel.fromJson(snapshot.data()!, snapshot.id);
      final startTime = data.StartTime;
      final endTime = data.EndTime;
      var format = DateFormat("hh:mm a");
      var one = format.parse(startTime);
      var two = format.parse(endTime);
      var jobDuration = two.difference(one);
      hrs = jobDuration.inHours;
      var minscalc = jobDuration.inMinutes;
      mins = minscalc%60;
      var seccalc = jobDuration.inSeconds;
      sec = seccalc%mins;

      print(startTime);
      print(endTime);
      print(jobDuration);
      print(hrs);
      print(mins);
      print(seccalc);
      print(minscalc);
      print(sec);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
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
              fontWeight: FontWeight.w600,
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: MyText(
                    text: 'Current Progress',
                    colors:  color,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
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
            Padding(
              padding: const EdgeInsets.only(left:0.0 ,top: 130.0,right: 0,bottom: 0),
              child: Center(
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //  SizedBox(height: 30,),
                    Visibility(
                        visible: visible,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                MyText(
                                  text:"Job Has Started",
                                  fontSize: 23.0,
                                  //fontWeight: FontWeight.bold,
                                  colors: color,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0,),
                            buildTimer(),
                          ],
                        )
                    ),
                    const SizedBox(height: 50),
                    BuildButtons(),
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left:0.0 ,top: 0.0,right: 0,bottom: 40),
              child: Visibility(
                visible:jobCompletedVisisbility ,
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
                        CompleteJob();
                      },

                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildTime2(){
    // 9 transforms to 09
    // 11 stays 11
    String twoDigits (int n) => n.toString().padLeft(2,'0');
    return MyText(
      text: '$hrs:$mins:$sec',
      colors: color,
      fontSize: 27,
    );
  }
  Widget BuildButtons(){
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = (sec == hrs && hrs==mins) || (sec == 0 && mins==0 && hrs==0);
    //(sec == 0 && mins==0 && hrs==0);
    return isRunning  || !isCompleted ?
    Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 0.0,),
        ],
      ),
    ): Container(
      width: 180,
      height: 43,
      child: Visibility(
        visible: startJobVisibility,
        child: button_widget(
          text:'Start Job',
          onClicked: (){
            startTimer();
            jobCompletedVisisbility=true;
            FirebaseFirestore.instance.collection('post')
                .doc("ov7WJUtAdwxYG7rBv311").get().then((value) {
              print("true");
            }).catchError((onError) {
              print(onError.toString());
              print("false");
            });

          },),
      ),
    );
  }
  Widget buildTimer() => SizedBox(
    width: 200,
    height: 200,
    child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 0.0,
            //value: progressFraction,
            valueColor: AlwaysStoppedAnimation(Color(0xffEAF2F5)),
            backgroundColor: color,
            strokeWidth: 13,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildTime(),
                //buildTime2(),
              ],
            ),
          ),
        ]
    ),
  );
  Widget BuildTime(){
    //if(sec==0 && mins==0 && hrs==0)
    if(sec==0 && mins==0 && hrs==0){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:0.0 ,top: 10.0,right: 0,bottom: 0),
            child: Icon(Icons.done,color: Color(0xff2ABC6E),size: 112,),
          ),
          SizedBox(height: 10,),
          MyText(text: 'Finished', colors: color),
        ],
      );
    }
    else
    {
      //return buildTime2();
      return MyText(
        text: '$hrs:$mins:$sec',
        colors: color,
        fontSize: 26,
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
                  stopTimer();
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


  Future<UserModel?> CompleteJob() async {

    final user = FirebaseAuth.instance.currentUser;
    //read job data

    final Docjob = FirebaseFirestore.instance.collection('post').doc(
        widget.jobId);
    final snapshot = await Docjob.get();
    dataJob = PostDataModel.fromJson(snapshot.data()!, widget.jobId);
    print(dataJob.JOB_SALARY);

    //read user data

    final Docuser = FirebaseFirestore.instance.collection('users').doc(
        dataJob.USER_ID);
    final snapshot2 = await Docuser.get();
    dataUser = UserModel.fromJson(snapshot2.data()!);
    print(dataUser.balance);
    print(dataUser.balance + int.parse(dataJob.JOB_SALARY));

    // read worker data

    final Docworker = FirebaseFirestore.instance.collection('users').doc(
        dataJob.WORKER_ID);
    final snapshot3 = await Docworker.get();
    dataWorker = UserModel.fromJson(snapshot3.data()!);

    // update the user data

    final Userupdate = FirebaseFirestore.instance.collection('users').doc(
        dataJob.USER_ID);

    // update the job data

    final jobupdate = FirebaseFirestore.instance.collection('post').doc(
        widget.jobId);

    // update the worker data

    final Workerupdate = FirebaseFirestore.instance.collection('users').doc(
        dataJob.WORKER_ID);
    print(dataJob.FLAG);

    //Conditions
    if (dataJob.FLAG == '0') {
      // update the job data
      jobupdate.update({
        'FLAG':user!.uid.toString(),
      });
      print(dataJob.FLAG);
      // Rate and review pop up
      showDialog(
          context: context,
          builder: ( context) {
            return StatefulBuilder(
              builder: (context,setState){
                return  AlertDialog(
                  title: Center(
                    child: Text(
                      'Rate Your Previous Job',
                      style: TextStyle(
                        color: Color(0xffF087874),
                      ),
                    ),
                  ),
                  content: Container(
                    width: 300,
                    height: 230,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        SizedBox(
                          height: 20,
                        ),
                        SmoothStarRating(
                          size: 40,
                          spacing: 15,
                          starCount: 5,
                          rating: rating ,
                          filledIconData: Icons.star,
                          borderColor: Colors.yellow,
                          color: Colors.yellow,
                          onRatingChanged: (v){
                            setState(() {
                              rating=v;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: CommentController,
                          maxLines: 6,
                          decoration: InputDecoration(
                              hintText: 'Comments',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Color(0xffF087874)
                                  )
                              ),
                              hintStyle: TextStyle(
                                  color: Color(0xffF087874)
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center ,
                      children: [
                        FlatButton(
                          onPressed: () {

                            Navigator.of(context).pop();
                          },
                          textColor: Color(0xffF087874),
                          child: Text('Close'),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        FlatButton(
                          onPressed: () {
                            if(user!.uid== dataJob.USER_ID) {
                              print('user rated worker');
                              jobupdate.update({
                                'WORKER_RATE': rating.toString(),
                                'WORKER_REVIEW': CommentController.text,
                              });
                            }
                            else{
                              print('worker rated user');
                              jobupdate.update({
                                'USER_RATE': rating.toString(),
                                'USER_REVIEW': CommentController.text,
                              });
                            }
                            print(CommentController.text);
                            print(rating);
                            showDialog(
                                context: context,
                                builder: ( context) {
                                  return StatefulBuilder(
                                    builder: (context,setState){
                                      return  AlertDialog(
                                        title: Center(
                                          child: Text(
                                            'Thank you for Rating',
                                            style: TextStyle(
                                              color: Color(0xffF087874),
                                            ),
                                          ),
                                        ),
                                        actions:[
                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.center ,
                                            children: [
                                              FlatButton(
                                                onPressed: () async {
                                                  final Docuser = FirebaseFirestore.instance.collection('users').doc(
                                                      user!.uid);
                                                  final snapshot2 = await Docuser.get();
                                                  dataUser = UserModel.fromJson(snapshot2.data()!);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => Home_layout(dataUser)),
                                                  );
                                                },
                                                textColor: Color(0xffF087874),
                                                child: Text('Close'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => WalletScreen()),
                            // );
                          },
                          textColor: Color(0xffF087874),
                          child: Text('Submit'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          }
      );
    }
    else if(dataJob.FLAG == user!.uid.toString()){
      print ('you already submit wait for other party');
    }
    else  {
      // update the worker data
      Workerupdate.update({
        'balance': dataWorker.balance + int.parse(dataJob.JOB_SALARY),
      });
      // update the job data
      jobupdate.update({
        'COMPLETED_JOB': '3',
      });
      // update the user data
      Userupdate.update({
        'balance': dataUser.balance - int.parse(dataJob.JOB_SALARY),
      });
      //Rate and reviw pop up
      showDialog(
          context: context,
          builder: ( context) {
            return StatefulBuilder(
              builder: (context,setState){
                return  AlertDialog(
                  title: Center(
                    child: Text(
                      'Rate Your Previous Job',
                      style: TextStyle(
                        color: Color(0xffF087874),
                      ),
                    ),
                  ),
                  content: Container(
                    width: 300,
                    height: 230,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        SizedBox(
                          height: 20,
                        ),
                        SmoothStarRating(
                          size: 40,
                          spacing: 15,
                          starCount: 5,
                          rating: rating ,
                          filledIconData: Icons.star,
                          borderColor: Colors.yellow,
                          color: Colors.yellow,
                          onRatingChanged: (v){
                            setState(() {
                              rating=v;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: CommentController,
                          maxLines: 6,
                          decoration: InputDecoration(
                              hintText: 'Comments',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Color(0xffF087874)
                                  )
                              ),
                              hintStyle: TextStyle(
                                  color: Color(0xffF087874)
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center ,
                      children: [
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          textColor: Color(0xffF087874),
                          child: Text('Close'),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        FlatButton(
                          onPressed: () {
                            if(user!.uid== dataJob.USER_ID) {
                              print('user rated worker');
                              jobupdate.update({
                                'WORKER_RATE': rating.toString(),
                                'WORKER_REVIEW': CommentController.text,
                              });
                            }
                            else{
                              print('worker rated user');
                              jobupdate.update({
                                'USER_RATE': rating.toString(),
                                'USER_REVIEW': CommentController.text,
                              });
                            }
                          },
                          textColor: Color(0xffF087874),
                          child: Text('Submit'),
                        ),
                      ],
                    ),

                  ],
                );
              },
            );
          }
      );
    }
  }

}


@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}