import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecar/util/extension/context_ext.dart';
import '../app/theme/dimens.dart';

class MeCarPrimaryButton
    extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color? buttonColor;
  final double? buttonHeight;
  final bool enable;

  const MeCarPrimaryButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.buttonColor,
    this.buttonHeight,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight ??
          MeCarDimens.buttonHeight,
      child: Opacity(
          opacity: enable ? 1 : 0.5,
          child: ElevatedButton(
            child: Text(title,
                style: context
                    .myTheme
                    .buttonThemeT2
                    .button),
            onPressed: enable
                ? onPressed
                : null,
          )),
    );
  }
}

class MeCarTextButton
    extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color? titleColor;
  final TextStyle? style;
  final bool enable;

  const MeCarTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.titleColor,
    this.style,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
        style: style ??
            context
                .myTheme
                .buttonThemeT1
                .textButton
                .copyWith(
              color: titleColor ??
                  context
                      .myTheme
                      .colorScheme
                      .primary,
            ),
      ),
      onPressed:
          enable ? onPressed : null,
    );
  }
}

class MeCarIconButton
    extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final bool hasDropShadown;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Color? shadownColor;
  final double? height;
  final double? width;

  const MeCarIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.hasDropShadown = false,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.shadownColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor ??
                Colors.white,
            width: borderWidth ?? 0,
          ),
          borderRadius:
              BorderRadius.circular(
            borderRadius ??
                MeCarDimens
                    .buttonRadius,
          ),
          boxShadow: hasDropShadown
              ? [
                  BoxShadow(
                    color: shadownColor ??
                        context
                            .myTheme
                            .colorScheme
                            .lightGrey,
                    spreadRadius: 2,
                    blurRadius: 4,
                  )
                ]
              : null),
      child: SizedBox(
        height: height,
        width: width,
        child: CupertinoButton(
          child: icon,
          onPressed: onPressed,
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
