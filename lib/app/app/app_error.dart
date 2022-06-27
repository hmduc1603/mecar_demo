import 'package:flutter/material.dart';

enum AppError {
  unKnown,
}

extension AppErrorExt on AppError {
  String localized(
      BuildContext context) {
    switch (this) {
      case AppError.unKnown:
        return 'unKnow';
    }
  }
}
