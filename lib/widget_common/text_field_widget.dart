import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mecar/util/extension/context_ext.dart';

import '../app/theme/dimens.dart';

class MeCarTextFormField
    extends StatelessWidget {
  const MeCarTextFormField({
    Key? key,
    this.controller,
    this.label,
    this.hint,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.error,
    this.focusNode,
    this.inputFormatters,
    this.enabled = true,
    this.readOnly = false,
    this.enableUnderline = true,
    this.onSuffixTap,
    this.textInputAction,
    this.onEditingComplete,
    this.onChanged,
    this.textAlign = TextAlign.start,
    this.style,
    this.floatingLabelBehavior,
    this.maxLength,
    this.hasBorder = true,
    this.padding,
    this.height,
    this.hintStyle,
    this.maxLines,
    this.suffixText,
    this.prefixIcon,
    this.borderRadius,
    this.suffixSize,
  }) : super(key: key);

  final TextEditingController?
      controller;
  final String? label;
  final String? hint;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>?
      validator;
  final String? error;
  final FocusNode? focusNode;
  final List<TextInputFormatter>?
      inputFormatters;
  final bool enabled;
  final bool readOnly;
  final bool enableUnderline;
  final VoidCallback? onSuffixTap;
  final TextInputAction?
      textInputAction;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final TextAlign textAlign;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final FloatingLabelBehavior?
      floatingLabelBehavior;
  final int? maxLength;
  final bool hasBorder;
  final EdgeInsets? padding;
  final double? height;
  final int? maxLines;
  final String? suffixText;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;
  final BoxConstraints? suffixSize;

  @override
  Widget build(BuildContext context) {
    final theme = context.myTheme;
    return Container(
      height: height,
      padding: padding,
      decoration: hasBorder
          ? BoxDecoration(
              border: Border.all(
                  width: 0.5,
                  color: context
                      .myTheme
                      .borderThemeT1
                      .title
                      .color!),
            )
          : null,
      child: TextFormField(
        key: key,
        maxLength: maxLength,
        autovalidateMode:
            AutovalidateMode
                .onUserInteraction,
        onChanged: onChanged,
        onEditingComplete:
            onEditingComplete,
        textInputAction:
            textInputAction,
        controller: controller,
        readOnly: readOnly,
        style: style ??
            theme.textThemeT1.body,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: prefixIcon,
          suffixText: suffixText,
          suffixIconConstraints:
              suffixSize,
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  onTap: onSuffixTap,
                  child: suffixIcon)
              : null,
          border: enableUnderline
              ? const UnderlineInputBorder()
              : InputBorder.none,
          labelText: label,
          hintText: hint,
          errorText: error,
          labelStyle:
              theme.textThemeT1.body,
          hintStyle: hintStyle ??
              theme.textThemeT1.body,
          floatingLabelBehavior:
              FloatingLabelBehavior
                  .always,
          contentPadding:
              const EdgeInsets
                      .symmetric(
                  vertical: MeCarDimens
                      .spacing6),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        textAlignVertical:
            TextAlignVertical.center,
        validator: validator,
        focusNode: focusNode,
        inputFormatters:
            inputFormatters,
        enabled: enabled,
        textAlign: textAlign,
      ),
    );
  }
}
