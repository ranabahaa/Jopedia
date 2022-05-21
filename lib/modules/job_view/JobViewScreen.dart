import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jopedia/models/job/job_model.dart';
import 'package:jopedia/shared/components/component.dart';

//import 'dart:html';
import 'dart:ui';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class JobViewScreen extends StatelessWidget {

  String? jobID;
  JobViewScreen({this.jobID});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = AppBloc.get(context);

          /*PostDataModel posts = cubit.posts[2];
          print(posts.DISCREPTION);*/

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xff0F4C5C),
                  size: 25.0,
                ),
              ),
              backgroundColor: Color(0xffF6F9FA),
              elevation: 0,
            ),
            body: Container(
              width: double.infinity,
              height: 600.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 135.0,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/painter.jpg"),
                      ),
                    ),
                  ), //pic
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/img.png',
                            ),
                            radius: 25.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Amira zakaria',
                                style: TextStyle(
                                  color: Color(0xff0F4C5C),
                                  fontSize: 15.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '5:35 pm',
                                style: TextStyle(
                                  color: Color(0xffA2BBCD),
                                  fontSize: 10.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ), //profile
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'wall painter',
                            style: TextStyle(
                              color: Color(0xff818181),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            ' a wall painter refers to a qualified individual who is professionally '
                            'responsible for painting the interiors and exteriors of a building and some other surfaces'
                            ' kkkkkkkkkkthat require paint in consultation with the building owners. His/her job description entails selecting the '
                            'right paints, ensuring that surfaces are well-prepared by cleaning them, repairing and applying touch-ups to '
                            'lemished areas, and executing other necessary tasks to ensure that the client or customer is satisfied with the '
                            'final result.',
                            style: TextStyle(
                              color: Color(0xffA2BBCD),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 11.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), //wall
                  Container(
                    width: double.infinity,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                'Monday',
                                style: TextStyle(
                                  color: Color(0xff818181),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(width: 20.0,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                'Cairo, Hellwan',
                                style: TextStyle(
                                  color: Color(0xff818181),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //SizedBox(width: 20.0,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                '250 LE',
                                style: TextStyle(
                                  color: Color(0xff818181),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff08787F),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: MaterialButton(
                      color: Color(0xff50B3CF),
                      minWidth: double.infinity,
                      height: 50.0,
                      child: MyText(text: "apply"),
                      onPressed: () {
                        AppBloc.get(context).GetCurrentPost(jobID!);
                        /*print(AppBloc.get(context).model);*/
                        showDialog  (
                          context: context,
                          builder: (BuildContext context)  =>
                              _buildPopupDialog(context,AppBloc.get(context).model,)
                        );
                      },
                    ),
                  ), //---->>DefaultButton
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget _buildPopupDialog(BuildContext context, PostDataModel? post) {
  var price_conroller = TextEditingController();
  return BlocProvider(
    create: (BuildContext context) => AppBloc(),
    child: BlocConsumer<AppBloc, AppState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return AlertDialog(
            backgroundColor: Color(0xffF6F9FA),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: 'Are you sure you want to apply for this job',
                  fontSize: 15,
                  colors: Color(0xffF087874),
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(
                  height: 5,
                ),
                /* SmoothStarRating(
                  size: 40,
                  starCount: 5,
                  rating: rating ,
                  filledIconData: Icons.star,
                  color: Colors.yellow,
                ),*/
                MyText(
                  text: 'Change price (optional)',
                  fontSize: 12,
                  colors: Color(0xffF087874).withOpacity(0.5),
                  fontWeight: FontWeight.w900,
                ),
                Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: price_conroller,
                    decoration: InputDecoration(
                      hintText: 'Price',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: MyText(
                      text: 'Cancel',
                      fontSize: 15,
                      colors: Color(0xffF087874),
                      fontWeight: FontWeight.w900,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ), //Cancel
                  SizedBox(
                    width: 40,
                  ),
                  TextButton(
                      child: MyText(
                        text: 'Apply',
                        fontSize: 15,
                        colors: Color(0xffF087874),
                        fontWeight: FontWeight.w900,
                      ),
                      onPressed: () {
                        if (price_conroller.text != '') {
                          AppBloc.get(context).SendRequest(
                            JOB_ID: post!.JOBID,
                            JOB_SALARY: price_conroller.text,
                            USER_ID: post.USER_ID,
                          );
                        } else {
                          AppBloc.get(context).SendRequest(
                            JOB_ID: "1111",
                            JOB_SALARY: "original salary",
                            USER_ID: "222",
                          );
                        }
                      }), //Apply
                ],
              ),
            ],
          );
        }),
  );
}
