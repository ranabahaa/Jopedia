import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jopedia/shared/components/component.dart';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class CreateJobScreen extends StatelessWidget {

  var title_conroller = TextEditingController();
  var description_conroller = TextEditingController();
  var location_conroller = TextEditingController();
  var salary_conroller = TextEditingController();

  var StartDate_conroller = TextEditingController();
  var EndDate_conroller = TextEditingController();
  var StartTime_conroller = TextEditingController();
  var EndTime_conroller = TextEditingController();
  var PostTime_conroller = TextEditingController();

  var photo_conroller = TextEditingController();
  var duration_conroller = TextEditingController();
  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppBloc(),
        child:BlocConsumer<AppBloc, AppState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(

              title: Text(''),
              // You can add title here
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.blue.withOpacity(0.3),
              //You can make this transparent
              elevation: 0.0, //No shadow

            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                  key: FormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              'Create Job',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: 250,
                          child: TextFormField(

                            controller: title_conroller,
                            keyboardType: TextInputType.text,

                            validator: (value) {
                              if (value!.isEmpty) {
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Description must not be empty';
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
                        TextFormField(
                          controller: location_conroller,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'location must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'location',
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,
                            border: InputBorder.none,
                          ),
                        ),//location
                        SizedBox(height: 7,),
                        TextFormField(
                          controller: salary_conroller,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'salary must not be empty';
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
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: StartTime_conroller,
                                keyboardType: TextInputType.datetime,
                                onTap: () {
                                  showTimePicker(context: context,
                                    initialTime: TimeOfDay.now(),).then((value) {
                                    StartTime_conroller.text =
                                        value!.format(context).toString();
                                    //print(value.format(context));
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'start time must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'start time',
                                  suffixIcon: Icon(Icons.watch_later_outlined,
                                    color: Color(0xff50B3CF),),
                                  fillColor: Colors.white.withOpacity(0.6),
                                  filled: true,
                                  border: InputBorder.none,
                                ),

                              ),
                            ),
                            SizedBox(width: 5,),
                            Expanded(
                              child: TextFormField(
                              controller: EndTime_conroller,
                              keyboardType: TextInputType.datetime,
                              onTap: () {
                                showTimePicker(context: context,
                                  initialTime: TimeOfDay.now(),).then((value) {
                                  EndTime_conroller.text = value!.format(context).toString();
                                  //print(value.format(context));
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'End Time must not be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'End Time',
                                suffixIcon: Icon(Icons.watch_later_outlined,
                                  color: Color(0xff50B3CF),),
                                fillColor: Colors.white.withOpacity(0.6),
                                filled: true,
                                border: InputBorder.none,
                              ),

                            )),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: StartDate_conroller,
                                keyboardType: TextInputType.datetime,
                                onTap: () {
                                  showDatePicker(context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2022-07-07'),
                                  ).then((value) {
                                    print(DateFormat.yMMMd().format(value!));
                                    StartDate_conroller.text =
                                        DateFormat.yMMMd().format(value);
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Start Date must not be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Start Date ',
                                  suffixIcon: Icon(
                                    Icons.calendar_today, color: Color(0xff50B3CF),),
                                  fillColor: Colors.white.withOpacity(0.6),
                                  filled: true,
                                  border: InputBorder.none,

                                ),

                              ),
                            ),
                            SizedBox(width: 5 ,),
                            Expanded(
                              child:TextFormField(
                              controller: EndDate_conroller,
                              keyboardType: TextInputType.datetime,
                              onTap: () {
                                showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2022-07-07'),
                                ).then((value) {
                                  print(DateFormat.yMMMd().format(value!));
                                  EndDate_conroller.text =
                                      DateFormat.yMMMd().format(value);
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'End Date must not be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'End Date ',
                                suffixIcon: Icon(
                                  Icons.calendar_today, color: Color(0xff50B3CF),),
                                fillColor: Colors.white.withOpacity(0.6),
                                filled: true,
                                border: InputBorder.none,

                              ),

                            )),
                          ],
                        ), //date
                        SizedBox(height: 7,),
                        TextFormField(

                          controller: photo_conroller,
                          keyboardType: TextInputType.text,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'photo must not be empty';
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
                          child: TextButton(
                            child: Text('Create'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),),

                            onPressed: () {
                              if(FormKey.currentState!.validate()){
                                 AppBloc.get(context).CreatJob(
                                    DISCREPTION: description_conroller.text,
                                    JOB_LOCATION: location_conroller.text,
                                    JOB_TITLE: title_conroller.text,
                                    JOB_SALARY: salary_conroller.text,
                                    StartDate: StartDate_conroller.text,
                                    EndDate: EndDate_conroller.text,
                                   StartTime: StartTime_conroller.text,
                                   EndTime: EndTime_conroller.text,
                                   PostTime: DateTime.now().toString(),
                                );}

                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    ),
    );
  }
}