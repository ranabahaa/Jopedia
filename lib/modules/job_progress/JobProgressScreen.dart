import 'package:flutter/material.dart';

class JobProgressScreen extends StatefulWidget {
  const JobProgressScreen({Key? key}) : super(key: key);

  @override
  _JobProgressScreenState createState() => _JobProgressScreenState();
}

class _JobProgressScreenState extends State<JobProgressScreen> {
  double progress = 120.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF6F9FA),
        elevation: 0.0,
        titleSpacing: 20.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.teal,
          ),
        ),

      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current Progress',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.teal,
                ),
              ),
              SizedBox(
                width: 7.0,
              ),
              Icon(
                Icons.bike_scooter,
                color: Colors.green,

              ),
            ],
          ),
          Expanded(
            child: Slider(
              value:progress,
              max: 220.0,
              min: 80.0,
              onChanged:(value){
                setState(() {
                  progress = value;
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff08787F),
              borderRadius: BorderRadius.circular(10.0),
            ) ,
            child: MaterialButton(
              child: Text(
                "Cancla".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              onPressed:(){
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              },

            ),
          ),
        ],
      ),
    );
  }
}
Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Color(0xffF087874),

    content: Column(

      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text(
          'Are you sure you want to cancle this job',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 5,
        ),

        Text(
          'WARNNING : ',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 13.5,
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
            },
            textColor: Colors.white,
            child: Text('Cancle'),
          ),
        ],
      ),

    ],
  );
}