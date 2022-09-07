import 'package:flutter/material.dart';

class Themes {
  static final mainTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      background: Color.fromRGBO(255, 181, 167, 1),
      primary: Color.fromRGBO(255, 181, 167, 1),
      secondary: Color.fromRGBO(82, 121, 111, 1),
    ),
    primaryColor: const Color(0xFFFFB5A7),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll<Color?>(Color.fromRGBO(82, 121, 111, 1)),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(82, 121, 111, 1),
    ),
  );
}
