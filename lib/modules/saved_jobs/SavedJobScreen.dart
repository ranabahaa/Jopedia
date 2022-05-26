import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../../models/job/job_model.dart';
import '../../shared/components/component.dart';
import '../job_view/JobViewScreen.dart';
import '../search/SearchScreen.dart';

class SavedJobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = AppBloc.get(context);

        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff50B3CF),
                  Color(0xff0F4C5C),
                ],
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${cubit.savedPosts?.length} posts saved',
                    style: TextStyle(
                      color: Color(0xffC6DFE8),
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Saved Jobs',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 35.0,
                        fontWeight: FontWeight.w800,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(3, 3),
                              blurRadius: 15),
                        ]),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 600.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.separated(
                              itemCount: cubit.savedPosts!.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) => myDivider(),
                              itemBuilder: (context, index) => buildPostItem(
                                  cubit.savedPosts![index], context)),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget buildPostItem(PostDataModel post, context) => Column(
        children: <Widget>[
          InkWell(
            onTapDown: (_) {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobViewScreen(job: post,user: AppBloc.get(context).user_model),
                ),
              );
              /*print(post.JOBID);*/
              /*print(post.USER_ID);*/
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    height: 220.0,
                    width: 330.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.16),
                          spreadRadius: 5,
                          blurRadius: 6,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 135.0,
                      width: 315.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/painter.jpg"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 125.0,
                      left: 250.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 6,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          AppBloc.get(context).deleteSaveJob(post.JOBID);
                          AppBloc.get(context).GetSavedPostsData();
                          /*AppBloc.get(context).SavePost(AppBloc.get(context).postsId![index],index);*/
                          /*if (cubit.isSaveTrue ==
                        false) {
                      cubit.isSaveTrueYes();
                    } else {
                      cubit.isSaveTrueNo();
                    }*/
                        },
                        child: CircleAvatar(
                          radius: 17.0,
                          backgroundColor:Color(0xff50B3CF),
                          child: SvgPicture.asset(
                            "assets/icons/bookmark.svg",
                            height: 15.0,
                            width: 15.0,
                            color: Colors.white,

                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 155,left: 30.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${post.JOB_TITLE}',
                          style: TextStyle(
                            color: Color(0xff060F27),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          /*mainAxisAlignment:
                    MainAxisAlignment.center,*/
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
                              width: 25.0,
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
                              width: 25.0,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JobViewScreen(),
          ),
        );*/
            },
          ),
        ],
      );
}
