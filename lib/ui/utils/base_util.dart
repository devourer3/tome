import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

extension LogExtension on Object? {
  void log({ Level? type, String? msg}) {
    Logger().log(type ?? Level.debug, '${msg ?? 'Message'}: ${this}');
  }
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild?.context?.widget is! EditableText);
  }
}