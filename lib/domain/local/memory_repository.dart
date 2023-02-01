import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tome/data/db/db_helper.dart';
import 'package:tome/data/db/model/memory.dart';
import 'package:tome/data/db/scheme/table_name.dart';
import 'package:tome/ui/utils/base_util.dart';

class MemoryRepository {
  final db = DBHelper().database;

  Future<List<MemoryItemModel>> getAllMemory() async {
    Database db = await this.db;
    List<Map<String, dynamic>> ret = await db.query(TableNameList.tableMemory);
    final items = <MemoryItemModel>[];
    items.addAll(ret.map((e) => MemoryItemModel.fromMap(e)));
    return items;
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