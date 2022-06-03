//import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/bloc/cubit.dart';
import 'package:jopedia/modules/Card/YourCard.dart';
import 'package:jopedia/modules/deposit/DepositScreen.dart';
import 'package:jopedia/modules/job_progress/JobProgressScreen.dart';
import 'package:jopedia/modules/withdrawal/WithdrawalScreen.dart';
import 'package:jopedia/models/user/user_model.dart';
import 'package:jopedia/models/user/user.dart';
import 'package:jopedia/modules/home/home_cubit.dart';
import '../../bloc/states.dart';
import '../../shared/components/component.dart';
class WalletScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (BuildContext context) => AppBloc(),
        child:BlocConsumer<AppBloc, AppState>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              return Scaffold(
                body:
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff50B3CF),
                          Color(0xff0F4C5C),
                        ],
                      )),
                  child: Center(

                    child: Column(
                      children: [
                        FutureBuilder<UserModel?>(
                          future: AppBloc.get(context).Readbalance(),
                          //AppBloc.get(context).ShowContract(),
                          builder: (context,snapshot2){
                            if (snapshot2.hasError) {
                              return Text('something went wrong ! ${snapshot2.error}');
                            }
                            else if (snapshot2.hasData) {
                              final post = snapshot2.data!;
                              return Balancereader(post);
                            }
                            else {
                              return Center(child: CircularProgressIndicator(),);
                            }
                          },
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffF6F9FA),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left:18 ,top: 40,right:18 ,bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FractionallySizedBox(
                                    widthFactor: 0.9,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xff50B3CF),
                                                    Color(0xff0F4C5C),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              child: Material(
                                                elevation: 10.0,
                                                borderRadius: BorderRadius.circular(15.0),
                                                color: Colors.transparent,
                                                child: MaterialButton(
                                                  textColor: Colors.white,
                                                  disabledColor: Colors.grey,
                                                  disabledTextColor: Colors.black,
                                                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                                  splashColor: Color(0xff50B3CF),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => DepositScreen()),
                                                    );
                                                  },
                                                  child: Row(
                                                    textBaseline: TextBaseline.alphabetic,
                                                    children: <Widget>[
                                                      Text(
                                                        'Deposit',
                                                        textAlign: TextAlign.start,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 28.0,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 30.0,
                                                      ),
                                                      Icon(
                                                        Icons.credit_card,
                                                        color: Colors.white,
                                                        size: 38,
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      Icon(
                                                        Icons.double_arrow,
                                                        color: Colors.white,
                                                        size: 28,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Expanded(
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xff50B3CF),
                                                    Color(0xff0F4C5C),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              child: Material(
                                                elevation: 10.0,
                                                borderRadius: BorderRadius.circular(15.0),
                                                color: Colors.transparent,
                                                child: MaterialButton(
                                                  textColor: Colors.white,
                                                  disabledColor: Colors.grey,
                                                  disabledTextColor: Colors.black,
                                                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                                  splashColor: Color(0xff50B3CF),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => WithdrawalScreen()),
                                                    );
                                                  },
                                                  child: Row(
                                                    textBaseline: TextBaseline.alphabetic,
                                                    children: <Widget>[
                                                      Text(
                                                        'Withdrawal',
                                                        textAlign: TextAlign.start,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 25.0,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 30.0,
                                                      ),
                                                      Icon(
                                                        Icons.credit_card,
                                                        color: Colors.white,
                                                        size: 38,
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      Icon(
                                                        Icons.double_arrow,
                                                        color: Colors.white,
                                                        size: 28,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: 0.57,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xff50B3CF),
                                                    Color(0xff0F4C5C),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              child: Material(
                                                elevation: 10.0,
                                                borderRadius: BorderRadius.circular(15.0),
                                                color: Colors.transparent,
                                                child: MaterialButton(
                                                  textColor: Colors.white,
                                                  disabledColor: Colors.grey,
                                                  disabledTextColor: Colors.black,
                                                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                                  splashColor: Color(0xff50B3CF),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) =>JobProgressScreen()),
                                                    );
                                                  },
                                                  child: Row(
                                                    textBaseline: TextBaseline.alphabetic,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.credit_card,
                                                        color: Colors.white,
                                                        size: 38,
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      Text(
                                                        'Manage Card',
                                                        textAlign: TextAlign.start,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 28.0,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 30.0,
                                                      ),

                                                      Icon(
                                                        Icons.double_arrow,
                                                        color: Colors.white,
                                                        size: 28,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        )
    );
  }
  Widget Balancereader(UserModel user)=> Padding(
    padding: const EdgeInsets.only(left:0 ,top:3 ,right:0 ,bottom: 20),
    child: Column(
      children: [
        Text(
          'Your Balance',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white54,
          ),
        ),
        Text(
          '${user.balance.toString()}',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );

}


