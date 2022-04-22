import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(''),// You can add title here
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xff50B3CF).withOpacity(0.6), //You can make this transparent
        elevation: 0.0, //No shadow

      ),
      body: SingleChildScrollView(
        child: Container(
          //height: 550,
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(

              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: double.infinity,
                      child:
                      Text(
                        'JOPEDIA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),

                      ),
                    ),
                    SizedBox(height: 50,),
                    Text(
                      'Similar applications like Wuzzuf, Facebook jobs, Linkedin or Glassdoor, all offer regular jobs, monthly jobs that require discipline and serious commitment and a lot of the existing jobs also require a certificate or experience in a specific field',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(height: 20,),
                    Text(
                      'our application is different as Jopedia tends to offer opportunities to everyone anywhere without the need to have experience, Jopedia is an app for high school students, undergraduates, and anyone who needs some extra cash beside what they’re doing in their life  ' ,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(height: 20,),
                    Text(
                      'this is an app that will get you an instant job or a temporary one  ',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(height: 20,),
                    Text(
                      'no more worries about your study because it will only take a day or few to finish the job and be back to your life again ',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(height: 20,),
                    Text(
                      'you do not need to have a resume or a cv or anything you just need to have a profile on Jopedia ',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),




                  ],
                ),
              ),
            ),


          ),
        ),
      ),
    );
  }
}