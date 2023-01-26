import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

const uidColumn = 'uid';
const cTimeColumn = 'cTime';
const uTimeColumn = 'uTime';

// https://stackoverflow.com/questions/34910686/how-can-i-get-the-current-date-w-o-hour-and-minutes
// https://stackoverflow.com/questions/13272035/how-do-i-call-a-super-constructor-in-dart
class BaseModel extends Equatable {
  String? uid = const Uuid().v4();
  num? cTime = DateTime.now().millisecondsSinceEpoch;
  num? uTime = DateTime.now().millisecondsSinceEpoch;

  BaseModel({required uid, required cTime, required uTime});

  BaseModel.init() {
    uid = const Uuid().v4();
    cTime = DateTime.now().millisecondsSinceEpoch;
    uTime = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  List<Object?> get props => [uid, cTime, uTime];

}