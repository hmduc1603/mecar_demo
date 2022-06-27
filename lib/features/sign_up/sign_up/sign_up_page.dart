import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mecar/app/config/app_route.dart';
import 'package:mecar/base/base_state.dart';
import 'package:mecar/features/sign_up/sign_up/sign_up_cubit.dart';
import 'package:mecar/features/sign_up/sign_up/sign_up_state.dart';
import 'package:mecar/util/extension/context_ext.dart';
import 'package:mecar/util/text_field_util.dart';
import 'package:mecar/widget_common/app_bar_widget.dart';
import 'package:mecar/widget_common/spacer_widget.dart';
import 'package:mecar/widget_common/text_field_widget.dart';
import '../../../app/theme/dimens.dart';
import '../../../widget_common/button_widget.dart';

class SignUpPage
    extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() =>
      _SignUpPage();
}

class _SignUpPage extends BaseState<
    SignUpState,
    SignUpCubit,
    SignUpPage> {
  final _formKey =
      GlobalKey<FormState>();

  @override
  onStateChanged(SignUpState previous,
      SignUpState current) {
    if (previous.onSucceed !=
            current.onSucceed &&
        current.onSucceed) {
      context.pushReplacementNamed(
          AppRoute.tfaConfirm,
          arguments: state.phoneNum);
    }
    return super.onStateChanged(
        previous, current);
  }

  @override
  Widget buildByState(
      BuildContext context,
      SignUpState state) {
    return Scaffold(
      appBar: const MeCarAppBar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
              MeCarDimens.spacing18),
          child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .stretch,
              children: [
                _TitleItem(),
                const VSpacing(
                    spacing: MeCarDimens
                        .spacing40),
                _buildPhoneField(
                    context),
                const VSpacing(
                    spacing: MeCarDimens
                        .spacing18),
                MeCarPrimaryButton(
                  title: 'Next',
                  onPressed: () => _formKey
                                  .currentState !=
                              null &&
                          _formKey
                              .currentState!
                              .validate()
                      ? cubit
                          .submitPhoneNumber()
                      : null,
                )
              ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
            MeCarDimens.spacing12),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Text("Already a member?"),
            const HSpacing(),
            MeCarTextButton(
                title: 'Login',
                style: context.myTheme
                    .textThemeT1.button,
                onPressed: () =>
                    context.pop()),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneField(
      BuildContext context) {
    return Form(
      key: _formKey,
      child: MeCarTextFormField(
        validator: (value) =>
            FieldUtil.validateEmpty(
                value, context),
        onChanged: (value) => cubit
            .onPhoneNumChanged(value),
        hint: 'Phone number',
        padding: const EdgeInsets.all(
            MeCarDimens.spacing7),
        hintStyle: context
            .myTheme.textThemeT2.body,
        enableUnderline: false,
        inputFormatters: <
            TextInputFormatter>[
          FilteringTextInputFormatter
              .allow(RegExp(r'[0-9]')),
        ],
        keyboardType:
            TextInputType.number,
      ),
    );
  }
}

class _TitleItem
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Sign Up',
          style: context.myTheme
              .textThemeT1.header1),
      const VSpacing(),
      Padding(
        padding: const EdgeInsets.all(
            MeCarDimens.spacing18),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text:
                'By register, I agree to Autoo’s ',
            style: context.myTheme
                .textThemeT1.body,
            children: <TextSpan>[
              TextSpan(
                  text: 'terms of use ',
                  style: context.myTheme
                      .textThemeT1.body
                      .copyWith(
                          color: context
                              .myTheme
                              .colorScheme
                              .blue)),
              const TextSpan(
                  text:
                      '& acknowledge their '),
              TextSpan(
                  text:
                      'privacy policy',
                  style: context.myTheme
                      .textThemeT1.body
                      .copyWith(
                          color: context
                              .myTheme
                              .colorScheme
                              .blue)),
            ],
          ),
        ),
      )
    ]);
  }
}
