import 'package:flutter/material.dart';
import 'package:mecar/util/extension/context_ext.dart';

enum AppError {
  unKnown,
}

extension AppErrorExt on AppError {
  String localized(
      BuildContext context) {
    switch (this) {
      case AppError.unKnown:
        return context
            .localizations.unknown;
    }
  }
}
