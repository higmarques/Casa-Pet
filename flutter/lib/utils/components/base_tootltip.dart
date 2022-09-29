import 'package:event_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

class BaseTooltip extends StatelessWidget {
  const BaseTooltip(
    this.text, {
    super.key,
    this.foregroundColor = BaseColors.secondaryGreen,
    this.backgroundColor = BaseColors.lightestGrey,
  });

  final String text;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: foregroundColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
