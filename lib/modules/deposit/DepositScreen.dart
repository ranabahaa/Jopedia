import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/shared/components/component.dart';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../../models/user/user_model.dart';
import '../Card/YourCard.dart';
var formkey = GlobalKey<FormState>();


class DepositScreen extends StatelessWidget {
  var DepositAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => AppBloc(),
        child:BlocConsumer<AppBloc, AppState>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff50B3CF),
                ),
                body: Container(
                  width: double.infinity,
                  color: Color(0xffF6F9FA),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        MyText(
                          text: 'Deposit',
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          colors: Color(0xff0F4C5C),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          width: 350.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 8.0),
                            child: DefaultTextField(
                              controller: DepositAmountController,
                              type: TextInputType.number,
                              hint: 'Deposit Amount',
                              validateTixt: 'Deposit Amount',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 220.0,
                          decoration: BoxDecoration(
                            color: Color(0xff50B3CF),
                            borderRadius: BorderRadius.circular(10.0),
                          ) ,
                          child: MaterialButton(
                            child:MyText(
                              text:"Submit".toUpperCase(),
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                            ),
                            onPressed: () async {
                              if(formkey.currentState!.validate()) {
                                final user = FirebaseAuth.instance.currentUser;
                                // user data read
                                final Docuser = FirebaseFirestore.instance.collection('users').doc(
                                    user!.uid);
                                final snapshot2 = await Docuser.get();
                                var dataUser = UserModel.fromJson(snapshot2.data()!);
                                if(dataUser.card_name!='' && dataUser.card_number!=''
                                    && dataUser.CVV!='' && dataUser.EXPIRATION_DATE!= ''
                                    && dataUser.PIN!='') {
                                  AppBloc.get(context)
                                      .DepositToWallet(DepositAmountController);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text('You deposit to your wallet successfully'
                                      ),
                                      duration: const Duration(milliseconds: 2000),
                                      width: 300.0, // Width of the SnackBar.
                                      backgroundColor: Colors.black45,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 20,// Inner padding for SnackBar content.
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),);
                                }
                                else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      action: SnackBarAction(
                                        label: 'Add Credit',
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => YourCard() ,
                                            ),
                                          );
                                        },
                                      ),
                                      content: const Text('Please complete your information'),
                                      duration: const Duration(milliseconds: 2000),
                                      width: 350.0, // Width of the SnackBar.
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 20,// Inner padding for SnackBar content.
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  );
                                }
                              }
                            }
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
}

