import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget DefaultButton({
  double width = double.infinity ,
  Color background = Colors.blue,
  required Function function,
  required String text,
}) => Container(
  width: width,
  decoration: BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(10.0),
  ) ,
  child: MaterialButton(
    onPressed: function(),
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    ),

  ),
);

Widget DefaultTextField({
  required controller,
  hint = '',
  required type,
  onTap,
  onChange,
  isPassword = false,
  SuffixIcon,
  PrefixIcon,
  validateTixt,
  SuffixPress,



}) => Container(
    child: TextFormField(
      onTap: onTap,
      onChanged: onChange,
      controller: controller,
      keyboardType : type ,
      obscureText: isPassword,
      validator: (value)
      {
      if(value!.isEmpty)
      {
        return '$validateTixt must not be empty';
      }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        fillColor: Colors.white.withOpacity(0.6),
        filled: true,
        prefixIcon: Icon(PrefixIcon , color: Color(0xff50B3CF),),
        suffixIcon : SuffixIcon != null ? IconButton(
            onPressed: SuffixPress,
            icon: Icon(SuffixIcon , color: Color(0xff50B3CF),)
        ):null,
      ),

    ),
  );