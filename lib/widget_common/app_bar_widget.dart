import 'package:flutter/material.dart';
import 'package:mecar/util/extension/context_ext.dart';
import 'button_widget.dart';

class MeCarAppBar extends StatefulWidget
    with PreferredSizeWidget {
  const MeCarAppBar({
    Key? key,
    this.centerTitle,
    this.addCloseBtn = false,
    this.leading,
    required this.title,
  }) : super(key: key);

  @override
  State<MeCarAppBar> createState() =>
      _MeCarAppBarState();

  @override
  Size get preferredSize =>
      const Size(50, 50);

  final String title;
  final bool? centerTitle;
  final Widget? leading;
  final bool addCloseBtn;
}

class _MeCarAppBarState
    extends State<MeCarAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle:
          widget.centerTitle ?? true,
      leading: widget.addCloseBtn
          ? MeCarIconButton(
              onPressed: () =>
                  context.pop(),
              icon: Icon(Icons.close,
                  color: context
                      .myTheme
                      .buttonThemeT1
                      .body
                      .color))
          : MeCarIconButton(
              onPressed: () =>
                  context.pop(),
              icon: Icon(
                  Icons
                      .arrow_back_rounded,
                  color: context
                      .myTheme
                      .buttonThemeT1
                      .body
                      .color)),
      title: Text(widget.title,
          style: context.myTheme
              .textThemeT1.bigTitle
              .copyWith(
                  color: context
                      .myTheme
                      .colorScheme
                      .primary)),
      elevation: 0,
    );
  }
}
