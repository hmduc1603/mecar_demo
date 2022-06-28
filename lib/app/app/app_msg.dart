import 'package:flutter/material.dart';
import 'package:mecar/util/extension/context_ext.dart';

enum AppMsg {
  unKnown,
}

extension AppMsgExt on AppMsg {
  String localized(
      BuildContext context) {
    switch (this) {
      case AppMsg.unKnown:
        return context
            .localizations.unknown;
    }
  }
}
