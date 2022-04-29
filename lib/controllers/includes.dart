import 'package:flutter/material.dart';

final buttonStyle = ButtonStyle(
  padding: MaterialStateProperty.all(
    const EdgeInsets.all(12),
  ),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

final outlinedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  // borderSide: const BorderSide(color: Colors.blue),
);

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
