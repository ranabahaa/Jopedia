import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jopedia/models/services/DataController.dart';
import 'package:jopedia/modules/job_view/JobViewScreen.dart';
import 'package:jopedia/shared/components/component.dart';
import '../job_view/JobViewScreen.dart';

class SearchScreen extends StatefulWidget {
  //const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final DataController dataController = DataController();
  late QuerySnapshot snapshotData;
  bool isExecuted = false;
  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            // leading: CircleAvatar(
            //   backgroundImage:
            //   NetworkImage(snapshotData.docs[index].get('image')),
            // ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobViewScreen())
              );

            },
            title: Text(
              snapshotData.docs[index].get('JOB_TITLE'),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
            subtitle: Text(
              snapshotData.docs[index].get('JOB_LOCATION'),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
          );
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
              ));
  }
}
