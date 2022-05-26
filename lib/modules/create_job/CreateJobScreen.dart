import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jopedia/models/user/user_model.dart';
import 'package:jopedia/shared/components/component.dart';
import '../Card/YourCard.dart';
import '../edit_profile/EditProfilePage.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class CreateJobScreen extends StatelessWidget {
  UserModel user;
  CreateJobScreen(this.user);
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
      child: BlocConsumer<AppBloc, AppState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            var cubit = AppBloc.get(context);
            UserModel model;
            return Scaffold(
              backgroundColor: Color(0xffF6F9FA),
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xff0F4C5C),
                    size: 25.0,
                  ),
                ),
                backgroundColor: Color(0xffF6F9FA),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: MyText(
                                text: 'Create Job',
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900,
                                colors: Color(0xff0F4C5C),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: DefaultTextField(
                              controller: title_conroller,
                              type: TextInputType.text,
                              validateTixt: 'Title',
                              hint: 'title',
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            child: DefaultTextField(
                              maxlines: 7,
                              type: TextInputType.multiline,
                              controller: description_conroller,
                              //keyboardType : TextInputType.text ,
                              validateTixt: 'Description',
                              hint: 'Description',
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          DefaultTextField(
                            controller: location_conroller,
                            type: TextInputType.text,
                            validateTixt: 'Location',
                            hint: 'Location',
                          ), //location
                          SizedBox(
                            height: 7,
                          ),
                          DefaultTextField(
                            controller: salary_conroller,
                            type: TextInputType.number,
                            validateTixt: 'Salary',
                            hint: 'Salary',
                          ), //salary
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DefaultTextField(
                                  controller: StartTime_conroller,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      StartTime_conroller.text =
                                          value!.format(context).toString();
                                      //print(value.format(context));
                                    });
                                  },
                                  validateTixt: 'Start time',
                                  hint: 'Start time',
                                  SuffixIcon: Icons.watch_later_outlined,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: DefaultTextField(
                                  controller: EndTime_conroller,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      EndTime_conroller.text =
                                          value!.format(context).toString();
                                      //print(value.format(context));
                                    });
                                  },
                                  validateTixt: 'End time',
                                  hint: 'End time',
                                  SuffixIcon: Icons.watch_later_outlined,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DefaultTextField(
                                  controller: StartDate_conroller,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2022-07-07'),
                                    ).then((value) {
                                      print(DateFormat.yMMMd().format(value!));
                                      StartDate_conroller.text =
                                          DateFormat("dd/MM/yyyy")
                                              .format(value);
                                    });
                                  },
                                  validateTixt: 'Start Date',
                                  hint: 'Start Date ',
                                  SuffixIcon: Icons.calendar_today,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: DefaultTextField(
                                  controller: EndDate_conroller,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2022-07-07'),
                                    ).then((value) {
                                      print(DateFormat.yMMMd().format(value!));
                                      EndDate_conroller.text =
                                          DateFormat("dd/MM/yyyy")
                                              .format(value);
                                    });
                                  },
                                  validateTixt: 'End Date',
                                  hint: 'End Date ',
                                  SuffixIcon: Icons.calendar_today,
                                ),
                              ),
                            ],
                          ), //date
                          SizedBox(
                            height: 7,
                          ),
                          DefaultTextField(
                            controller: photo_conroller,
                            type: TextInputType.text,
                            validateTixt: 'Photo',
                            hint: 'Photo',
                          ), //photo
                          SizedBox(
                            height: 15,
                          ),
                          MaterialButton(
                            color: Color(0xff50B3CF),
                            minWidth: double.infinity,
                            height: 50.0,
                            child: Text(
                              'Create',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              // if (user.NatonalId == "") {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       action: SnackBarAction(
                              //         label: 'Edit Profile',
                              //         onPressed: () {
                              //           Navigator.push(
                              //             context,
                              //             MaterialPageRoute(
                              //               builder: (context) =>
                              //                   EditProfilePage(user),
                              //             ),
                              //           );
                              //         },
                              //       ),
                              //       content: const Text(
                              //           'Please complete your information'),
                              //       duration:
                              //           const Duration(milliseconds: 1550),
                              //       width: 280.0, // Width of the SnackBar.
                              //       padding: const EdgeInsets.symmetric(
                              //         horizontal:
                              //             10.0, // Inner padding for SnackBar content.
                              //       ),
                              //       behavior: SnackBarBehavior.floating,
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius:
                              //             BorderRadius.circular(10.0),
                              //       ),
                              //     ),
                              //   );
                              // } else if (user.credit == "") {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       action: SnackBarAction(
                              //         label: 'Edit Credit',
                              //         onPressed: () {
                              //           Navigator.push(
                              //             context,
                              //             MaterialPageRoute(
                              //               builder: (context) => YourCard(),
                              //             ),
                              //           );
                              //         },
                              //       ),
                              //       content: const Text(
                              //           'Please complete your information'),
                              //       duration:
                              //           const Duration(milliseconds: 1550),
                              //       width: 280.0, // Width of the SnackBar.
                              //       padding: const EdgeInsets.symmetric(
                              //         horizontal:
                              //             10.0, // Inner padding for SnackBar content.
                              //       ),
                              //       behavior: SnackBarBehavior.floating,
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius:
                              //             BorderRadius.circular(10.0),
                              //       ),
                              //     ),
                              //   );
                              // } else
                              if (FormKey.currentState!.validate()) {
                                DateTime start = DateFormat("dd/MM/yyyy")
                                    .parse(StartDate_conroller.text);
                                DateTime end = DateFormat("dd/MM/yyyy")
                                    .parse(EndDate_conroller.text);
                                bool moreThanDay =
                                    end.difference(start).abs().inMinutes <
                                        1440;
                                AppBloc.get(context).CreatJob(
                                  JOBID: "",
                                  DISCREPTION: description_conroller.text,
                                  JOB_LOCATION: location_conroller.text,
                                  JOB_TITLE: title_conroller.text,
                                  JOB_SALARY: salary_conroller.text,
                                  StartDate: StartDate_conroller.text,
                                  EndDate: EndDate_conroller.text,
                                  StartTime: StartTime_conroller.text,
                                  EndTime: EndTime_conroller.text,
                                  PostTime: DateTime.now().toString(),
                                  MORE_THAN_DAY: moreThanDay,
                                  WORKER_ID: '..',
                                );
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Job Created !'),
                                  duration: const Duration(milliseconds: 1550),
                                  width: 280.0, // Width of the SnackBar.
                                  padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        10.0, // Inner padding for SnackBar content.
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
