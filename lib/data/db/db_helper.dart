import 'package:path/path.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';

import 'scheme/schema_version_1.dart';

// https://stackoverflow.com/questions/61749660/sqlite-migration-in-flutter
// https://cyj893.github.io/flutter/Flutter2/
// https://github.com/tekartik/sqflite/blob/master/sqflite/doc/opening_asset_db.md
class DBHelper {
  DBHelper._internal();

  static final DBHelper _dbHelper = DBHelper._internal();

  static Database? _database;

  factory DBHelper() => _dbHelper;

  Future<Database> get database async => _database ?? await initDataBase();

  Future<Database> initDataBase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, "tome_database.db");
    // Directory tempDir = await getTemporaryDirectory();
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, 'card_surfer.db');
    // Make sure the parent directory exists
    if (!File(path).existsSync()) {
      try {
        final Directory dir = Directory(dirname(path));
        dir.createSync(recursive: true);
      } catch (_) {}

      // Copy from asset
      // ByteData data = await rootBundle.load(join("assets/db", "file.db"));
      // List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // await File(path).writeAsBytes(bytes, flush: true);
    }
    // String path = join(path, 'card_surfer.db');
    return await openDatabase(path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(SchemaVersionOne.myMemoryTable);
          // await db.execute(SchemaVersionOne.insertOneCard);
          // await db.execute(SchemaVersionOne.insertTwoCard);
          // if the database does not exist, onCreate executes all the sql requests of the "migrationScripts" map
          // for (int i = 1; i <= nbrMigrationScripts; i++) {
          //   await db.execute(migrationScripts[i]);
          // }
        },
        onOpen: (db) {},
        onConfigure: (db) {},
        onDowngrade: (db, oldVersion, newVersion) {},
        singleInstance: true,
        onUpgrade: (Database db, int oldVersion, int newVersion) async {
          // for (int i = oldVersion + 1; i <= newVersion; i++) {
          //   await db.execute(migrationScripts[i]);
          // }
        });
  }
}
