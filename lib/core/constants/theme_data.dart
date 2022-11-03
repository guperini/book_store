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

// ignore: avoid_classes_with_only_static_members
class AppColors {
  static const Color appColor = Color(0xFF0659E9);
  static const Color warning = Color(0xffF4D568);
  static const Color azulEscuro = Color(0xff0358AF);
  static const Color azulClaro = Color(0xff0077F3);
  static const Color verde = Color(0xff8FD14F);
  static const Color cinza = Color(0xffD8D8D8);
  static const Color cinzaEscuro = Color(0xffC5C5C5);
  static const Color vermelhoErro = Color(0xffD9133B);
  static const Color azulChamativo = Color(0xff0EC1C7);
}
