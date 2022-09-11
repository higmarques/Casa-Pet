import 'package:flutter/material.dart';
import 'package:event_tracker/utils/utils.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    this.hintText = Strings.empty,
    this.isEnabled = true,
    this.isError = false,
    this.errorText = Strings.defaultError,
    this.prefixIcon,
    this.obscureText = false,
    this.textSize = 18.0,
    this.onChanged = BaseTextField._defaultOnChanged,
  });

  final String hintText;
  final bool isEnabled;
  final bool isError;
  final String errorText;
  final Icon? prefixIcon;
  final bool obscureText;
  final double textSize;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(fontSize: textSize),
      obscureText: obscureText,
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
    );
  }

  OutlineInputBorder _inputBorder(Color color, {double width = 1.0}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color, width: width));
  }

  static void _defaultOnChanged(String text) {
    return;
  }
}
