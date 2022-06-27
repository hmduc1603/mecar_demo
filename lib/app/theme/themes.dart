import 'package:flutter/material.dart';
import 'colors.dart';

class MeCarThemeData {
  final Brightness brightness;
  final MeCarColorScheme colorScheme;
  final MeCarTextTheme textThemeT1;
  final MeCarTextTheme textThemeT2;
  final MeCarTextTheme textThemeT3;
  final MeCarTextTheme textThemeT4;
  final MeCarTextTheme buttonThemeT1;
  final MeCarTextTheme buttonThemeT2;

  const MeCarThemeData.raw({
    required this.brightness,
    required this.colorScheme,
    required this.textThemeT1,
    required this.textThemeT2,
    required this.textThemeT3,
    required this.buttonThemeT1,
    required this.buttonThemeT2,
    required this.textThemeT4,
  });

  factory MeCarThemeData({
    required Brightness brightness,
    required MeCarColorScheme
        colorScheme,
  }) =>
      MeCarThemeData.raw(
        brightness: brightness,
        colorScheme: colorScheme,
        textThemeT1:
            MeCarTextTheme.create(
                colorScheme.dark),
        textThemeT2:
            MeCarTextTheme.create(
                colorScheme.grey),
        textThemeT3:
            MeCarTextTheme.create(
                colorScheme.lightGrey),
        textThemeT4:
            MeCarTextTheme.create(
                colorScheme.lightDark),
        buttonThemeT1:
            MeCarTextTheme.create(
                colorScheme.primary),
        buttonThemeT2:
            MeCarTextTheme.create(
                colorScheme.white),
      );

  ThemeData get themeData => ThemeData(
        brightness: brightness,
        primaryColor:
            colorScheme.primary,
        backgroundColor:
            colorScheme.white,
        colorScheme: ColorScheme.light(
          brightness: brightness,
          primary: colorScheme.primary,
          surface: colorScheme.white,
          onPrimary: colorScheme.white,
          onSurface: colorScheme.dark,
        ),
        appBarTheme: AppBarTheme(
          foregroundColor:
              colorScheme.white,
          backgroundColor:
              colorScheme.white,
        ),
        tabBarTheme: TabBarTheme(
          labelColor:
              colorScheme.primary,
          unselectedLabelColor:
              colorScheme.dark,
        ),
        scaffoldBackgroundColor:
            colorScheme.white,
      );

  factory MeCarThemeData.light() =>
      MeCarThemeData(
          brightness: Brightness.light,
          colorScheme:
              MeCarColorScheme.light());
}

class MeCarTextTheme {
  final TextStyle bigTitle;
  final TextStyle title;
  final TextStyle button;
  final TextStyle textButton;
  final TextStyle header0;
  final TextStyle header1;
  final TextStyle header2;
  final TextStyle body;
  final TextStyle light;
  final TextStyle error;
  final TextStyle superLight;
  final TextStyle placeHolder;

  MeCarTextTheme({
    required this.bigTitle,
    required this.title,
    required this.button,
    required this.textButton,
    required this.header0,
    required this.header1,
    required this.header2,
    required this.body,
    required this.light,
    required this.error,
    required this.superLight,
    required this.placeHolder,
  });

  factory MeCarTextTheme.create(
      Color color) {
    return MeCarTextTheme(
      bigTitle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: color),
      title: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: color),
      button: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: color),
      textButton: TextStyle(
          fontSize: 15, color: color),
      header0: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
          color: color),
      header1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21,
          color: color),
      header2: TextStyle(
          fontSize: 16, color: color),
      body: TextStyle(
          fontSize: 15, color: color),
      light: TextStyle(
          fontSize: 13, color: color),
      error: TextStyle(
          fontSize: 17, color: color),
      superLight: TextStyle(
          fontSize: 11, color: color),
      placeHolder: TextStyle(
          fontSize: 15, color: color),
    );
  }
}
