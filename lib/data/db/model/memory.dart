import 'dart:typed_data';

import 'package:tome/data/db/model/base.dart';

const memoryQuestionColumn = 'question';
const memoryAnswerColumn = 'answer';
const memoryCorrectCountColumn = 'correctCount';
const memoryWrongCountColumn = 'wrongCount';
const memoryQuestionImage = 'questionImage';
const memoryAnswerImage = 'answerImage';
const memoryCTimeColumn = 'cTime';
const memoryUTimeColumn = 'uTime';

class MemoryItemModel extends BaseModel {
  String question = '';
  String answer = '';
  int correctCnt = 0;
  int wrongCnt = 0;
  Uint8List? questionImage = Uint8List.fromList([]);
  Uint8List? answerImage = Uint8List.fromList([]);

  MemoryItemModel.init({
      required pMemoryQuestion,
      required pMemoryAnswer,
      pMemoryQuestionImage,
      pMemoryAnswerImage,
  }) : super.init() {
    question = pMemoryQuestion;
    answer = pMemoryAnswer;
    questionImage = pMemoryQuestionImage ?? Uint8List.fromList([]);
    answerImage = pMemoryAnswerImage ?? Uint8List.fromList([]);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> itemMap = <String, dynamic>{};
    itemMap[uidColumn] = uid;
    itemMap[cTimeColumn] = cTime;
    itemMap[uTimeColumn] = uTime;

    itemMap[memoryQuestionColumn] = question;
    itemMap[memoryAnswerColumn] = answer;
    itemMap[memoryCorrectCountColumn] = memoryCorrectCountColumn;
    itemMap[memoryWrongCountColumn] = memoryWrongCountColumn;
    return itemMap;
  }

  MemoryItemModel.fromMap(Map<String, Object?> map)
      : super(
          uid: map[uidColumn] as String,
          cTime: map[cTimeColumn] as num,
          uTime: map[uTimeColumn] as num,
        ) {
    question = map[memoryQuestionColumn] as String;
    answer = map[memoryAnswerColumn] as String;
    correctCnt = map[memoryCorrectCountColumn] as int;
    wrongCnt = map[memoryWrongCountColumn] as int;
    questionImage = map[memoryQuestionColumn] as Uint8List;
    answerImage = map[memoryAnswerColumn] as Uint8List;
  }
}
