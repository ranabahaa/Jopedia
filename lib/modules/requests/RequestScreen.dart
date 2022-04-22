import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  void initState() {
    super.initState();
  }
  int notificationNumber=4;

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
            color: Colors.teal,
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
                    'you have',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color(0xff31836D),
                    ),
                  ),
                  Text(
                    ' $notificationNumber',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color(0xff0CA6B7),
                    ),
                  ),
                  Text(
                    ' new notifications',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color(0xff31836D),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xff0CA6B7),
                    ),
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 0.0, top: 5.0),
                    child: CircleAvatar(
                      radius: 4.0,
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ), //today text
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index)=>BuildChatItem(),
                separatorBuilder: (BuildContext context, int index)=>SizedBox(
                  height: 20.0,
                ),
                itemCount: 1,
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
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Rana Bahaa',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff0CA6B7),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        width: 25.0,
                        height: 25.0,
                        margin: EdgeInsets.fromLTRB(125.0, 10.0, 0.0, 0.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.5, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.all(0),
                          minWidth: 0,
                          onPressed: (){},
                          child: Icon(
                            Icons.close_rounded,
                            color: Color(0xffBB0B0B),
                            size: 22.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'transfered 250 LE to you',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff31836D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),

                  Text('sbwkwdewo'),



                ],
              ),
            ),

          ],
        ),
      );
}