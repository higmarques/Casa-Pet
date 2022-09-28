import 'package:flutter/material.dart';
import 'package:event_tracker/utils/utils.dart';

class BaseThemes {
  static final mainTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      background: BaseColors.primaryBeige,
      primary: BaseColors.primaryBeige,
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
              side: const BorderSide(color: BaseColors.lightGrey),
            );
          }

          if (states.contains(MaterialState.pressed)) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(color: BaseColors.transparent),
            );
          }

          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: BaseColors.secondaryGreen),
          );
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return BaseColors.lightGrey;
          }
          return const Color.fromRGBO(82, 121, 111, 1);
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return BaseColors.white;
        }),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: BaseColors.secondaryGreen,
    ),
  );
}
