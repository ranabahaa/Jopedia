import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jopedia/layout/home_layout.dart';
import 'package:jopedia/models/user/user_model.dart';
import 'package:jopedia/widget/profile_widget.dart';
import 'package:jopedia/widget/textfield_widget.dart';
import 'package:jopedia/modules/my_profile/ProfilePage.dart';
import 'package:jopedia/modules/forget_pass/ForgetPasswordScreen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:jopedia/shared/components/component.dart';

class EditProfilePage extends StatefulWidget {

  UserModel user;
  EditProfilePage(this.user);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _auth = FirebaseAuth.instance;

  late File image;
  late String imageUrl;


  @override
  void initState() {
    super.initState();
  }



  sendData() async{
    var imageRef = FirebaseStorage.instance.ref().child("profiles/"+widget.user.uId);
    await imageRef.putFile(image);
    imageUrl = await imageRef.getDownloadURL();
    widget.user.image = imageUrl;
    await FirebaseFirestore.instance.collection('users').doc(widget.user.uId).update(
      { 'image' : imageUrl.toString()  });
    setState(() {});
  }


  Future getImage() async {

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    final imageTemp = File(image!.path);
    setState(() => this.image = imageTemp);
    if (image != null){
      sendData();
    }

  }




  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerName =
        TextEditingController(text: widget.user.name);
    final TextEditingController _controllerID =
        TextEditingController(text: widget.user.uId);
    final TextEditingController _controllerPhone =
        TextEditingController(text: widget.user.phone);
    final TextEditingController _controllerAbout =
    TextEditingController(text: widget.user.about);
   /* final TextEditingController _controllerNatonalId =
        TextEditingController(text: widget.user.NatonalId);*/


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: MyText(text: 'Edit Profile', colors: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: widget.user.image,
            isEdit: true,
            onClicked: () => getImage(),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _controllerName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                //maxLines: widget.maxLines,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'National ID',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _controllerID,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                //maxLines: widget.maxLines,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone Number',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _controllerPhone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                //maxLines: widget.maxLines,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bio',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _controllerAbout,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                //maxLines: widget.maxLines,
              ),
            ],
          ),
          const SizedBox(height: 20),
          MaterialButton(
            color: Color(0xff50B3CF),
            minWidth: double.infinity,
            height: 50.0,
            child: Text(
              'Save Changes',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              final UserModel = FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.user.uId);
              print('Change Completed !');
              UserModel.update({
                'name': _controllerName.text,
                'NatonalId': _controllerID.text,
                'phone': _controllerPhone.text,
                'about': _controllerAbout.text,
                //'NatonalId': _controllerNatonalId.text,
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  action: SnackBarAction(
                    label: 'Home',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home_layout(widget.user),
                        ),
                      );
                    },
                  ),
                  content: const Text('Change Successful !'),
                  duration: const Duration(milliseconds: 1550),
                  width: 280.0, // Width of the SnackBar.
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, // Inner padding for SnackBar content.
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          MaterialButton(
              color: Color(0xff50B3CF),
              minWidth: double.infinity,
              height: 45.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgetPasswordScreen(),
                  ),
                );
              }),
        ],
      ),
    );


  }
}
