import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jopedia/models/job/job_model.dart';
import 'package:jopedia/models/services/DataController.dart';
import 'package:jopedia/models/user/user_model.dart';
import 'package:jopedia/modules/job_view/JobViewScreen.dart';
import 'package:jopedia/shared/components/component.dart';
import '../job_view/JobViewScreen.dart';

class SearchScreen extends StatefulWidget {
  final UserModel? user;
  const SearchScreen({Key? key, this.user}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final DataController dataController = DataController();
  late QuerySnapshot<Map<String, dynamic>> snapshotData;
  bool isExecuted = false;
  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                print("KK");
                PostDataModel post = PostDataModel.fromJson(snapshotData.docs[index].data(), snapshotData.docs[index].id);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobViewScreen(job: post, user: widget.user),
                  ),
                );


              },
              child: Stack(
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
                          image: AssetImage("assets/images/painter.jpg"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 125.0,
                      left: 250.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 6,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 17.0,
                        backgroundColor:
                            /*cubit.isSaveTrue
                      ? Color(0xff50B3CF)
                      : */
                            Colors.white,
                        child: SvgPicture.asset(
                          "assets/icons/bookmark.svg",
                          height: 15.0,
                          width: 15.0,
                          color: /*cubit.isSaveTrue
                        ? Colors.white
                        : */
                              Color(0xff50B3CF),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 155.0,
                      right: 200.0,
                    ),
                    child: Text(
                      snapshotData.docs[index].get('JOB_TITLE'),
                      style: TextStyle(
                        color: Color(0xff060F27),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 185.0,
                      //left: 30.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/alarm-clock.svg",
                              height: 10.0,
                              width: 11.0,
                              color: Color(0xff50B3CF),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              snapshotData.docs[index].get('StartDate'),
                              style: TextStyle(
                                color: Color(0xff818181),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/marker.svg",
                              height: 10.0,
                              width: 11.0,
                              color: Color(0xff50B3CF),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              snapshotData.docs[index].get('JOB_LOCATION'),
                              style: TextStyle(
                                color: Color(0xff818181),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/money.svg",
                              height: 10.0,
                              width: 11.0,
                              color: Color(0xff50B3CF),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              snapshotData.docs[index].get('JOB_SALARY'),
                              style: TextStyle(
                                color: Color(0xff818181),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
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
          );
          // return ListTile(
          //   // leading: CircleAvatar(
          //   //   backgroundImage:
          //   //   NetworkImage(snapshotData.docs[index].get('image')),
          //   // ),
          //   onTap: (){
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => JobViewScreen())
          //     );
          //
          //   },
          //   title: Text(
          //     snapshotData.docs[index].get('JOB_TITLE'),
          //     style: TextStyle(
          //         color: Colors.black,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 22.0),
          //   ),
          //   subtitle: Text(
          //     snapshotData.docs[index].get('JOB_LOCATION'),
          //     style: TextStyle(
          //         color: Colors.black,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 22.0),
          //   ),
          // );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  dataController.queryData(searchController.text).then((value) {
                    snapshotData = value;
                    setState(() {
                      isExecuted = true;
                    });
                  });
                }),
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {

                  setState(() {
                    isExecuted = false;
                  });
                })
          ],
          title: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: 'Search', hintStyle: TextStyle(color: Colors.white)),
            controller: searchController,
          ),
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
        body: isExecuted
            ? searchedData()
            : Container(
                child: Center(child: Text('Search any job')),
              )
    );
  }
}
