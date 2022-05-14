import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/layout/home_layout_cubit.dart';
import 'package:jopedia/layout/home_layout_state.dart';
import 'package:jopedia/models/user/user_model.dart';
import 'package:jopedia/modules/create_job/CreateJobScreen.dart';
import 'package:jopedia/modules/home/HomeScreen.dart';
import 'package:jopedia/modules/login/LoginScreen.dart';
import 'package:jopedia/modules/my_profile/ProfilePage.dart';
import 'package:jopedia/modules/notification/NotificationScreen.dart';
import 'package:jopedia/modules/requests/RequestScreen.dart';
import 'package:jopedia/modules/saved_jobs/SavedJobScreen.dart';
import 'package:jopedia/modules/wallet/WalletScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home_layout extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=> HomeLayoutCubit(),
      child:BlocConsumer <HomeLayoutCubit,HomeLayoutState>(
        listener: (BuildContext context,state){},
        builder: (BuildContext context,state){
          var cubit = HomeLayoutCubit.get(context);
          UserModel? model ;
          model = cubit.GetUserData();
          return Scaffold(
            body: cubit.screen[cubit.currentIndex],
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
                  onTap: (index) {
                    cubit.currentIndexChange(index);
                  },
                  currentIndex: cubit.currentIndex,
                  selectedItemColor:Color(0xff50B3CF),
                  selectedLabelStyle: TextStyle(
                    color: Color(0xff50B3CF),
                    fontWeight: FontWeight.w600,
                    fontSize: 10.0,
                    fontFamily: 'Poppins',
                  ),
                  unselectedLabelStyle: TextStyle(
                    color:Color(0xffA2BBCD),
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                    fontFamily: 'Poppins',
                  ),
                  backgroundColor: Color(0xffE9F1F6),
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/home.svg",
                        height: 23.0,
                        width: 23.0,
                        color:
                        cubit.currentIndex == 0 ? Color(0xff50B3CF) : Color(0xffA2BBCD),
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
                        cubit.currentIndex == 1 ? Color(0xff50B3CF) : Color(0xffA2BBCD),
                      ),
                      label: 'Notification',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/comment (1).svg",
                        height: 23.0,
                        width: 23.0,
                        color:
                        cubit.currentIndex == 2 ? Color(0xff50B3CF) : Color(0xffA2BBCD),
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
                        cubit.currentIndex == 3 ? Color(0xff50B3CF) : Color(0xffA2BBCD),
                      ),
                      label:
                      'Wallet',
                    ),
                  ],

                ),
              ),
            ),
            floatingActionButton: Container(
              height: 50.0,
              width: 50.0,
              child: FloatingActionButton(
                onPressed: () {
                  cubit.GetUserData();
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
                              'Welcome ${model!.name}',
                              style: TextStyle
                                (
                                color: Color(0xff0F4C5C),
                                fontSize: 15.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${model.email}',
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
                    async{
                      await _auth.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
