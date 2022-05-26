import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../../models/user/user_model.dart';
import '../../modules/login/LoginScreen.dart';
import '../../modules/my_profile/ProfilePage.dart';
import '../../modules/requests/RequestScreen.dart';
import '../../modules/saved_jobs/SavedJobScreen.dart';

class MyDrawer extends StatelessWidget {
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppBloc(),
      child: BlocConsumer<AppBloc, AppState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          AppBloc cubit = AppBloc.get(context);
          return Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(cubit.user_model.image),
                          radius: 36.0,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage(cubit.user_model)),
                          );
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome ${cubit.user_model.name}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xff0F4C5C),
                                fontSize: 15.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${cubit.user_model.email}',
                              style: TextStyle(
                                color: Color(0xffA2BBCD),
                                fontSize: 10.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                  title: GestureDetector(
                    child: Text(
                      'Saved Jobs',
                      style: TextStyle(
                        color: Color(0xff0F4C5C),
                        fontSize: 17.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SavedJobScreen()),
                    );
                  },
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
                  title: GestureDetector(
                    child: Text(
                      'Requests',
                      style: TextStyle(
                        color: Color(0xff0F4C5C),
                        fontSize: 17.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RequestScreen(cubit.user_model)),

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => RequestScreen(user)),
                    );
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_location_rounded,
                      size: 20.0,
                      color: Color(0xff0F4C5C),
                    ),
                  ),
                  title: Text(
                    'About Us',
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
                  onTap: () async {
                    await _auth.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
