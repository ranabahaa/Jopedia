import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/job/job_model.dart';
import 'package:jopedia/bloc/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class trytimer extends StatefulWidget {
  const trytimer({Key? key}) : super(key: key);

  @override
  State<trytimer> createState() => _trytimerState();
}

class _trytimerState extends State<trytimer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.amber,
          child: MaterialButton(
            onPressed: (){
              print('okay');
              ReadFromPost();
            },
          ),
        ),
      ),
    );
  }

  Future<PostDataModel?> ReadFromPost() async {
    final DocPost = FirebaseFirestore.instance.collection('post').doc('bARLIywCJSgrYXQnQil5');
    final snapshot = await DocPost.get();
    if(snapshot.exists){
      //final post = snapshot.data!;
      final data = PostDataModel.fromJson(snapshot.data()!);
      final startTime = data.StartTime;
      final endTime = data.EndTime;
      print(startTime);
      print(endTime);
      //return PostDataModel.fromJson(snapshot.data()!);
    }
  }
  Widget BuildPost(PostDataModel post)=> Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${post.DISCREPTION}'),
            SizedBox(
              height: 20.0,
            ),
            Text(post.JOB_SALARY.toString()),
            Text(post.StartDate.toString()),
            Text(post.StartTime.toString()),
          ],
        )
    ),
  );
}
