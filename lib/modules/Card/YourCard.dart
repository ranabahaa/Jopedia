import 'package:flutter/material.dart';

import 'package:jopedia/shared/components/component.dart';

class YourCard extends StatelessWidget {

  var CardNumberController = TextEditingController();
  var ExpiryDateController = TextEditingController();
  var CVVController = TextEditingController();
  var CardHolderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Manage Your Card',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
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
                onType:(){},
                hint: 'Card Number',

              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center ,
                children: [
                  Expanded(
                    child: Container(
                      child: DefaultTextField(
                        controller: ExpiryDateController,
                        type: TextInputType.datetime,
                        onType:(){},
                        hint: 'Expiry Date(MM/YY)',
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
                        onType:(){},
                        hint: 'CVV',
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
                onType:(){},
                hint: 'CardHolder Name',
              ),
              SizedBox(
                height: 50.0,
              ),
              DefaultButton(
                text: 'Save',
                background: Color(0xff50B3CF),
                function: (){},
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),

      ),
    );
  }
}