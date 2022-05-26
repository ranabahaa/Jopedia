import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jopedia/bloc/cubit.dart';
import 'package:jopedia/layout/home_layout.dart';
import 'package:jopedia/models/job/job_model.dart';
import 'package:jopedia/models/user/user.dart';
import 'package:jopedia/models/user/user_model.dart';
import 'package:jopedia/modules/edit_profile/EditProfilePage.dart';
import 'package:jopedia/shared/components/component.dart';
import 'package:jopedia/utils/user_preferences.dart';
import 'package:jopedia/widget/numbers_widget.dart';
import 'package:jopedia/widget/profile_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

import '../../shared/components/component.dart';
import '../login/LoginScreen.dart';
import '../requests/RequestScreen.dart';
import '../saved_jobs/SavedJobScreen.dart';


class ProfilePage extends StatefulWidget {
  UserModel user;
  ProfilePage(this.user);



  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {

  List<PostDataModel> posts = [];
  QuerySnapshot? snapshotData;

  void loadData() async{
    print(posts.length);
    posts = [];
    posts.clear();
    setState(() {
      posts.addAll(AppBloc.get(context).posts.where((element) => element.WORKER_ID == widget.user.uId
      ));
    });
    print(posts.length);
  }


  @override
  void initState(){
    posts = [];
    posts.clear();
    setState(() {
      posts.addAll(AppBloc.get(context).posts.where((element) => element.WORKER_ID == widget.user.uId
      ));
    });
    super.initState();
  }
  // Widget searchedData() {
  //   return ListView.builder(
  //     itemCount: snapshotData?.docs.length ?? 0,
  //     itemBuilder: (BuildContext context, int index) {
  //       print("----- $index");
  //       print(snapshotData?.docs);
  //       var work = snapshotData?.docs[index].get("WORKER_ID").toString();
  //       print(work);
  //       return Container(
  //         height: 80.0,
  //         margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(10.0),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Color(0xff26A4BD),
  //               offset: Offset(0, 2), //(x,y)
  //               blurRadius: 6.0,
  //             ),
  //           ],
  //         ),
  //         child: Row(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: CircleAvatar(
  //                 radius: 30.0,
  //                 backgroundImage: AssetImage('assets/images/profile.JPG'),
  //               ),
  //             ),
  //             SizedBox(
  //               width: 20.0,
  //             ),
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Container(
  //                     margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
  //                     child: Text(
  //                       snapshotData?.docs[index].get('JOB_ID') ?? "N/A",
  //                       maxLines: 1,
  //                       overflow: TextOverflow.ellipsis,
  //                       style: TextStyle(
  //                         //color: color,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 16.0,
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 12),
  //                   Row(
  //                     children: [
  //                       Container(
  //                           margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
  //                           width: 55,
  //                           height: 30,
  //                           decoration: BoxDecoration(
  //                             color: Colors.white,
  //                             borderRadius: BorderRadius.circular(5.0),
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 color: Colors.grey,
  //                                 //offset: Offset(0.5, 0.5), //(x,y)
  //                                 blurRadius: 3.5,
  //                               ),
  //                             ],
  //                           ),
  //                           child: Padding(
  //                             padding: const EdgeInsets.only(left: 4, top: 2),
  //                             child: MyText(
  //                                 text: snapshotData?.docs[index]
  //                                     .get('JOB_SALARY') ??
  //                                     "N/A",
  //                                 ),
  //                           )),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Column(
  //               children: [
  //                 Row(
  //                   children: [
  //                     Container(
  //                       width: 25.0,
  //                       height: 25.0,
  //                       margin: EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 0.0),
  //                       decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius: BorderRadius.circular(20.0),
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: Colors.grey,
  //                             //offset: Offset(0.5, 0.5), //(x,y)
  //                             blurRadius: 4.0,
  //                           ),
  //                         ],
  //                       ),
  //                       child: MaterialButton(
  //                         padding: EdgeInsets.all(0),
  //                         minWidth: 0,
  //                         onPressed: () async {
  //                           await FirebaseFirestore.instance
  //                               .collection("request")
  //                               .doc(snapshotData?.docs[index].id)
  //                               .delete();
  //                           loadData();
  //                           print(snapshotData?.docs[index].get('WORKER_ID'));
  //                         },
  //                         child: Icon(
  //                           Icons.close_rounded,
  //                           color: Color(0xffBB0B0B),
  //                           size: 22.0,
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       width: 25.0,
  //                       height: 25.0,
  //                       margin: EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 0.0),
  //                       decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius: BorderRadius.circular(20.0),
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: Colors.grey,
  //                             //  offset: Offset(0.5, 1.0), //(x,y)
  //                             blurRadius: 4.0,
  //                           ),
  //                         ],
  //                       ),
  //                       child: MaterialButton(
  //                         padding: EdgeInsets.all(0),
  //                         minWidth: 0,
  //                         onPressed: () async {
  //                           print("Started..");
  //                           await FirebaseFirestore.instance
  //                               .collection("post")
  //                               .doc(snapshotData?.docs[index].get("JOB_ID"))
  //                               .update({
  //                             "COMPLETED_JOB": "2",
  //                           });
  //                           await FirebaseFirestore.instance
  //                               .collection("post")
  //                               .doc(snapshotData?.docs[index].get("JOB_ID"))
  //                               .update({
  //                             "WORKER_ID": "$work" ,
  //                           });
  //
  //                           QuerySnapshot value = await FirebaseFirestore
  //                               .instance
  //                               .collection("request")
  //                               .where("JOB_ID",
  //                               isEqualTo:
  //                               snapshotData?.docs[index].get("JOB_ID"))
  //                               .get();
  //
  //                           value.docs.forEach((element) async {
  //                             print("Deleting ${element.id}..");
  //                             await FirebaseFirestore.instance
  //                                 .collection("request")
  //                                 .doc(element.id)
  //                                 .delete();
  //                           });
  //
  //                           FirebaseFirestore.instance
  //                               .collection("request")
  //                               .doc(snapshotData?.docs[index].id)
  //                               .delete();
  //                           print("Done...");
  //                           loadData();
  //                           print("Done all!");
  //                         },
  //                         child: Icon(
  //                           Icons.check,
  //                           color: Colors.green,
  //                           size: 22.0,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    print(posts.length);
    var h=3.2;

    return Scaffold(


      extendBodyBehindAppBar: true,
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
                      imagePath: widget.user.image,
                      onClicked: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage(widget.user)),
                        );
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),


                    Text(
                          widget.user.name,
                          //'nnn',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      widget.user.email,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    RatingStars(
                      iconSize: 25,
                      rating: 3.5,
                      editable: false,
                      color: Colors.amber,
                    )
                  ]),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                      child: Card(
                          child: Container(
                              width: 450.0,
                              height: 500.0,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: TabBar(

                                          controller: _tabController,
                                          labelColor: Colors.black,
                                          indicatorColor: Color(0xff50B3CF),
                                          unselectedLabelColor: Colors.grey,
                                          tabs: [
                                            Tab(text: "About Me"),
                                            Tab(text: "Jobs & Reviews"),
                                            //Tab(text: "Reviews"),
                                          ]),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      height: 320,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TabBarView(
                                            controller: _tabController,
                                            children: [
                                              buildAbout(),
                                              SingleChildScrollView(
                                               child: ListView.separated(
                                                padding: EdgeInsets.zero,
                                                itemCount: posts.length,
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                separatorBuilder:(context, index) => myDivider(),
                                                itemBuilder: (context, index) => buildRateItem (posts[index],context)

                                            ),
                                          ),
                                              //Text('Reviews'),
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
        ],
      ),
      appBar: AppBar(
        //leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit Profile',
              onPressed: () {
                print(posts.length);
                print(widget.user.uId);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage(widget.user)),
                );
              }),

        ],
      ),
      drawer: Drawer(
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
                      backgroundImage: AssetImage(widget.user.image),
                      radius: 36.0,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage(widget.user)),
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
                          /*'Welcome ${user.name}'*/'a',
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
                          '${widget.user.email}',
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
                      builder: (context) => RequestScreen(widget.user)),

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
                await FirebaseAuth.instance.signOut();
                navigateAndFinish(
                  context,
                  LoginScreen(),
                );
              },
            ),
          ],
        ),
      ),
    );


  }
  Widget buildRateItem (PostDataModel post,context) =>  Container(
    height: 80.0,
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
            backgroundImage: AssetImage('assets/images/WallPainter.jpg'),
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
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      '${post.JOB_TITLE}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 7.0, 0.0, 0.0),

                    child: RatingStars(
                      iconSize: 15,
                      rating: double.parse(post.WORKER_RATE),
                      editable: false,
                      color: Colors.amber,
                    ),
                  )
                ],
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Container(

                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      width: 80,
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
                        padding: const EdgeInsets.only(left: 4, top: 2),
                        child: MyText(
                          colors: Colors.black,
                            text: '${post.WORKER_REVIEW}',
                            ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  // Widget buildName() => Column(
  //       children: [
  //         Text(
  //           'name',
  //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           'email',
  //           style: TextStyle(color: Colors.grey),
  //         )
  //       ],
  //     );

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
