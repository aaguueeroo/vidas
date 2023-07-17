import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

abstract class DataAccessObject {
  final Database _database;
  get database => _database;
  late String tableName;
  late DatabaseHelper databaseHelper;

  DataAccessObject(this._database, this.tableName) {
    databaseHelper = DatabaseHelper(_database);
  }

  //CREATE
  Future<void> createRow(Map<String, dynamic> map) async {
    await databaseHelper.createRow(tableName, map);
  }

  //READ
  Future<List<Map<String, dynamic>>?> readTable() async {
    return await databaseHelper.readTable(tableName);
  }

  Future<Map<String, dynamic>?> readRowById(int id) async {
    return await databaseHelper.readRowById(tableName, id);
  }

  //UPDATE
  Future<void> updateRow(int id, Map<String, dynamic> map) async {
    databaseHelper.updateRow(tableName, id, map);
  }

  //DELETE
  Future<void> deleteOneRow(int primaryKey) async {
    databaseHelper.deleteRow(tableName, primaryKey);
  }
}
