import 'package:flutter/material.dart';
import 'package:jopedia/models/job/job_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jopedia/shared/components/component.dart';
import 'package:jopedia/modules/job_progress/JobProgressScreen.dart';
import 'package:jopedia/modules/requests/RequestScreen.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class ContractScreen extends StatelessWidget {
  var color = Color(0xff50B3CF);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppBloc(),
      child:BlocConsumer<AppBloc, AppState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            return Scaffold(
              appBar: AppBar(
               // title: Text(''),
                // You can add title here
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Colors.white70),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: color,
                //You can make this transparent
                elevation: 0.0, //No shadow
              ),
              body: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0,top: 45,right: 0,bottom: 0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              text:'Contract',
                              colors: color,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                            SizedBox(width: 3,),
                            Icon(
                              Icons.content_paste,
                              color:  color,
                              size: 23,

                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0,top: 18,right: 0,bottom: 0),
                      child: FutureBuilder<PostDataModel?>(
                        future: AppBloc.get(context).ShowContract(),
                        //AppBloc.get(context).ShowContract(),
                        builder: (context,snapshot){
                          if (snapshot.hasError) {
                            return Text('something went wrong ! ${snapshot.error}');
                          }
                          else if (snapshot.hasData) {
                            final post = snapshot.data!;
                            return Padding(
                              padding: const EdgeInsets.only(left:0.0 ,top: 0.0,right:0.0 ,bottom: 0.0),
                              child: BuildPost(post)
                            );
                          }
                          else {
                            return Center(child: CircularProgressIndicator(),);
                          }
                        },
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left:0.0 ,top: 0.0,right:0.0 ,bottom: 60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 110,
                            height: 35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: color, // background
                                onPrimary: Colors.white, // foreground
                                minimumSize: Size(70, 36),
                                maximumSize: Size(100, 66),
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => RequestScreen()),
                                // );
                              },
                              child: MyText(
                                text: 'Disagree',
                                fontSize: 16.7,
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          SizedBox(
                            width: 110,
                            height: 35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: color, // background
                                onPrimary: Colors.white, // foreground
                                minimumSize: Size(70, 36),
                                maximumSize: Size(100, 66),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => JobProgressScreen()),
                                );
                              },
                              child: MyText(
                                text: 'Agree',
                                fontSize: 16.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
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
