import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  int notificationNumber=1;
  var color = Color(0xff0F4C5C);

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
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.0,
              ),
              Text(
                'you have ${notificationNumber}',
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
                'New Notifications',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 30.0,
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
                      SizedBox(
                        height: 15.0,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index)=>BuildChatItem(),
                        separatorBuilder: (BuildContext context, int index)=>SizedBox(
                          height: 25.0,
                        ),
                        itemCount: 1,
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
              color: Color(0xff26A4BD).withOpacity(0.3),
              offset: Offset(0, 3), //(x,y)
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: MyText(
                      text: 'Rana Bahaa',
                      overflow: TextOverflow.ellipsis,
                      colors: color,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height:1.0),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),

                      ),
                      child: MyText(
                        text: 'transfered 250 LE to you',
                        overflow: TextOverflow.ellipsis,
                        colors: Color(0xff26A4BD),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: IconButton(
                onPressed: (){},
                icon:SvgPicture.asset(
                "assets/icons/cross-small.svg",
                height: 18.0,
                width: 18.0,
                color:Colors.red,
              ),
              ),
            ),
          ],
        ),
      );
}

