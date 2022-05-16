import 'package:flutter/material.dart';
import 'package:jopedia/models/job/job_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jopedia/shared/components/component.dart';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class ContractScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppBloc(),
      child:BlocConsumer<AppBloc, AppState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(''),
                // You can add title here
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.blue.withOpacity(0.3),
                //You can make this transparent
                elevation: 0.0, //No shadow
              ),
              body: FutureBuilder<PostDataModel?>(
                future: AppBloc.get(context).ShowContract(),
                //AppBloc.get(context).ShowContract(),
                builder: (context,snapshot){
                  if (snapshot.hasError) {
                    return Text('something went wrong ! ${snapshot.error}');
                  }
                  else if (snapshot.hasData) {
                    final post = snapshot.data!;
                    return Padding(
                      padding: const EdgeInsets.only(left:0.0 ,top: 30.0,right:0.0 ,bottom: 0.0),
                      child: BuildPost(post)
                    );
                  }
                  else {
                    return Center(child: CircularProgressIndicator(),);
                  }
                },
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
