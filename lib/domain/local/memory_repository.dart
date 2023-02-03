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

  Future<int> getMemoryCount() async {
    Database db = await this.db;
    dynamic ret = await db.rawQuery('SELECT COUNT(*) FROM MEMORY');
    int count = Sqflite.firstIntValue(ret) ?? 0;
    return count;
  }

  Future<int> insertMemory(MemoryItemModel item) async {
    Database db = await this.db;
    Map<String, dynamic> memoryItem = item.toMap();
    Future<int> ret = db.insert(TableNameList.tableMemory, memoryItem);
    return ret;
  }

  Future<int> removeCardItem(String uid) async {
    Database db = await this.db;
    int ret = await db.delete(TableNameList.tableMemory, where: 'uid = "$uid"');
    return ret;
  }
}