
//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
double rating=3;
class Homepage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<Homepage>{

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.deepPurple,
              child:
              Container(
                height: 30.0,
                width: 30,
                child:
                MaterialButton(
                  onPressed:(){
                      showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildPopupDialog(context),
                    );
                  },
                  child: Text('hi'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Color(0xffF087874),
    title: Text(
        'Rate Your Previous Job',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
       /* SmoothStarRating(
          size: 40,
          starCount: 5,
          rating: rating ,
          filledIconData: Icons.star,
          color: Colors.yellow,
        ),*/
        Container(
          
          width: double.infinity,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Comments',
            ),
          ),
        ),
      ],
    ),
    actions:[
        Row(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              textColor: Colors.white,
              child: Text('Close'),
            ),
            SizedBox(
              width: 40,
            ),
            FlatButton(
              onPressed: () {
              },
              textColor: Colors.white,
              child: Text('Submit'),
            ),
          ],
        ),

    ],
  );
}
