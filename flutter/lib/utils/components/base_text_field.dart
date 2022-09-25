import 'package:flutter/material.dart';
import 'package:event_tracker/utils/utils.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    this.hintText = BaseStrings.empty,
    this.isEnabled = true,
    this.isError = false,
    this.errorText = BaseStrings.defaultError,
    this.prefixIcon,
    this.obscureText = false,
    this.textSize = 14.0,
    this.height = 40.0,
    this.type,
    this.onChanged = BaseTextField._defaultOnChanged,
  });

  final String hintText;
  final bool isEnabled;
  final bool isError;
  final String errorText;
  final Icon? prefixIcon;
  final bool obscureText;
  final double textSize;
  final double height;
  final TextInputType? type;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isError ? height + 25 : height,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(fontSize: textSize),
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: isError ? errorText : null,
          enabled: isEnabled,
          filled: true,
          prefixIcon: prefixIcon,
          fillColor: isEnabled ? BaseColors.white : BaseColors.lightGrey,
          disabledBorder: _inputBorder(BaseColors.lightGrey),
          enabledBorder: _inputBorder(BaseColors.white),
          focusedBorder: _inputBorder(BaseColors.white),
          errorBorder: _inputBorder(BaseColors.red, width: 2),
          focusedErrorBorder: _inputBorder(BaseColors.red, width: 2),
        ),
      ),
    );
  }

  OutlineInputBorder _inputBorder(Color color, {double width = 1.0}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color, width: width));
  }

  static void _defaultOnChanged(String text) {
    print("defaultOnChange");
    return;
  }
}