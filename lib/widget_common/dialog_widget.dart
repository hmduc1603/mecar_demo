import 'package:flutter/material.dart';
import 'package:mecar/util/extension/context_ext.dart';
import 'package:mecar/widget_common/spacer_widget.dart';
import '../app/theme/dimens.dart';
import 'button_widget.dart';

class MeCarDialog
    extends StatelessWidget {
  final String? title;
  final String message;
  final String? buttonTitle;

  const MeCarDialog({
    Key? key,
    this.title,
    required this.message,
    this.buttonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myTheme = context.myTheme;

    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.all(
                    MeCarDimens
                        .spacing40),
            child: Container(
              padding:
                  const EdgeInsets.all(
                      MeCarDimens
                          .spacing15),
              decoration: BoxDecoration(
                  color: myTheme
                      .colorScheme
                      .white,
                  borderRadius: BorderRadius
                      .circular(MeCarDimens
                          .buttonRadius)),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                crossAxisAlignment:
                    CrossAxisAlignment
                        .stretch,
                children: [
                  if (title !=
                      null) ...{
                    Text(
                      'title!',
                      style: myTheme
                          .textThemeT1
                          .bigTitle
                          .copyWith(
                              color: myTheme
                                  .colorScheme
                                  .dark),
                      textAlign:
                          TextAlign
                              .center,
                      maxLines: 2,
                    )
                  },
                  const VSpacing(
                      spacing: MeCarDimens
                          .spacing20),
                  Text(
                    message,
                    style: myTheme
                        .textThemeT1
                        .error
                        .copyWith(
                            color: myTheme
                                .colorScheme
                                .dark),
                    textAlign: TextAlign
                        .center,
                    maxLines: 8,
                  ),
                  const VSpacing(
                      spacing: MeCarDimens
                          .spacing30),
                  MeCarPrimaryButton(
                    titleStyle: context
                        .myTheme
                        .textThemeT1
                        .button
                        .copyWith(
                            color: context
                                .myTheme
                                .colorScheme
                                .white),
                    buttonColor: myTheme
                        .colorScheme
                        .dark,
                    onPressed: () =>
                        context.pop(),
                    title: buttonTitle ??
                        context
                            .localizations
                            .closeBtnTitle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MeCarOptionalDialog
    extends StatelessWidget {
  final String? title;
  final String message;
  final String? buttonTitle;
  final VoidCallback onPressedBtn;
  final String? altButtonTitle;
  final VoidCallback onPressedAltBtn;

  const MeCarOptionalDialog({
    Key? key,
    this.title,
    required this.message,
    this.buttonTitle,
    this.altButtonTitle,
    required this.onPressedAltBtn,
    required this.onPressedBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myTheme = context.myTheme;

    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(
              MeCarDimens.spacing40),
          child: Container(
            padding:
                const EdgeInsets.all(
                    MeCarDimens
                        .spacing15),
            decoration: BoxDecoration(
                color: myTheme
                    .colorScheme.white,
                borderRadius: BorderRadius
                    .circular(MeCarDimens
                        .buttonRadius)),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment
                      .center,
              crossAxisAlignment:
                  CrossAxisAlignment
                      .stretch,
              children: [
                if (title != null) ...{
                  Text(
                    'title!',
                    style: myTheme
                        .textThemeT1
                        .bigTitle,
                    textAlign: TextAlign
                        .center,
                    maxLines: 2,
                  )
                },
                const VSpacing(
                    spacing: MeCarDimens
                        .spacing20),
                Text(
                  message,
                  style: myTheme
                      .textThemeT1
                      .error,
                  textAlign:
                      TextAlign.center,
                  maxLines: 8,
                ),
                const VSpacing(
                    spacing: MeCarDimens
                        .spacing20),
                const Divider(),
                Table(
                  defaultVerticalAlignment:
                      TableCellVerticalAlignment
                          .middle,
                  children: [
                    TableRow(children: [
                      MeCarTextButton(
                        style: context
                            .myTheme
                            .buttonThemeT1
                            .button,
                        onPressed: () =>
                            onPressedBtn(),
                        title:
                            buttonTitle ??
                                'Đồng ý',
                      ),
                      MeCarTextButton(
                        style: context
                            .myTheme
                            .textThemeT1
                            .button,
                        onPressed: () =>
                            onPressedAltBtn(),
                        title:
                            altButtonTitle ??
                                'Hủy',
                      )
                    ]),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
