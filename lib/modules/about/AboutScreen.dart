import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jopedia/shared/components/component.dart';

class AboutScreen extends StatelessWidget {
  var color = Color(0xff50B3CF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        elevation: 0.0, //No shadow
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF5F7F7),
                borderRadius: BorderRadius.circular(12),
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
                        'Jopedia',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30.0,
                            //color: Colors.black54,
                            color: color,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    MyText(text:
                      'Similar applications like Wuzzuf, Facebook jobs, Linkedin or Glassdoor, all offer regular jobs, monthly jobs that require discipline and serious commitment and a lot of the existing jobs also require a certificate or experience in a specific field',
                      colors: Colors.black45 ,
                      fontSize: 15,
                      ),
                    SizedBox(height: 10,),
                    MyText(text:
                      'our application is different as Jopedia tends to offer opportunities to everyone anywhere without the need to have experience, Jopedia is an app for high school students, undergraduates, and anyone who needs some extra cash beside what they’re doing in their life  ' ,
                      colors: Colors.black45 ,
                      fontSize: 15,
                    ),
                    SizedBox(height: 10,),
                    MyText(text:
                      'this is an app that will get you an instant job or a temporary one  ',
                      colors: Colors.black45 ,
                      fontSize: 15,
                    ),
                    SizedBox(height: 10,),
                    MyText(text:
                      'no more worries about your study because it will only take a day or few to finish the job and be back to your life again ',
                      colors: Colors.black45 ,
                      fontSize: 15,
                      ),
                    SizedBox(height: 10,),
                    MyText(text:
                      'you do not need to have a resume or a cv or anything you just need to have a profile on Jopedia ',
                      colors: Colors.black45 ,
                      fontSize: 15,
                    ),




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