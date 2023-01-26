import 'package:logger/logger.dart';

extension LogExtension on Object? {
  void log({ Level? type, String? msg}) {
    Logger().log(type ?? Level.debug, '${msg ?? 'Message'}: ${this}');
  }
}
