import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jopedia/shared/components/component.dart';

class WithdrawalScreen extends StatelessWidget {
  var WithdrawalAmountController = TextEditingController();
  var PinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
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
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 27.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xffF6F9FA),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Withdrawal',
              style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0F4C5C)
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: 350.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric( vertical: 0.0, horizontal: 8.0),
                child: DefaultTextField(
                  controller: WithdrawalAmountController,
                  type: TextInputType.number,
                  hint: 'Withdrawal Amount',
                ),
              ),
            ) ,
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 200.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric( vertical: 0.0, horizontal: 8.0),
                child: DefaultTextField(
                  controller: PinController,
                  type: TextInputType.number,
                  hint: 'Credit Pin',
                ),
              ),
            ) ,
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 150.0,
              height: 35.0,
              child: DefaultButton(
                text: 'Submit',
                background: Color(0xff50B3CF),
                width: 150.0,
                function: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }

}