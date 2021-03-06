import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jopedia/bloc/cubit.dart';
import 'package:jopedia/bloc/states.dart';
import 'package:jopedia/models/services/DataController.dart';
import 'package:jopedia/models/user/user_model.dart';
import 'package:jopedia/modules/home/home_cubit.dart';
import 'package:jopedia/modules/home/home_states.dart';
import 'package:jopedia/modules/job_view/JobViewScreen.dart';
import 'package:jopedia/modules/search/SearchScreen.dart';
import 'package:jopedia/shared/components/component.dart';

import '../../models/job/job_model.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RangeValues _currentRangeValues = const RangeValues(100, 500);

  String dropdownvalue = 'Cairo';
  final DataController dataController = DataController();
  QuerySnapshot? snapshotData;
  List<PostDataModel> posts = [];

  void loadData() async{
    print(posts.length);
    posts = [];
    posts.clear();
    setState(() {
      posts.addAll(AppBloc.get(context).posts.where((element) => element.JOB_LOCATION == dropdownvalue
          && double.parse(element.JOB_SALARY) >= _currentRangeValues.start
          && double.parse(element.JOB_SALARY) <= _currentRangeValues.end
          && element.MORE_THAN_DAY == AppBloc.get(context).isDuration
      ));
    });
    print(posts.length);
  }

  @override
  void initState() {
    posts.addAll(AppBloc.get(context).posts);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild started!");
    return BlocConsumer<AppBloc, AppState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          print("Rebuild started and got here!");
          var cubit = AppBloc.get(context);

          /*PostDataModel posts = cubit.posts[2];
          print(posts.DISCREPTION);*/

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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Image(
                        width: 300.0,
                        /*fit: BoxFit.cover,*/
                        image: AssetImage(
                            "assets/images/final.png"),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 580.0,
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
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xffE9F1F6),
                                ),
                                width: 270.0,
                                height: 30,

                              ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, left: 12.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Color(0xffE9F1F6),
                                        ),
                                        width: 270.0,
                                        height: 30,
                                        child: GestureDetector(
                                          onTap: () async {
                                            await AppBloc.get(context).GetUserData();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SearchScreen(user: cubit.user_model,)),
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.search_rounded,
                                                color: Color(0xff7C9EA9),
                                                size: 21.0,
                                              ),
                                              SizedBox(
                                                width: 15.0,
                                              ),
                                              Text(
                                                'Search Jobs',
                                                style: TextStyle(
                                                  color: Color(0xff7C9EA9),
                                                  fontSize: 15.0,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 55.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Color(0xff50B3CF),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                        context: context,
                                        enableDrag: false,
                                        builder: (context) => FilterWidget(
                                            cubit: cubit,
                                          onComplete: (range, country){
                                              setState(() {
                                                _currentRangeValues = range;
                                                dropdownvalue = country;
                                                loadData();

                                              });
                                          },
                                          onClear: (){
                                              setState(() {
                                                posts.clear();
                                                posts.addAll(cubit.posts);

                                              });


                                          },
                                        ),
                                      );
                                      },
                                      icon: SvgPicture.asset(
                                        "assets/icons/settings-sliders (1).svg",
                                        height: 18.0,
                                        width: 18.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ListView.separated(
                                  itemCount: posts.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  separatorBuilder:(context, index) => myDivider(),
                                  itemBuilder: (context, index) => buildPostItem (posts[index],context)

                            ),
                            SizedBox(height: 18.0,),
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

Widget buildPostItem (PostDataModel post,context) =>  Column(
  children: <Widget>[
    InkWell(
      onTapDown: (_){
        UserModel user = AppBloc.get(context).user_model;
        AppBloc.get(context).JopView();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JobViewScreen(job: post,user: user),
          ),
        );
        /*print(post.JOBID);*/
        /*print(post.USER_ID);*/
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment:
          AlignmentDirectional.topCenter,
          children: [
            Container(
              height: 220.0,
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
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 135.0,
                width: 315.0,
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(10.0),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        '${post.IMAGE}'),
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
                  borderRadius:
                  BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 6,
                      offset: Offset(0,
                          2), // changes position of shadow
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    if(AppBloc.get(context).savedId!.contains(post.JOBID)){
                      AppBloc.get(context).deleteSaveJob(post.JOBID);
                    }
                    else
                      {
                        AppBloc.get(context).SaveJob(post.JOBID);
                      }
                    AppBloc.get(context).GetSavedPostsData();
                    /*AppBloc.get(context).SavePost(AppBloc.get(context).postsId![index],index);*/
                   /* if (cubit.isSaveTrue ==
                        false) {
                      cubit.isSaveTrueYes();
                    } else {
                      cubit.isSaveTrueNo();
                    }*/
                  },
                  child: CircleAvatar(
                    radius: 17.0,
                    backgroundColor:
                    AppBloc.get(context).savedId!.contains(post.JOBID)
                        ? Color(0xff50B3CF)
                        : Colors.white,
                    child: SvgPicture.asset(
                      "assets/icons/bookmark.svg",
                      height: 15.0,
                      width: 15.0,
                      color: AppBloc.get(context).savedId!.contains(post.JOBID)
                          ? Colors.white
                          : Color(0xff50B3CF),
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

class FilterWidget extends StatefulWidget {
  final AppBloc cubit;
  final VoidCallback onClear;
  final Function(RangeValues, String) onComplete;
  const FilterWidget({Key? key, required this.cubit, required this.onComplete, required this.onClear}) : super(key: key);


  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  RangeValues _currentRangeValues = const RangeValues(100, 9900);

  String dropdownvalue = 'Cairo';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:
          [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0xffA2BBCD),
              ),
              child: Padding(

                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    'Filter',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Salary',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Color(0xff0F4C5C),
              ),
            ),
            SizedBox(height: 10.0,),
            RangeSlider(
              activeColor: Color(0xff50B3CF),
              values: _currentRangeValues,
              max: 10000,
              divisions: 20,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  print(values.end);
                  _currentRangeValues = values;
                });
              },
            ),
            SizedBox(height: 10.0,),
            Text(
              'Duration',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Color(0xff0F4C5C),
              ),
            ),
            SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Expanded(
                  child: GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        widget.cubit.isDurationYes();
                      });
                    },
                    child: Container(
                      height: 40.0,
                      color:widget.cubit.isDuration ? Color(0xff50B3CF):Colors.white,
                      child: Center(
                        child: Text(
                          'One day',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color:  widget.cubit.isDuration ? Colors.white:Color(0xff50B3CF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        widget.cubit.isDurationNo();
                      });
                    },
                    child: Container(
                      height: 40.0,
                      color:  widget.cubit.isDuration ? Colors.white:Color(0xff50B3CF),
                      child: Center(
                        child: Text(
                          'More than a day',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: widget.cubit.isDuration ? Color(0xff50B3CF):Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Text(
              'Location',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Color(0xff0F4C5C),
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,),
                child: DropdownButton<String>(
                  hint:Text(dropdownvalue),
                  value: dropdownvalue,
                  items: <String>['Cairo', 'Alexandria', 'Marsa Matruh', 'Hurghada','Giza','South Sinai','North Sinai','Suez','Beheira','Sharqia','Dakahlia','Kafr el-Sheikh','Monufia','Minya','Gharbia','Faiyum','Qena','Asyut','Sohag','Ismailia','Beni Suef','Qalyubia','Aswan','Damietta','Port Said','Luxor'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue)
                  {
                    setState(() {
                      dropdownvalue=newValue!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 13.0,),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Color(0xff50B3CF),
                    height: 40.0,
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: ()
                    {
                      print(
                          _currentRangeValues);
                      print(dropdownvalue);
                      print( widget.cubit.isDuration);
                      widget.onComplete(_currentRangeValues, dropdownvalue);
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                MaterialButton(
                    color: Color(0x97cf5050),
                    height: 40.0,
                    child: Text(
                      'Clear',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: ()
                    {
                      widget.onClear();
                      Navigator.pop(context);
                    },

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

