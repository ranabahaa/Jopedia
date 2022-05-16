import 'package:flutter/material.dart';
import 'package:jopedia/shared/components/component.dart';

class button_widget extends StatelessWidget {
   //button_widget({Key? key}) : super(key: key);
   late String text ;
   late VoidCallback onClicked;
   var color = Color(0xff50B3CF);

   button_widget({
    Key? key,
   required this.text,
   required this.onClicked,
   }) : super(key: key);


  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed:onClicked,
      child:MyText(
          text: text,
      ),
    style: ElevatedButton.styleFrom(
        primary: color,
    ),
  );
}
