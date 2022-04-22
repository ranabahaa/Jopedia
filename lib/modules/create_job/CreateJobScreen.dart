import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jopedia/shared/components/component.dart';

class CreateJobScreen extends StatelessWidget {

  var title_conroller = TextEditingController();
  var description_conroller  =TextEditingController();
  var location_conroller = TextEditingController();
  var salary_conroller = TextEditingController();
  var date_conroller  =TextEditingController();
  var time_conroller = TextEditingController();
  var photo_conroller = TextEditingController();
  var duration_conroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(''),// You can add title here
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue.withOpacity(0.3), //You can make this transparent
        elevation: 0.0, //No shadow

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      'Create Job',
                      style: TextStyle(
                        fontSize:40.0,
                        fontWeight: FontWeight.bold ,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height:40.0,
                ),
                Container(
                  width: 250,

                  child: TextFormField(

                    controller: title_conroller,
                    keyboardType : TextInputType.text ,

                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'title must not be empty';
                      }
                      return null;

                    },
                    decoration: InputDecoration(
                      hintText: 'title',
                      //prefixIcon: Icon(Icons.title),
                      fillColor: Colors.white.withOpacity(0.6),
                      filled: true,
                      border: InputBorder.none,


                    ),

                  ),
                ),
                SizedBox(height: 7,),
                Container(

                  //height: 200.0,
                  child: TextFormField(
                    maxLines: 7,
                    //maxLines: null,
                    keyboardType: TextInputType.multiline,

                    controller: description_conroller,
                    //keyboardType : TextInputType.text ,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'title must not be empty';
                      }
                      return null;

                    },
                    decoration: InputDecoration(
                      hintText: 'Description',
                      fillColor: Colors.white.withOpacity(0.6),
                      filled: true,
                      border: InputBorder.none,
                      //contentPadding: const EdgeInsets.symmetric(vertical: 40.0),

                      //border: InputBorder.none,



                    ),


                  ),
                ),
                SizedBox(height: 7,),
                DefaultTextField(
                  controller: location_conroller ,
                  type: TextInputType.emailAddress,
                  onType: (){
                    print('everything is ok');
                  },
                  hint:'Location',
                  SuffixIcon: Icons.add_location_alt,
                ), //location
                SizedBox(height: 7,),
                TextFormField(
                  controller: salary_conroller,
                  keyboardType : TextInputType.number ,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'title must not be empty';
                    }
                    return null;

                  },
                  decoration: InputDecoration(
                    hintText: 'salary',
                    fillColor: Colors.white.withOpacity(0.6),
                    filled: true,
                    border: InputBorder.none,


                  ),

                ), //salary
                SizedBox(height: 7,),
                TextFormField(
                  controller: time_conroller,
                  keyboardType : TextInputType.datetime ,
                  onTap: (){
                    showTimePicker(context:context,
                      initialTime:TimeOfDay.now() ,).then((value){
                      date_conroller.text = value!.format(context).toString();
                      print(value.format(context));
                    } );
                  },
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'title must not be empty';
                    }
                    return null;

                  },
                  decoration: InputDecoration(
                    hintText: 'time',
                    suffixIcon: Icon(Icons.watch_later_outlined , color: Color(0xff50B3CF),),
                    fillColor: Colors.white.withOpacity(0.6),
                    filled: true,
                    border: InputBorder.none,
                  ),

                ),
                SizedBox(height: 7,),
                TextFormField(
                  controller: date_conroller,
                  keyboardType : TextInputType.datetime ,
                  onTap: (){
                    showDatePicker(context:context,
                      initialDate:DateTime.now() ,
                      firstDate:DateTime.now(),
                      lastDate:DateTime.parse('2022-07-07'),
                    ).then((value){

                      print(DateFormat.yMMMd().format(value!));
                      date_conroller.text= DateFormat.yMMMd().format(value);

                    } );
                  },
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'title must not be empty';
                    }
                    return null;

                  },
                  decoration: InputDecoration(
                    hintText: 'Date ',
                    suffixIcon: Icon(Icons.calendar_today, color: Color(0xff50B3CF),),
                    fillColor: Colors.white.withOpacity(0.6),
                    filled: true,
                    border: InputBorder.none,

                  ),

                ), //date
                SizedBox(height: 7,),
                TextFormField(

                  controller: photo_conroller,
                  keyboardType : TextInputType.text ,

                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'title must not be empty';
                    }
                    return null;

                  },
                  decoration: InputDecoration(
                    hintText: 'Photo',
                    //prefixIcon: Icon(Icons.title),
                    fillColor: Colors.white.withOpacity(0.6),
                    filled: true,
                    border: InputBorder.none,


                  ),

                ), //photo
                SizedBox(height: 7,),
                Container(
                  width: double.infinity,
                  child: DefaultButton(
                    text: 'Create',
                    function: (){
                      print('everything is okay');
                    },
                    background: Color(0xff08787F),
                    width: 150.0,

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}