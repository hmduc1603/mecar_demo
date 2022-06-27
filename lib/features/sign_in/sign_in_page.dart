import 'package:flutter/material.dart';
import 'package:mecar/app/config/app_route.dart';
import 'package:mecar/app/theme/dimens.dart';
import 'package:mecar/app/theme/icons.dart';
import 'package:mecar/util/extension/context_ext.dart';
import 'package:mecar/widget_common/button_widget.dart';
import 'package:mecar/widget_common/spacer_widget.dart';
import 'package:mecar/widget_common/text_field_widget.dart';

class SignInPage
    extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          _BackgroundItem(),
          VSpacing(
              spacing:
                  context.screenHeight /
                      6),
          Padding(
            padding:
                const EdgeInsets.all(
                    MeCarDimens
                        .spacing18),
            child: MeCarTextFormField(
              prefixIcon: Icon(
                  Icons.email_outlined),
              enableUnderline: false,
              hint:
                  'Login with Email/Phone',
            ),
          )
        ],
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
            MeCarDimens.spacing12),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Text("Don't have account?"),
            const HSpacing(),
            MeCarTextButton(
                title: 'Sign Up',
                style: context.myTheme
                    .textThemeT1.button,
                onPressed: () => context
                    .pushNamed(AppRoute
                        .signUp)),
          ],
        ),
      ),
    );
  }
}

class _BackgroundItem
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bgW = context.screenWidth;
    final bgH =
        context.screenHeight / 2;
    return Stack(
      alignment: AlignmentDirectional
          .bottomStart,
      children: [
        SizedBox(
            width: bgW,
            height: bgH,
            child: Image.asset(
              MeCarImages.car,
              fit: BoxFit.cover,
            )),
        Container(
            width: bgW,
            height: bgH,
            color: context.myTheme
                .colorScheme.dark
                .withOpacity(0.4)),
        Padding(
          padding: const EdgeInsets.all(
              MeCarDimens.spacing28),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .stretch,
            children: [
              Text("Welcome",
                  style: context
                      .myTheme
                      .textThemeT1
                      .bigTitle
                      .copyWith(
                          color: context
                              .myTheme
                              .colorScheme
                              .white)),
              const VSpacing(),
              Text(
                  "You're only a few step away from joining MeCar",
                  style: context.myTheme
                      .textThemeT1.body
                      .copyWith(
                          color: context
                              .myTheme
                              .colorScheme
                              .white))
            ],
          ),
        )
      ],
    );
  }
}
