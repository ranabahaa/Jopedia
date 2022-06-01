import 'package:flutter/material.dart';
import 'package:jopedia/models/job/job_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jopedia/models/user/user_model.dart';
import 'package:jopedia/shared/components/component.dart';
import 'package:jopedia/modules/job_progress/JobProgressScreen.dart';
import 'package:jopedia/modules/requests/RequestScreen.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import 'package:jopedia/models/request/request_model.dart';
import 'package:jopedia/models/services/DataController.dart';

class ContractScreen extends StatelessWidget {
  UserModel user;
  String jobId;
  ContractScreen(this.user,this.jobId);
  var color = Color(0xff50B3CF);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppBloc(),
      child:BlocConsumer<AppBloc, AppState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            return Scaffold(
              appBar: AppBar(
               // title: Text(''),
                // You can add title here
                leading: new IconButton(
                  icon: new Icon(
                    Icons.arrow_back_ios_outlined,
                    color:  color,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.white12,
                //You can make this transparent
                elevation: 0.0, //No shadow
              ),
              body: Center(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text:'Contract',
                            colors: color,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                          SizedBox(width: 3,),
                          Icon(
                            Icons.content_paste,
                            color:  color,
                            size: 23,

                          ),
                        ],
                      ),
                    ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF5F7F7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*0.75,
                              child: Column(
                                children: [
                                  FutureBuilder<PostDataModel?>(
                                    future: AppBloc.get(context).ShowContract(jobId),
                                    //AppBloc.get(context).ShowContract(),
                                    builder: (context,snapshot){
                                      if (snapshot.hasError) {
                                        return Text('something went wrong ! ${snapshot.error}');
                                      }
                                      else if (snapshot.hasData) {
                                        final post = snapshot.data!;
                                        return BuildPost(post);
                                      }
                                      else {
                                        return Center(child: CircularProgressIndicator(),);
                                      }
                                    },
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0,top: 20,right: 0,bottom: 23),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: 110,
                                          height: 35,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: color, // background
                                              onPrimary: Colors.white, // foreground
                                              minimumSize: Size(70, 36),
                                              maximumSize: Size(100, 66),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => RequestScreen(user)),
                                              );
                                            },
                                            child: MyText(
                                              text: 'Disagree',
                                              fontSize: 16.7,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        SizedBox(
                                          width: 110,
                                          height: 35,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: color, // background
                                              onPrimary: Colors.white, // foreground
                                              minimumSize: Size(70, 36),
                                              maximumSize: Size(100, 66),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => JobProgressScreen(user,jobId)),
                                              );
                                            },
                                            child: MyText(
                                              text: 'Agree',
                                              fontSize: 16.7,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
  Widget BuildPost(PostDataModel post)=> Padding(
    padding: const EdgeInsets.only(left: 15,top: 15,right: 15,bottom: 0),
    child: Container(
        width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Note: make sure to read the details carefully',
                    colors: Colors.black26 ,
                    fontSize: 15,
                    ),
                ],
              ),
              SizedBox(height: 14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Description: ',
                    colors: Colors.black54 ,
                    fontSize: 15.5,
                  ),
                ],
              ),
              SizedBox(height: 5,),
              MyText(
                text: '${post.DISCREPTION}',
                colors: Colors.black54,
                fontSize: 14,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  MyText(
                    text: 'Salary:  ',
                    colors: Colors.black54,
                    fontSize: 15,
                  ),
                  MyText(
                    text:post.JOB_SALARY.toString(),
                    colors: Colors.black54,
                    fontSize: 14,
                  ),
                ],
              ),
              Row(
                children: [
                  MyText(
                    text: 'Start Date:  ',
                    colors: Colors.black54,
                    fontSize: 15,
                  ),
                  MyText(
                    text:post.StartDate.toString(),
                    colors: Colors.black54,
                    fontSize: 14,
                  ),
                ],
              ),
              Row(
                children: [
                  MyText(
                    text: 'Expected Start Time:  ',
                    colors: Colors.black54,
                    fontSize: 15,
                  ),
                  MyText(
                    text:post.StartTime.toString(),
                    colors: Colors.black54,
                    fontSize: 14,
                  ),
                ],
              ),
              Row(
                children: [
                  MyText(
                    text: 'Expected End Time:  ',
                    colors: Colors.black54,
                    fontSize: 15,
                  ),
                  MyText(
                    text:post.EndTime.toString(),
                    colors: Colors.black54,
                    fontSize: 14,
                  ),
                ],
              ),
            ],
          )
      ),
  );

}
