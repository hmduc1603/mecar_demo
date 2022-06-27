import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final String phoneNum;
  final bool onSucceed;

  const SignUpState({
    this.phoneNum = '',
    this.onSucceed = false,
  });

  @override
  List<Object?> get props => [
        phoneNum,
        onSucceed,
      ];

  SignUpState copyWith({
    String? phoneNum,
    bool? onSucceed,
  }) {
    return SignUpState(
      phoneNum:
          phoneNum ?? this.phoneNum,
      onSucceed:
          onSucceed ?? this.onSucceed,
    );
  }
}
