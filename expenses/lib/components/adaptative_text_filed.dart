import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  TextEditingController controller;
  final void Function(String) onSubmitted;
  final TextInputType keyboardType;
  final String label;

  AdaptativeTextField({
    super.key,
    required this.controller,
    required this.onSubmitted,
    this.keyboardType = TextInputType.text,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CupertinoTextField(
                controller: controller,
                onSubmitted: onSubmitted,
                placeholder: label,
                keyboardType: keyboardType,
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 12,
                )),
          )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
