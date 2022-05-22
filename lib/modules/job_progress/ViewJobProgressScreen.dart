import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/bloc/cubit.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class ViewJobProgressScreen extends StatelessWidget {
  //const ViewJobProgressScreen({Key? key}) : super(key: key);
  var color = Color(0xff50B3CF);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: Scaffold(
        appBar: AppBar(
          // title: Text(''),
          // You can add title here
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_ios_outlined,
              color:  color,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white12,
          //You can make this transparent
          elevation: 0.0, //No shadow
        ),
      ),
    );
  }
}
