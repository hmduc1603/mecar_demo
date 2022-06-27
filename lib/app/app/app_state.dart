// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final bool isLoading;
  final dynamic error;

  const AppState({
    this.isLoading = true,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        error,
      ];

  AppState copyWith({
    bool? isLoading,
    bool clearError = false,
    dynamic error,
  }) {
    return AppState(
      isLoading:
          isLoading ?? this.isLoading,
      error: error ??
          (clearError
              ? null
              : this.error),
    );
  }
}
