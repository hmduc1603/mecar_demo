import 'package:flutter/material.dart';

class MeCarColorScheme {
  final Color iconDefault;
  final Color white;
  final Color whiteLight;
  final Color primary;
  final Color primaryLight;
  final Color primarySuperLight;
  final Color grey;
  final Color dark;
  final Color lightDark;
  final Color danger;
  final Color lightGrey;
  final Color superLightGrey;
  final Color semiGrey;
  final Color green;
  final Color blue;

  MeCarColorScheme({
    required this.iconDefault,
    required this.white,
    required this.primary,
    required this.primaryLight,
    required this.primarySuperLight,
    required this.whiteLight,
    required this.grey,
    required this.superLightGrey,
    required this.dark,
    required this.lightDark,
    required this.lightGrey,
    required this.semiGrey,
    required this.danger,
    required this.green,
    required this.blue,
  });

  factory MeCarColorScheme.light() =>
      MeCarColorScheme(
        iconDefault: Colors.black87,
        white: Colors.white,
        whiteLight: Colors.white
            .withOpacity(0.7),
        primary: MeCarColor.primary,
        primaryLight:
            MeCarColor.primaryLight,
        primarySuperLight: MeCarColor
            .primarySuperLight,
        grey: Colors.grey.shade400,
        dark: Colors.black87,
        lightGrey: Colors.grey.shade200,
        semiGrey: Colors.grey.shade400
            .withOpacity(0.6),
        superLightGrey:
            const Color.fromRGBO(
                250, 250, 250, 1),
        lightDark: Colors.grey.shade700,
        danger: Colors.redAccent,
        green: Colors.green,
        blue: MeCarColor.blue,
      );
}

class MeCarColor {
  static const primary = Colors.black87;
  static const primaryLight =
      Colors.black38;
  static const primarySuperLight =
      Colors.black12;
  static const blue = Colors.blue;
}
