class SchemaVersionOne {
  static String myMemoryTable = '''
  CREATE TABLE IF NOT EXISTS MEMORY
           (
           id INTEGER PRIMARY KEY,
           uid TEXT UNIQUE,
           question TEXT,
           answer TEXT,
           correctCount INTEGER,
           wrongCount INTEGER,
           answerImage BLOB,
           questionImage BLOB,
           cTime REAL,
           uTime REAL
           );
''';
  // static String insertOneCard = '''
  // INSERT INTO MY_CREDIT_CARD
  //         (uid, cardTitle, cardBenefit, cardPerformanceAmt, cardSettlementDay, cardPaymentDay, cardMemo, cTime, uTime)
  //         VALUES ('${const Uuid().v4()}', 'IBK 일상의 기쁨', 'benefit one', 300000, '24', '1', '첫번 째 메모입니다.', ${DateTime.now().millisecondsSinceEpoch}, ${DateTime.now().millisecondsSinceEpoch})
  // ''';
  // static String insertTwoCard = '''
  // INSERT INTO MY_CREDIT_CARD
  //         (uid, cardTitle, cardBenefit, cardPerformanceAmt, cardSettlementDay, cardPaymentDay, cardMemo, cTime, uTime)
  //         VALUES ('${const Uuid().v4()}', 'KB 국민카드 올림', 'benefit two', 300000, '1', '10', '두번 째 메모입니다.', ${DateTime.now().millisecondsSinceEpoch}, ${DateTime.now().millisecondsSinceEpoch})
  // ''';
}
