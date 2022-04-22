import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jopedia/modules/job_view/JobViewScreen.dart';
import 'package:jopedia/modules/search/SearchScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAllTrue = true;
  bool isSaveTrue = false;


  @override
  Widget build(BuildContext context) {
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
          child: Column
            (
            children:
            [
              SizedBox(height: 5.0,),
              Text(
                'Total Balance',
                style: TextStyle
                  (
                  color: Color(0xffC6DFE8),
                  fontSize: 18.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.0,),
              Text(
                '1732.00 LE',
                style: TextStyle
                  (
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
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
          children: [
            Expanded(
              child: Container(
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          GestureDetector(
                            onTap: ()
                            {
                              setState(() {
                                isAllTrue=true;
                              });
                            },
                            child: Column(
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 15.0,
                                    ),
                                    Text('All',
                                      style: TextStyle
                                        (
                                        color: Color(0xff0F4C5C),
                                        fontSize: 15.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),  //all
                                  ],
                                ), //all and neaby
                                SizedBox(height: 10.0,),
                                Container(
                                  height: 2.0,
                                  width: 150.0,
                                  color: isAllTrue ? Color(0xff50B3CF) : Color(0xffFFFFF),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50.0,),
                          GestureDetector(
                            onTap: ()
                            {
                              setState(() {
                                isAllTrue=false;
                              });
                            },
                            child: Column(
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 15.0,
                                    ),
                                    Text('Nearby',
                                      style: TextStyle
                                        (
                                        color: Color(0xff0F4C5C),
                                        fontSize: 15.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0,),
                                Container(
                                  height: 2.0,
                                  width: 150.0,
                                  color: isAllTrue ? Color(0xffFFFFFF) : Color(0xff50B3CF),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Stack(
                            children: [
                             /* Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xffE9F1F6),
                                ),
                                width: 270.0,
                                height: 30,

                              ),*/
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0,left: 12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xffE9F1F6),
                                  ),
                                  width: 270.0,
                                  height: 30,
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SearchScreen()),
                                      );
                                    },
                                    child: Row(
                                      children:
                                      [
                                        Icon(
                                          Icons.search_rounded,
                                          color: Color(0xff7C9EA9),
                                          size: 21.0,
                                        ),
                                        SizedBox(width: 18.0,),
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
                          SizedBox(width: 10.0,),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 30.0,
                                width: 55.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xff50B3CF),
                                ),
                              ),
                              IconButton(onPressed: ()
                              {

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
                      SizedBox(height: 20.0,),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            InkWell(
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
                                            image:AssetImage("assets/images/painter.jpg"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top:125.0 ,
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
                                          onTap: ()
                                          {
                                            setState(() {
                                              if(isSaveTrue==false)
                                              {
                                                isSaveTrue=true;
                                              }
                                              else
                                              {
                                                isSaveTrue=false;
                                              }
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: 17.0,
                                            backgroundColor: isSaveTrue ? Color(0xff50B3CF):Colors.white,
                                            child: SvgPicture.asset(
                                              "assets/icons/bookmark.svg",
                                              height: 15.0,
                                              width: 15.0,
                                              color:isSaveTrue ? Colors.white :Color(0xff50B3CF),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top:155.0 ,
                                        right:200.0 ,
                                      ),
                                      child: Text(
                                        'Wall painter',
                                        style: TextStyle(
                                          color: Color(0xff060F27),
                                          fontFamily: 'Poppins',
                                          fontWeight:FontWeight.w600,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                    Padding(

                                      padding: const EdgeInsets.only(
                                        top: 185.0,
                                        //left: 30.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:
                                        [
                                          Row(
                                            children:
                                            [
                                              SvgPicture.asset(
                                                "assets/icons/alarm-clock.svg",
                                                height: 10.0,
                                                width: 11.0,
                                                color: Color(0xff50B3CF),
                                              ),
                                              SizedBox(width: 8.0,),
                                              Text(
                                                'Monday',
                                                style: TextStyle(
                                                  color: Color(0xff818181),
                                                  fontFamily: 'Poppins',
                                                  fontWeight:FontWeight.w300,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 20.0,),
                                          Row(
                                            children:
                                            [
                                              SvgPicture.asset(
                                                "assets/icons/marker.svg",
                                                height: 10.0,
                                                width: 11.0,
                                                color: Color(0xff50B3CF),
                                              ),
                                              SizedBox(width: 8.0,),
                                              Text(
                                                'Cairo, Hellwan',
                                                style: TextStyle(
                                                  color: Color(0xff818181),
                                                  fontFamily: 'Poppins',
                                                  fontWeight:FontWeight.w300,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 20.0,),
                                          Row(
                                            children:
                                            [
                                              SvgPicture.asset(
                                                "assets/icons/money.svg",
                                                height: 10.0,
                                                width: 11.0,
                                                color: Color(0xff50B3CF),
                                              ),
                                              SizedBox(width: 8.0,),
                                              Text(
                                                '250 LE',
                                                style: TextStyle(
                                                  color: Color(0xff818181),
                                                  fontFamily: 'Poppins',
                                                  fontWeight:FontWeight.w300,
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
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder:(context)=>JobViewScreen(),),);
                              },
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
      ],
    );
  }
}