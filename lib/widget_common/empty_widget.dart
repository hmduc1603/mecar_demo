import 'package:flutter/cupertino.dart';
import 'package:mecar/util/extension/context_ext.dart';

class MeCarEmptyData
    extends StatelessWidget {
  const MeCarEmptyData(
      {Key? key, this.message})
      : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
            message ?? 'No Content',
            style: context.myTheme
                .textThemeT2.body));
  }
}
