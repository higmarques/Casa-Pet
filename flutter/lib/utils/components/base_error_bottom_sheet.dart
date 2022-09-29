import 'package:event_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

class ErrorBottomSheet extends StatelessWidget {
  const ErrorBottomSheet(
    this.text, {
    super.key,
    this.onTap,
  });

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: BaseColors.red,
      child: SafeArea(
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: BaseColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
