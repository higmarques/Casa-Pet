import 'package:flutter/material.dart';
import 'package:event_tracker/utils/utils.dart';

class Themes {
  static final mainTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      background: BaseColors.mainBeige,
      primary: BaseColors.mainBeige,
      secondary: BaseColors.secondaryGreen,
    ),
    primaryColor: const Color(0xFFFFB5A7),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll<Size>(Size(50, 57)),
        maximumSize: const MaterialStatePropertyAll<Size>(Size(400, 57)),
        textStyle:
            const MaterialStatePropertyAll<TextStyle>(TextStyle(fontSize: 26)),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: BaseColors.secondaryGreen),
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll<Color?>(
          Color.fromRGBO(82, 121, 111, 1),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: BaseColors.secondaryGreen,
    ),
  );
}
