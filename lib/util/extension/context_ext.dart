import 'package:flutter/material.dart';
import 'package:mecar/di/injector.dart';
import '../../app/app/app_cubit.dart';
import '../../app/theme/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension Style on BuildContext {
  MeCarThemeData get myTheme =>
      getIt<AppCubit>().state.appTheme;
}

extension Navigate on BuildContext {
  Future<T?>
      pushNamed<T extends Object?>(
          String name,
          {Object? arguments}) {
    return Navigator.of(this).pushNamed(
        name,
        arguments: arguments);
  }

  Future<T?> pushReplacementNamed<
          T extends Object?>(
      String name,
      {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(name,
            arguments: arguments);
  }

  Future<T?> pushNameAndRemoveUntil<
          T extends Object?>(
      String name,
      {Object? arguments}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(
            name, (r) => false,
            arguments: arguments);
  }

  void pop<T extends Object?>(
      {T? result}) {
    return Navigator.of(this)
        .pop(result);
  }

  void popUntilFirst() {
    return Navigator.of(this).popUntil(
        (route) => route.isFirst);
  }
}

extension Localization on BuildContext {
  AppLocalizations get localizations =>
      AppLocalizations.of(this)!;
}

extension ScreenSize on BuildContext {
  double get screenHeight =>
      MediaQuery.of(this).size.height;
  double get screenWidth =>
      MediaQuery.of(this).size.width;
}
