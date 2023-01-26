import 'package:sqflite/sqflite.dart';
import 'package:tome/data/db/db_helper.dart';
import 'package:tome/data/db/model/memory.dart';
import 'package:tome/data/db/scheme/table_name.dart';

class MemoryRepository {
  final db = DBHelper().database;

  Future<List<MemoryItemModel>> getAllMemory() async {
    Database db = await this.db;
    List<Map<String, dynamic>> ret = await db.query(TableNameList.tableMemory);
    final items = <MemoryItemModel>[];
    items.addAll(ret.map((e) => MemoryItemModel.fromMap(e)));
    return items;
  }
}