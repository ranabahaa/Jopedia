import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jopedia/models/request/request_model.dart';
import 'package:jopedia/models/services/DataController.dart';
import 'package:jopedia/models/user/user_model.dart';
import 'package:jopedia/modules/contract/ContractScreen.dart';
import '../../shared/components/component.dart';

class RequestScreen extends StatefulWidget {
  UserModel user;
  RequestScreen(this.user);
  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  List<RequestDataModel> request = [];
  final DataController dataController = DataController();
  QuerySnapshot? snapshotData;
  bool isExecuted = true;



  var color = Color(0xff0F4C5C);

  void loadData() async {
    var queryStringgg = widget.user.uId;
    QuerySnapshot data = await dataController.requestData(queryStringgg);
    setState(() {
      snapshotData = data;
    });
   // print(snapshotData?.docs.length);
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Widget searchedData() {
    return ListView.builder(
      itemCount: snapshotData?.docs.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        print("----- $index");
        print(snapshotData?.docs);
        var work = snapshotData?.docs[index].get("WORKER_ID").toString();
        print(work);
        return Padding(
          padding: const EdgeInsets.only(top: 40,left: 15.0,right: 15.0),
          child: Container(
            height: 100.0,
            margin: EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
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
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 12.0,),
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
                          text: '${snapshotData?.docs[index].get('JOB_TITLE')} ',
                          overflow: TextOverflow.ellipsis,
                          colors: color,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 1.0),
                      MyText(text:' ${snapshotData?.docs[index].get('name')} -> ${snapshotData?.docs[index].get('JOB_SALARY')}',
                        colors: Color(0xff26A4BD),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection("request")
                              .doc(snapshotData?.docs[index].id)
                              .delete();
                          loadData();
                          print(snapshotData?.docs[index].get('WORKER_ID'));
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/cross-small.svg",
                          height: 30.0,
                          width: 30.0,
                          color:Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          print("Started..");
                          await FirebaseFirestore.instance
                              .collection("post")
                              .doc(snapshotData?.docs[index].get("JOB_ID"))
                              .update({
                            "COMPLETED_JOB": "2",
                          });
                          await FirebaseFirestore.instance
                              .collection("post")
                              .doc(snapshotData?.docs[index].get("JOB_ID"))
                              .update({
                            "WORKER_ID": "$work" ,
                          });

                          QuerySnapshot value = await FirebaseFirestore
                              .instance
                              .collection("request")
                              .where("JOB_ID",
                                  isEqualTo:
                                      snapshotData?.docs[index].get("JOB_ID"))
                              .get();

                          value.docs.forEach((element) async {
                            print("Deleting ${element.id}..");
                            await FirebaseFirestore.instance
                                .collection("request")
                                .doc(element.id)
                                .delete();
                          });

                          FirebaseFirestore.instance
                              .collection("request")
                              .doc(snapshotData?.docs[index].id)
                              .delete();
                          print("Done...");
                          loadData();
                          print("Done all!");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ContractScreen(widget.user,snapshotData?.docs[index].get("JOB_ID"))),
                          );
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/check (1).svg",
                          height: 20.0,
                          width: 30.0,
                          color:Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var req = snapshotData?.docs.length;

    return Scaffold(
        backgroundColor: Color(0xffF6F9FA),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text('You have $req requests',
                  style: TextStyle(
                    color: color,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center),
          ),
          backgroundColor: Color(0xffF6F9FA),
          elevation: 0,

          leading: IconButton(
            onPressed: () {
              print(widget.user.uId);
              print(snapshotData);
              print(snapshotData?.docs.length);
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: color,
            ),
          ),
        ),
        body:
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               'You Have',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 20.0,
            //                 color: color,
            //               ),
            //             ),
            //             Text(
            //               ' $requestsNumber',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 20.0,
            //                 color: Color(0xff0CA6B7),
            //               ),
            //             ),
            //             Text(
            //               ' Requests',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 20.0,
            //                 color: color,
            //               ),
            //             ),
            //             SizedBox(
            //               width: 5.0,
            //             ),
            //             Icon(
            //               Icons.mail_rounded,
            //               color: color,
            //               size: 22.7,
            //             ),
            //           ],
            //         ),
            //         SizedBox(
            //           height: 70.0,
            //         ),
            //         ListView.separated(
            //           shrinkWrap: true,
            //           physics: NeverScrollableScrollPhysics(),
            //           scrollDirection: Axis.vertical,
            //           itemBuilder: (BuildContext context, int index) =>
            //               chatItems[index],
            //           separatorBuilder: (BuildContext context, int index) => SizedBox(
            //             height: 20.0,
            //           ),
            //           itemCount: chatItems.length,
            //         ),
            //       ],
            //     ),
            //   ),
            //
            // ),
            Container(child: searchedData()));

    // Widget BuildChatItem(RequestDataModel request)=>
    //     Container(
    //       height: 80.0,
    //       margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(10.0),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Color(0xff26A4BD),
    //             offset: Offset(0, 2), //(x,y)
    //             blurRadius: 6.0,
    //           ),
    //         ],
    //       ),
    //       child: Row(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: CircleAvatar(
    //               radius: 30.0,
    //               backgroundImage: AssetImage('assets/images/profile.JPG'),
    //             ),
    //           ),
    //           SizedBox(
    //             width: 20.0,
    //           ),
    //           Expanded(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Container(
    //                   margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
    //                   child: Text(
    //                     'Rana Bahaa',
    //                     maxLines: 1,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: TextStyle(
    //                       color: color,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 16.0,
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(height:12),
    //                 Row(
    //                   children: [
    //
    //                     Container(
    //                         margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    //                         width: 55,
    //                         height: 30,
    //                         decoration: BoxDecoration(
    //                           color: Colors.white,
    //                           borderRadius: BorderRadius.circular(5.0),
    //                           boxShadow: [
    //                             BoxShadow(
    //                               color: Colors.grey,
    //                               //offset: Offset(0.5, 0.5), //(x,y)
    //                               blurRadius: 3.5,
    //                             ),
    //                           ],
    //                         ),
    //                         child: Padding(
    //                           padding: const EdgeInsets.only(left: 4,top: 2),
    //                           child: MyText(text:'46 LE',colors: color),
    //                         )
    //                     ),
    //
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Column(
    //             children: [
    //               Row(
    //                 children: [
    //                   Container(
    //                     width: 25.0,
    //                     height: 25.0,
    //                     margin: EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 0.0),
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(20.0),
    //                       boxShadow: [
    //                         BoxShadow(
    //                           color: Colors.grey,
    //                           //offset: Offset(0.5, 0.5), //(x,y)
    //                           blurRadius: 4.0,
    //                         ),
    //                       ],
    //                     ),
    //                     child:MaterialButton(
    //                       padding: EdgeInsets.all(0),
    //                       minWidth: 0,
    //                       onPressed: (){
    //                         setState(() {
    //                           chatItems.removeAt(index);
    //                         });
    //
    //                       },
    //                       child: Icon(
    //                         Icons.close_rounded,
    //                         color: Color(0xffBB0B0B),
    //                         size: 22.0,
    //                       ),
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 25.0,
    //                     height: 25.0,
    //                     margin: EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 0.0),
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(20.0),
    //                       boxShadow: [
    //                          BoxShadow(
    //                           color: Colors.grey,
    //                         //  offset: Offset(0.5, 1.0), //(x,y)
    //                            blurRadius: 4.0,
    //                         ),
    //
    //                       ],
    //                     ),
    //                     child:MaterialButton(
    //                       padding: EdgeInsets.all(0),
    //                       minWidth: 0,
    //                       onPressed: (){
    //                         setState(() {
    //                           chatItems.removeAt(index);
    //                         });
    //
    //
    //                       },
    //                       child: Icon(
    //                         Icons.check,
    //                         color: Colors.green,
    //                         size: 22.0,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     );
  }
}
