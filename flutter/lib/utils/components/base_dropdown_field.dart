import 'package:event_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

class BaseDropdown extends StatelessWidget {
  const BaseDropdown(
    this.items, {
    super.key,
    this.hintText,
    required this.onChanged,
  });

  final List<DropdownMenuItem<String>> items;
  final String? hintText;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      decoration: const BoxDecoration(
        color: BaseColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration.collapsed(
          hintText: hintText,
        ),
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
