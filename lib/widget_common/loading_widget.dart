import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mecar/util/extension/context_ext.dart';

import '../app/theme/dimens.dart';

class MeCarLoadingIndicator
    extends StatelessWidget {
  const MeCarLoadingIndicator(
      {Key? key,
      this.color,
      this.dimension})
      : super(key: key);

  final Color? color;
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        SizedBox.square(
          dimension: dimension ??
              MeCarDimens.icon25,
          child: LoadingIndicator(
            indicatorType: Indicator
                .circleStrokeSpin,
            colors: [
              color ??
                  context.myTheme
                      .colorScheme.grey,
            ],
            strokeWidth: 1,
          ),
        ),
      ],
    );
  }
}

class MeCarLoadingWidget
    extends StatelessWidget {
  const MeCarLoadingWidget({
    Key? key,
    this.message,
  }) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: context
          .myTheme.colorScheme.dark
          .withOpacity(0.5),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment:
                AlignmentDirectional
                    .center,
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children: [
                  Container(
                    height: MeCarDimens
                        .spacing60,
                    width: MeCarDimens
                        .spacing80,
                    decoration: BoxDecoration(
                        color: context
                            .myTheme
                            .colorScheme
                            .white,
                        borderRadius:
                            BorderRadius.circular(
                                MeCarDimens
                                    .buttonRadius)),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox.square(
                    dimension:
                        MeCarDimens
                            .icon30,
                    child:
                        LoadingIndicator(
                      indicatorType:
                          Indicator
                              .ballPulseSync,
                      colors: [
                        context
                            .myTheme
                            .colorScheme
                            .primaryLight,
                      ],
                      strokeWidth: 2,
                    ),
                  )
                ],
              ),
            ],
          ),
          if (message != null) ...{
            Text(
              message!,
              style: context.myTheme
                  .textThemeT1.light
                  .copyWith(
                      color: context
                          .myTheme
                          .colorScheme
                          .primaryLight),
              textAlign:
                  TextAlign.center,
            )
          }
        ],
      ),
    );
  }
}

class MeCarLoadingController {
  final params = ValueNotifier<
      MeCarLoadingControllerParams>(
    MeCarLoadingControllerParams(
        visible: false,
        hasBlurBackground: true,
        message: null),
  );

  showLoading(
      {bool blurBG = true,
      String? msg}) {
    params.value =
        params.value.copyWith(
      visible: true,
      hasBlurBackground: blurBG,
      message: msg,
    );
  }

  hideLoading() {
    params.value = params.value
        .copyWith(visible: false);
  }
}

class MeCarLoadingControllerParams {
  final bool visible;
  final bool hasBlurBackground;
  final String? message;

  MeCarLoadingControllerParams({
    required this.visible,
    required this.hasBlurBackground,
    required this.message,
  });

  MeCarLoadingControllerParams
      copyWith({
    bool? visible,
    bool? hasBlurBackground,
    String? message,
  }) {
    return MeCarLoadingControllerParams(
      visible: visible ?? this.visible,
      hasBlurBackground:
          hasBlurBackground ??
              this.hasBlurBackground,
      message: message ?? this.message,
    );
  }
}

class MeCarLoadingHUD
    extends StatelessWidget {
  const MeCarLoadingHUD(
      {Key? key,
      required this.child,
      required this.controller})
      : super(key: key);

  final Widget child;
  final MeCarLoadingController
      controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        ValueListenableBuilder<
                MeCarLoadingControllerParams>(
            valueListenable:
                controller.params,
            builder: (context, visible,
                child) {
              return Visibility(
                  visible: controller
                      .params
                      .value
                      .visible,
                  child:
                      MeCarLoadingWidget(
                    message: controller
                        .params
                        .value
                        .message,
                  ));
            })
      ],
    );
  }
}
