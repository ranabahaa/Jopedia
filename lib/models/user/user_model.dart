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
  late String card_name;
  late String CVV;
  late String card_number;
  late String PIN;
  late String EXPIRATION_DATE;

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
        this.card_number="",

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
    card_number = json?['card_number'];
    card_name = json?['card_name'];
    CVV = json?['CVV'];
    PIN = json?['PIN'];
    EXPIRATION_DATE = json?['EXPIRATION_DATE'];

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
      'card_name':card_name,
      'CVV':CVV,
      'EXPIRATION_DATE':EXPIRATION_DATE,
      'PIN':PIN,
      'card_number':card_number,
    };
  }

}