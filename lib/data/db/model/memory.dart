import 'dart:typed_data';

import 'package:tome/data/db/model/base.dart';

const memoryQuestionColumn = 'question';
const memoryAnswerColumn = 'answer';
const memoryCorrectCountColumn = 'correctCount';
const memoryWrongCountColumn = 'wrongCount';
const memoryQuestionImageColumn = 'questionImage';
const memoryAnswerImageColumn = 'answerImage';
const memoryCTimeColumn = 'cTime';
const memoryUTimeColumn = 'uTime';

class MemoryItemModel extends BaseModel {
  String question = '';
  String answer = '';
  int correctCount = 0;
  int wrongCount = 0;
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
    correctCount = 0;
    wrongCount = 0;
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
    itemMap[memoryCorrectCountColumn] = correctCount;
    itemMap[memoryWrongCountColumn] = wrongCount;
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
    correctCount = map[memoryCorrectCountColumn] as int;
    wrongCount = map[memoryWrongCountColumn] as int;
    questionImage = map[memoryQuestionImageColumn] as Uint8List?;
    answerImage = map[memoryAnswerImageColumn] as Uint8List?;
  }
}
