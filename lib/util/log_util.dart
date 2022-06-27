import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@singleton
class LogUtil {
  static createCubitAndState(C, S) {
    final logger = Logger(
      printer:
          PrettyPrinter(methodCount: 0),
    );
    logger.i(
        'Create ${C.toString()} with ${S.toString()}');
  }

  static deleteCubitAndState(C, S) {
    final logger = Logger(
      printer:
          PrettyPrinter(methodCount: 0),
    );
    logger.i(
        'Delete ${C.toString()} with ${S.toString()}');
  }
}
