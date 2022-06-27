import 'package:flutter/cupertino.dart';

class MeCarErrorWidget
    extends StatelessWidget {
  const MeCarErrorWidget(
      {Key? key,
      required this.onReload,
      required this.message})
      : super(key: key);

  final VoidCallback onReload;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Text(message,
              textAlign:
                  TextAlign.center),
          CupertinoButton(
              child:
                  const Text('Thử lại'),
              onPressed: onReload),
        ],
      ),
    );
  }
}
