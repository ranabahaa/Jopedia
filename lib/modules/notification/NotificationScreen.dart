import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jopedia/shared/components/component.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  void initState() {
    super.initState();
  }
  int notificationNumber=4;
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
        padding: EdgeInsets.only(left: 18.0,top:25 ,right:18.0 ,bottom:0.0 ),
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
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget BuildChatItem()=>
      FractionallySizedBox(
        widthFactor: 1.0,
        child: Container(
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
          child: FractionallySizedBox(
            widthFactor: 1.0,
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0 ,top:8.0 ,right: 0.0,bottom: 3.0),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('assets/images/profile.JPG'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:0.0 ,top:0.0 ,right:70.0 ,bottom: 5.0),
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
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'transfered 250 LE to you',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff31836D),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: FractionallySizedBox(
                          widthFactor: 1.0,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              height: 31,
                              child: RawMaterialButton(
                                onPressed: () {},
                                elevation: 3.0,
                                fillColor: Colors.white,
                                child: Icon(
                                  Icons.close_rounded,
                                  color: Colors.redAccent,
                                  size: 25.0,
                                ),
                                padding: EdgeInsets.all(0.0),
                                shape: CircleBorder(),
                              ),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
