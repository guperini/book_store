import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  fontFamily: 'Lato',
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  scaffoldBackgroundColor: const Color(0xfff2f2f2),
  brightness: Brightness.light,
  primaryColor: const Color(0xff0077F3),
  errorColor: const Color(0xffD9133B),
  appBarTheme: const AppBarTheme(color: Color(0xff0077F3)),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xff0077F3),
  ),
  textTheme: const TextTheme(
    button: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
      fontFamily: "Lato",
      fontWeight: FontWeight.w400,
    ),
  ),
);
