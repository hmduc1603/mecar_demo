import 'package:equatable/equatable.dart';

class TfaConfirmState
    extends Equatable {
  final String tfaCode;
  final bool onSucceed;
  final int resendTimeLeft;
  bool get isCodeValid =>
      tfaCode.isNotEmpty &&
      tfaCode.length == 6;

  const TfaConfirmState({
    this.tfaCode = '',
    this.onSucceed = false,
    this.resendTimeLeft = 60,
  });

  String getTimeLeftAsString() {
    if (resendTimeLeft == 0) return '';
    return ' ${resendTimeLeft}s';
  }

  @override
  List<Object?> get props => [
        tfaCode,
        onSucceed,
        resendTimeLeft,
      ];

  TfaConfirmState copyWith({
    String? tfaCode,
    bool? onSucceed,
    int? resendTimeLeft,
  }) {
    return TfaConfirmState(
      tfaCode: tfaCode ?? this.tfaCode,
      onSucceed:
          onSucceed ?? this.onSucceed,
      resendTimeLeft: resendTimeLeft ??
          this.resendTimeLeft,
    );
  }
}
