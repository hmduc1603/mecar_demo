import 'package:injectable/injectable.dart';
import 'package:mecar/base/base_cubit.dart';
import 'package:mecar/core/domain/usecase/send_tfa_usecase.dart';
import 'package:mecar/features/sign_up/sign_up/sign_up_state.dart';

@injectable
class SignUpCubit
    extends BaseCubit<SignUpState> {
  final SendTfaUseCase sendTfaUseCase;
  SignUpCubit(
    this.sendTfaUseCase,
  ) : super(const SignUpState());

  submitPhoneNumber() async {
    try {
      //Demo
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

  onPhoneNumChanged(String? num) {
    emit(state.copyWith(phoneNum: num));
  }

  reset() {
    emit(state.copyWith(
        onSucceed: false));
  }
}
