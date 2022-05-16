import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/component.dart';


class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  void initState() {
    super.initState();
  }
  int requestsNumber=4;
  var color = Color(0xff50B3CF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F9FA),
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
            color: color,
          ),
        ),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You Have',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: color,
                    ),
                  ),
                  Text(
                    ' $requestsNumber',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color(0xff0CA6B7),
                    ),
                  ),
                  Text(
                    ' Requests',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: color,
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  Icon(
                    Icons.mail_rounded,
                    color:  color,
                  ),
                ],
              ),
              SizedBox(
                height: 70.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index)=>BuildChatItem(),
                separatorBuilder: (BuildContext context, int index)=>SizedBox(
                  height: 20.0,
                ),
                itemCount: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget BuildChatItem()=>
      Container(
        height: 80.0,
        margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xff26A4BD),
              offset: Offset(0, 2), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/images/profile.JPG'),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Rana Bahaa',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(height:12),
                  Row(
                    children: [

                      Container(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          width: 55,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                //offset: Offset(0.5, 0.5), //(x,y)
                                blurRadius: 3.5,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4,top: 2),
                            child: MyText(text:'46 LE',colors: color),
                          )
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 25.0,
                      height: 25.0,
                      margin: EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 0.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            //offset: Offset(0.5, 0.5), //(x,y)
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      child:MaterialButton(
                        padding: EdgeInsets.all(0),
                        minWidth: 0,
                        onPressed: (){

                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: Color(0xffBB0B0B),
                          size: 22.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 25.0,
                      height: 25.0,
                      margin: EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 0.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                           BoxShadow(
                            color: Colors.grey,
                          //  offset: Offset(0.5, 1.0), //(x,y)
                             blurRadius: 4.0,
                          ),

                        ],
                      ),
                      child:MaterialButton(
                        padding: EdgeInsets.all(0),
                        minWidth: 0,
                        onPressed: (){

                        },
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 22.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}