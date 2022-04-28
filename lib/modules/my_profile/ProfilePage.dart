import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jopedia/layout/home_layout.dart';
import 'package:jopedia/models/user/user.dart';
import 'package:jopedia/modules/edit_profile/EditProfilePage.dart';
import 'package:jopedia/utils/user_preferences.dart';
import 'package:jopedia/widget/appbar_widget.dart';
import 'package:jopedia/widget/numbers_widget.dart';
import 'package:jopedia/widget/profile_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final user = UserPreferences.myUser;

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          extendBodyBehindAppBar: true,

          appBar: buildAppBar(context),

          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/drawer.jpeg',
                        ),
                        radius: 35.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Bakr',
                            style: TextStyle(
                              color: Color(0xff0F4C5C),
                              fontSize: 15.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'aboubakrahmed@gmail.com',
                            style: TextStyle(
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
                SizedBox(
                  height: 5.0,
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home_layout()),
                      );
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/home.svg",
                      height: 17.0,
                      width: 17.0,
                      color: Color(0xff0F4C5C),
                    ),
                  ),
                  title: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home_layout()),
                      );
                    },
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: Color(0xff0F4C5C),
                        fontSize: 17.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 5.0,
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/bookmark.svg",
                      height: 17.0,
                      width: 17.0,
                      color: Color(0xff0F4C5C),
                    ),
                  ),
                  title: Text(
                    'Saved Jobs',
                    style: TextStyle(
                      color: Color(0xff0F4C5C),
                      fontSize: 17.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 5.0,
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.all_inbox,
                      size: 20.0,
                      color: Color(0xff0F4C5C),
                    ),
                  ),
                  title: Text(
                    'Requests',
                    style: TextStyle(
                      color: Color(0xff0F4C5C),
                      fontSize: 17.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 5.0,
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.live_tv_rounded,
                      size: 20.0,
                      color: Color(0xff0F4C5C),
                    ),
                  ),
                  title: Text(
                    'Live',
                    style: TextStyle(
                      color: Color(0xff0F4C5C),
                      fontSize: 17.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 5.0,
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.logout_outlined,
                      size: 20.0,
                      color: Color(0xff0F4C5C),
                    ),
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Color(0xff0F4C5C),
                      fontSize: 17.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),

          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
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
                      child: Column(children: [
                        SizedBox(
                          height: 100.0,
                        ),
                        ProfileWidget(
                          imagePath: user.imagePath,
                          onClicked: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => EditProfilePage()),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('Steve Jobedia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'bitedApple@13promax.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        )
                      ]),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.grey[200],
                      child: Center(
                          child: Card(
                              margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                              child: Container(
                                  width: 450.0,
                                  height: 290.0,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: TabBar(
                                              controller: _tabController,
                                              labelColor: Colors.black,
                                              unselectedLabelColor: Colors.grey,
                                              tabs: [
                                                Tab(text: "About Me"),
                                                Tab(text: "Jobs"),
                                                Tab(text: "Reviews"),
                                              ]),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          height: 200,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TabBarView(
                                                controller: _tabController,
                                                children: [
                                                  buildAbout(user),
                                                  Text('Previous Jobs'),
                                                  Text('Reviews'),
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )))),
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.45,
                  left: 40.0,
                  right: 40.0,
                  child: Card(
                      child: FractionallySizedBox(
                        widthFactor: 1.0,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: NumbersWidget(),
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
}
