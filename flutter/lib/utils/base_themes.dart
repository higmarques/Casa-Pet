import 'package:flutter/material.dart';
import 'package:event_tracker/utils/utils.dart';

class BaseThemes {
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
        shape: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.grey.shade300),
            );
          }

          if (states.contains(MaterialState.pressed)) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Color.fromARGB(0, 0, 0, 0)),
            );
          }

          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: BaseColors.secondaryGreen),
          );
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey.shade300;
          }
          return const Color.fromRGBO(82, 121, 111, 1);
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey.shade800;
          }
          return Colors.white;
        }),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: BaseColors.secondaryGreen,
    ),
  );
}
