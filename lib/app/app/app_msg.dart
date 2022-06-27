import 'package:flutter/material.dart';

enum AppMsg {
  unKnown,
}

extension AppMsgExt on AppMsg {
  String localized(
      BuildContext context) {
    switch (this) {
      case AppMsg.unKnown:
        return 'Unknown';
    }
  }
}
