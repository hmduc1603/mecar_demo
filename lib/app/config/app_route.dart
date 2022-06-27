// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:mecar/features/sign_up/sign_up/sign_up_page.dart';
import 'package:mecar/features/sign_up/tfa_confirm/presentation/tfa_confirm_page.dart';
import '../app/app_page.dart';

class AppRoute {
  static const root = '/';
  static const signUp = '/sign_up';
  static const tfaConfirm =
      'tfa_confirm';

  static Route<dynamic>?
      onGenerateRoute(
          RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case root:
        return _route(const MeCarApp(),
            fullscreen: true);
      case signUp:
        return _route(
            const SignUpPage());
      case tfaConfirm:
        return _route(TfaConfirmPage(
            phoneNum: routeSettings
                .arguments as String));
    }
  }

  static Route<dynamic>? _route(
      Widget widget,
      {bool fullscreen = false}) {
    return MaterialPageRoute(
        builder: (_) => widget,
        fullscreenDialog: fullscreen);
  }
}
