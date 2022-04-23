import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jopedia/modules/create_job/CreateJobScreen.dart';
import 'package:jopedia/modules/home/HomeScreen.dart';
import 'package:jopedia/modules/my_profile/ProfilePage.dart';
import 'package:jopedia/modules/notification/NotificationScreen.dart';
import 'package:jopedia/modules/requests/RequestScreen.dart';
import 'package:jopedia/modules/saved_jobs/SavedJobScreen.dart';
import 'package:jopedia/modules/wallet/WalletScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class home_layout extends StatefulWidget {
  @override
  State<home_layout> createState() => _home_layoutState();
}

class _home_layoutState extends State<home_layout> {
  int currentIndex = 0;
  List<Widget> screen = [
    HomeScreen(),
    NotificationScreen(),
    SavedJobScreen(),
    WalletScreen(),
  ];
  //late Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      key: scaffoldKey,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomAppBar(
          color: Color(0xffE9F1F6),
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 8,
          child: BottomNavigationBar(
            backgroundColor: Color(0xffE9F1F6),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  height: 23.0,
                  width: 23.0,
                  color:
                  currentIndex == 0 ? Color(0xff50B3CF) : Color(0xffA2BBCD),
                ),
                label:
                  'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/bell.svg",
                  height: 23.0,
                  width: 23.0,
                  color:
                  currentIndex == 1 ? Color(0xff50B3CF) : Color(0xffA2BBCD),
                ),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/comment (1).svg",
                  height: 23.0,
                  width: 23.0,
                  color:
                  currentIndex == 2 ? Color(0xff50B3CF) : Color(0xffA2BBCD),
                ),
                label:
                  'Messages',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/credit-card (1).svg",
                  height: 23.0,
                  width: 23.0,
                  color:
                  currentIndex == 3 ? Color(0xff50B3CF) : Color(0xffA2BBCD),
                ),
                label:
                  'Wallet',
              ),
            ],
            selectedLabelStyle: TextStyle(
              color: currentIndex == 1
                  ? Color(0xff50B3CF)
                  : Color(0xffA2BBCD),
              fontWeight: FontWeight.bold,
              fontSize: 10.0,
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 50.0,
        width: 50.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder:(context)=>CreateJobScreen(),),);
          },
          child: Icon(
            Icons.add,
            size: 25.0,
          ),
          backgroundColor: Color(0xff50B3CF),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff50B3CF),
                  Color(0xff0F4C5C),
                ],
              )),
        ),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children:
          [
            DrawerHeader(
              child: Row(
                children:
                [
                  SizedBox(width: 10.0,),
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/drawer.jpeg',),
                      radius: 36.0,
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text(
                        'Welcome Bakr',
                        style: TextStyle
                          (
                          color: Color(0xff0F4C5C),
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'aboubakrahmed@gmail.com',
                        style: TextStyle
                          (
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
            SizedBox(height: 5.0,),
            ListTile(
              leading: IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  "assets/icons/bookmark.svg",
                  height: 17.0,
                  width: 17.0,
                  color: Color(0xff0F4C5C),
                ),
              ),
              title: GestureDetector(
                child: Text(
                  'Saved Jobs',
                  style: TextStyle
                    (
                    color: Color(0xff0F4C5C),
                    fontSize: 17.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SavedJobScreen()),
                );
              },
            ),
            SizedBox(height: 5.0,),
            ListTile(
              leading: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.all_inbox,
                  size: 20.0,
                  color: Color(0xff0F4C5C),
                ),
              ),
              title: GestureDetector(
                child: Text(
                  'Requests',
                  style: TextStyle
                    (
                    color: Color(0xff0F4C5C),
                    fontSize: 17.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RequestScreen()),
                );
              },
            ),
            SizedBox(height: 5.0,),
            ListTile(
              leading: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.add_location_rounded,
                  size: 20.0,
                  color: Color(0xff0F4C5C),
                ),
              ),
              title: Text(
                'About Us',
                style: TextStyle
                  (
                  color: Color(0xff0F4C5C),
                  fontSize: 17.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: ()
              {

              },
            ),
            SizedBox(height: 5.0,),
            ListTile(
              leading: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.logout_outlined,
                  size: 20.0,
                  color: Color(0xff0F4C5C),
                ),
              ),
              title: Text(
                'Logout',
                style: TextStyle
                  (
                  color: Color(0xff0F4C5C),
                  fontSize: 17.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: ()
              {

              },
            ),

          ],
        ),

      ),
    );
  }
}
