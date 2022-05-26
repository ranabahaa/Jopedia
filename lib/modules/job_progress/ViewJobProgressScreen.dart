
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jopedia/bloc/cubit.dart';
import 'package:jopedia/modules/job_progress/JobProgressScreen.dart';
import '../../../bloc/cubit.dart';
import '../../../bloc/states.dart';
import 'package:jopedia/shared/components/component.dart';
import '../../../models/job/job_model.dart';
import '../../../models/user/user_model.dart';

class ViewJobProgressScreen extends StatefulWidget {
  @override
  State<ViewJobProgressScreen> createState() => _ViewJobProgressScreenState();
}


class _ViewJobProgressScreenState extends State<ViewJobProgressScreen> {
  var color = Color(0xff50B3CF);

  List<PostDataModel> posts = [];
  GetCurrentJobsData() {
    FirebaseFirestore.instance.collection('post').where('COMPLETED_JOB',isEqualTo: 2).get().then((value) {
      value.docs.forEach((element) {
        posts.add(PostDataModel.fromJson(element.data(), element.id));
      });
      print(GetPostsDataSuccsess());
    }).catchError((error) {
      print(error.toString());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(''),
        // You can add title here
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios_outlined,
            color: color,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white12,
        //You can make this transparent
        elevation: 0.0, //No shadow
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.89,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30,top: 10,right:30,bottom: 0,),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 15.0,
                                  ),
                                  MyText(
                                    text: 'Jobs In Progress',
                                    colors: Color(0xff0F4C5C),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ), //all and neaby
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 2.0,
                                width: 156.0,
                                color: Color(0xff50B3CF),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: ListView.separated(
                            itemCount: AppBloc.get(context).currentPosts.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder:(context, index) => myDivider(),
                            itemBuilder: (context, index) => buildPostItem (AppBloc.get(context).currentPosts[index],context)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildprogress(){
    //ReadTime();
    GetCurrentJobsData();
    return Column(
      children: [
        MyText(text:'hello',colors: color),
      ],
    );
  }

  Widget buildPostItem (PostDataModel post,context) =>  Column(
    children: <Widget>[
      InkWell(
        onTapDown: (_){
          UserModel? user;
          AppBloc.get(context).GetUserData();
          user = AppBloc.get(context).user_model;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JobProgressScreen(),
            ),
          );
          /*print(post.JOBID);
        print(post.USER_ID);*/
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 0,top: 10,right: 0,bottom: 10),
          child: Container(
            height: 100.0,
            width: 330.0,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey
                      .withOpacity(0.16),
                  spreadRadius: 5,
                  blurRadius: 6,
                  offset: Offset(0,3), // changes position of shadow
                ),
              ],
            ),
            child:   Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        right: 0.0,
                        left: 20,
                        bottom: 25,
                      ),
                      child: Text(
                        '${post.JOB_TITLE}',
                        style: TextStyle(
                          color: Color(0xff060F27),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0.0,
                    //left: 30.0,
                  ),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/alarm-clock.svg",
                            height: 10.0,
                            width: 11.0,
                            color: Color(0xff50B3CF),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            '${post.StartDate}',
                            style: TextStyle(
                              color:
                              Color(0xff818181),
                              fontFamily: 'Poppins',
                              fontWeight:
                              FontWeight.w300,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/marker.svg",
                            height: 10.0,
                            width: 11.0,
                            color: Color(0xff50B3CF),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            '${post.JOB_LOCATION}',
                            style: TextStyle(
                              color:
                              Color(0xff818181),
                              fontFamily: 'Poppins',
                              fontWeight:
                              FontWeight.w300,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/money.svg",
                            height: 10.0,
                            width: 11.0,
                            color: Color(0xff50B3CF),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            '${post.JOB_SALARY}',
                            style: TextStyle(
                              color:
                              Color(0xff818181),
                              fontFamily: 'Poppins',
                              fontWeight:
                              FontWeight.w300,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
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
  );
}

