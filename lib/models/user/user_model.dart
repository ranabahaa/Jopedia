import 'dart:convert';

class UserModel {
  late String name;
  late String email;
  late String phone;
  late String uId;
  late String image;
  late String about;
  late double balance;
  late String NatonalId;
  late String credit;

  UserModel (
      {
        required this.uId,
        required this.name,
        required this.email,
        required this.phone,
        required this.image,
        required this.about,
        required this.balance,
        this.NatonalId="",
        this.credit = "",

});

  UserModel.fromJson(Map<String, dynamic>? json){
    email = json?['email'];
    name = json?['name'];
    phone = json?['phone'];
    uId = json?['uId'];
    image = json?['image'];
    about = json?['about'];
    balance = json?['balance'] as double;
    NatonalId = json?['NatonalId'];
    credit = json?['credit'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'image':image,
      'about':about,
      'balance':balance,
      'NatonalId':NatonalId,
      'credit':credit,
    };
  }

}