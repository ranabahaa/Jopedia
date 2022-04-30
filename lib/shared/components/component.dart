import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget DefaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10.0),
      ),
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
}) =>
    Container(
      child: TextFormField(
        onTap: onTap,
        onChanged: onChange,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        validator: (value) {
          if (value!.isEmpty) {
            return '$validateTixt must not be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            color: Color(0xff0F4C5C).withOpacity(0.4),
          ),
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: PrefixIcon != null ? Icon(PrefixIcon , color: Color(0xff0F4C5C).withOpacity(0.3),) : null,
          suffixIcon: SuffixIcon != null
              ? IconButton(
                  onPressed: SuffixPress,
                  icon: Icon(
                    SuffixIcon,
                    color: Color(0xff0F4C5C).withOpacity(0.4),
                  ))
              : null,
        ),
      ),
    );

Widget MyText({
  required String text,
  String fontFamily = 'Poppins',
  FontWeight fontWeight = FontWeight.w500,
  double fontSize = 18.0,
  Color colors = Colors.white,
}) =>
    Text(
      '$text',
      style: TextStyle(
        fontFamily: '$fontFamily',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: colors,
      ),
    );
void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );
