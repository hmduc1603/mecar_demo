// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mecar/app/theme/themes.dart';

class AppState extends Equatable {
  final bool isLoading;
  final dynamic error;
  final MeCarThemeData appTheme;
  Locale get appLocale =>
      Locale(Platform.localeName
          .split('_')
          .first);

  const AppState({
    this.isLoading = true,
    this.error,
    required this.appTheme,
  });

  @override
  List<Object?> get props => [
        isLoading,
        error,
        appTheme,
      ];

  AppState copyWith({
    bool? isLoading,
    bool clearError = false,
    dynamic error,
    MeCarThemeData? appTheme,
  }) {
    return AppState(
      isLoading:
          isLoading ?? this.isLoading,
      error: error ??
          (clearError
              ? null
              : this.error),
      appTheme:
          appTheme ?? this.appTheme,
    );
  }
}
