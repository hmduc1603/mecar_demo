import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mecar/app/theme/dimens.dart';
import 'package:mecar/base/base_state.dart';
import 'package:mecar/features/sign_up/tfa_confirm/presentation/tfa_confirm_cubit.dart';
import 'package:mecar/features/sign_up/tfa_confirm/presentation/tfa_confirm_state.dart';
import 'package:mecar/util/extension/context_ext.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../widget_common/app_bar_widget.dart';
import '../../../../widget_common/button_widget.dart';
import '../../../../widget_common/spacer_widget.dart';

class TfaConfirmPage
    extends StatefulWidget {
  const TfaConfirmPage({
    super.key,
    required this.phoneNum,
  });

  final String phoneNum;

  @override
  State<TfaConfirmPage> createState() =>
      _TfaConfirmPageState();
}

class _TfaConfirmPageState
    extends BaseState<
        TfaConfirmState,
        TfaConfirmCubit,
        TfaConfirmPage> {
  final _tecCodeNode = FocusNode();

  @override
  void initState() {
    cubit.countDownResendTimeLeft();
    super.initState();
  }

  @override
  onStateChanged(
      TfaConfirmState previous,
      TfaConfirmState current) {
    if (previous.onSucceed !=
            current.onSucceed &&
        current.onSucceed) {
      showMessage(context.localizations
              .msgSignUpCompleted)
          .whenComplete(() =>
              context.popUntilFirst());
    }
    return super.onStateChanged(
        previous, current);
  }

  @override
  Widget buildByState(
      BuildContext context,
      TfaConfirmState state) {
    return Scaffold(
      appBar: const MeCarAppBar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.all(
                    MeCarDimens
                        .spacing18),
            child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .stretch,
                children: [
                  _buildTitle(context),
                  const VSpacing(
                      spacing: MeCarDimens
                          .spacing25),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            MeCarDimens
                                .spacing22,
                        horizontal:
                            context.screenWidth /
                                4),
                    child:
                        PinCodeTextField(
                      focusNode:
                          _tecCodeNode,
                      inputFormatters: <
                          TextInputFormatter>[
                        FilteringTextInputFormatter
                            .allow(RegExp(
                                r'[0-9]')),
                      ],
                      keyboardType:
                          TextInputType
                              .number,
                      cursorColor: context
                          .myTheme
                          .colorScheme
                          .primary,
                      pinTheme: PinTheme(
                          fieldHeight:
                              30,
                          fieldWidth:
                              20,
                          selectedColor:
                              context
                                  .myTheme
                                  .colorScheme
                                  .grey,
                          inactiveColor:
                              context
                                  .myTheme
                                  .colorScheme
                                  .grey,
                          activeColor: context
                              .myTheme
                              .colorScheme
                              .grey),
                      appContext:
                          context,
                      length: 6,
                      onChanged:
                          (value) => cubit
                              .onCodeChanged(
                                  value),
                    ),
                  ),
                  MeCarPrimaryButton(
                      title: context
                          .localizations
                          .verifyBtnTitle,
                      onPressed: () => state
                              .isCodeValid
                          ? cubit
                              .submitCode()
                          : _tecCodeNode
                              .requestFocus()),
                  const VSpacing(),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                    children: [
                      MeCarTextButton(
                        title: context
                            .localizations
                            .resendCodeBtnTitle(
                                state
                                    .getTimeLeftAsString()),
                        onPressed: () =>
                            cubit.resendCode(
                                widget
                                    .phoneNum),
                        enable: state
                                .resendTimeLeft ==
                            0,
                        style: context
                            .myTheme
                            .textThemeT1
                            .light
                            .copyWith(
                                fontWeight:
                                    FontWeight
                                        .normal,
                                color: context
                                    .myTheme
                                    .colorScheme
                                    .blue),
                      ),
                    ],
                  )
                ])),
      ),
    );
  }

  Widget _buildTitle(
      BuildContext context) {
    return Column(children: [
      Text(
          context
              .localizations.tfaTitle,
          style: context.myTheme
              .textThemeT1.header1),
      const VSpacing(),
      Padding(
          padding: const EdgeInsets.all(
              MeCarDimens.spacing18),
          child: Text(
            context.localizations
                .tfaNotice(
                    widget.phoneNum),
            textAlign: TextAlign.center,
          ))
    ]);
  }
}
