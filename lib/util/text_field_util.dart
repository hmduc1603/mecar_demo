import 'package:flutter/material.dart';

class FieldUtil {
  static String? validateEmpty(
      String? value,
      BuildContext context) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }
}
