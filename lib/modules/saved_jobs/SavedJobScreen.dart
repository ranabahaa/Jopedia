import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavedJobScreen extends StatefulWidget {
  @override

  State<SavedJobScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<SavedJobScreen> {



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [

        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(

                  padding: const EdgeInsets.all(20.0),
                  child: Column(

                    children: [

                      Stack(
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
                              //left: 10.0,
                            ),
                            child: Container(


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
                                  Container(
                                    // width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,

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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(

                  padding: const EdgeInsets.all(20.0),
                  child: Column(

                    children: [

                      Stack(
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
                              //left: 10.0,
                            ),
                            child: Container(


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
                                  Container(
                                    // width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,

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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(

                  padding: const EdgeInsets.all(20.0),
                  child: Column(

                    children: [

                      Stack(
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
                              //left: 10.0,
                            ),
                            child: Container(


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
                                  Container(
                                    // width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,

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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(

                  padding: const EdgeInsets.all(20.0),
                  child: Column(

                    children: [

                      Stack(
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
                              //left: 10.0,
                            ),
                            child: Container(


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
                                  Container(
                                    // width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,

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

      ],

    );
  }
}