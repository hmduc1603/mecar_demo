import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mecar/base/base_cubit.dart';
import 'package:mecar/features/sign_up/tfa_confirm/domain/usecase/submit_tfa_usecase.dart';
import 'package:mecar/features/sign_up/tfa_confirm/presentation/tfa_confirm_state.dart';

@injectable
class TfaConfirmCubit
    extends BaseCubit<TfaConfirmState> {
  final SubmitTfaUseCase
      submitTfaUseCase;

  TfaConfirmCubit(
    this.submitTfaUseCase,
  ) : super(const TfaConfirmState());

  Timer? _timer;

  countDownResendTimeLeft() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (state.resendTimeLeft == 0) {
          timer.cancel();
        } else {
          emit(state.copyWith(
              resendTimeLeft:
                  state.resendTimeLeft -
                      1));
        }
      },
    );
  }

  resendCode(String phoneNum) async {
    try {
      //Submit phone number to get tfa
      showLoading();
      await Future.delayed(
          const Duration(seconds: 2));
      emit(state.copyWith(
          resendTimeLeft: 60));
      countDownResendTimeLeft();
      hideLoading();
    } catch (e) {
      handleError(e);
    }
  }

  submitCode() async {
    try {
      //Submit phone number to get tfa
      showLoading();
      await Future.delayed(
          const Duration(seconds: 2));
      emit(state.copyWith(
          onSucceed: true));
      hideLoading();
    } catch (e) {
      handleError(e);
    }
  }

  onCodeChanged(String? value) {
    emit(
        state.copyWith(tfaCode: value));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
