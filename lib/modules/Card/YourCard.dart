import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jopedia/shared/components/component.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import 'package:jopedia/bloc/cubit.dart';

import '../../models/user/user_model.dart';
var formkey = GlobalKey<FormState>();

class YourCard extends StatelessWidget {

  var CardNumberController = TextEditingController();
  var ExpiryDateController = TextEditingController();
  var CVVController = TextEditingController();
  var CardHolderController = TextEditingController();
  var CardpinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppBloc(),
        child: BlocConsumer<AppBloc, AppState>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff50B3CF),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child:
                            MyText(
                              text: 'Manage Your Card',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                              colors: Color(0xff0F4C5C),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          DefaultTextField(
                            controller: CardNumberController,
                            type: TextInputType.number,
                            hint: 'Card Number',
                            validateTixt: 'Card Number',
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          DefaultTextField(
                            controller: CardpinController,
                            type: TextInputType.number,
                            hint: 'Card PIN',
                            validateTixt: 'PIN',
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  child: DefaultTextField(
                                    controller: ExpiryDateController,
                                    type: TextInputType.datetime,
                                    hint: 'Expiry Date(MM/YY)',
                                    validateTixt: 'Date',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Container(

                                  child: DefaultTextField(
                                    controller: CVVController,
                                    type: TextInputType.number,
                                    hint: 'CVV',
                                    validateTixt: 'CVV',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          DefaultTextField(
                            controller: CardHolderController,
                            type: TextInputType.name,
                            hint: 'CardHolder Name',
                            validateTixt: 'CardHolder Name',
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 220.0,
                                decoration: BoxDecoration(
                                  color: Color(0xff50B3CF),
                                  borderRadius: BorderRadius.circular(10.0),
                                ) ,
                                child: MaterialButton(
                                  child:MyText(
                                    text:"Delete card".toUpperCase(),
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  onPressed: () async {
                                    final user = FirebaseAuth.instance.currentUser;
                                    // user data read
                                    final Docuser = FirebaseFirestore.instance.collection('users').doc(
                                        user!.uid);
                                    final snapshot2 = await Docuser.get();
                                    var dataUser = UserModel.fromJson(snapshot2.data()!);
                                    if((dataUser.card_name)!='' && dataUser.card_number!=''
                                        && dataUser.CVV!='' && dataUser.EXPIRATION_DATE!= ''
                                        && dataUser.PIN!='') {
                                      AppBloc.get(context).deleteWallet();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: const Text('You deleted your wallet successfully'
                                          ),
                                          duration: const Duration(milliseconds: 2000),
                                          width: 250.0, // Width of the SnackBar.
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
                                    else{
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: const Text('You dont have a wallet to delete'
                                          ),
                                          duration: const Duration(milliseconds: 2000),
                                          width: 230.0, // Width of the SnackBar.
                                          backgroundColor:  Colors.black45,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                            vertical: 20,// Inner padding for SnackBar content.
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                        ),);}
                                  },

                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Container(
                                width: 220.0,
                                decoration: BoxDecoration(
                                  color: Color(0xff50B3CF),
                                  borderRadius: BorderRadius.circular(10.0),
                                ) ,
                                child: MaterialButton(
                                  child:MyText(
                                    text:"Add wallet".toUpperCase(),
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  onPressed: () async {
                                    if(formkey.currentState!.validate()) {
                                      final user = FirebaseAuth.instance.currentUser;
                                      final Docuser = FirebaseFirestore.instance.collection('users').doc(
                                          user!.uid);
                                      final snapshot2 = await Docuser.get();
                                      var dataUser = UserModel.fromJson(snapshot2.data()!);
                                      if(dataUser.card_name =='' && dataUser.card_number==''
                                          && dataUser.CVV=='' && dataUser.EXPIRATION_DATE== ''
                                          && dataUser.PIN==''){
                                      AppBloc.get(context).AddWallet(
                                          CardNumberController,
                                          CardHolderController,
                                          CVVController,
                                          ExpiryDateController,
                                          CardpinController);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: const Text('You added wallet successfully'
                                          ),
                                          duration: const Duration(milliseconds: 2000),
                                          width: 230.0, // Width of the SnackBar.
                                          backgroundColor:  Colors.black45,
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
                                      else{
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: const Text('You already have wallet'
                                            ),
                                            duration: const Duration(milliseconds: 2000),
                                            width: 230.0, // Width of the SnackBar.
                                            backgroundColor:  Colors.black45,
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
                                    }
                                  }
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        )
    );
  }
}