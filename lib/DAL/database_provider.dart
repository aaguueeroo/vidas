import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider instance = DatabaseProvider._();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'unavida.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future _createDatabase(Database db, int version) async {
    await db.execute('''
          CREATE TABLE IF NOT EXISTS log_entries (
            id INTEGER PRIMARY KEY,
            type TEXT NOT NULL,
            subtype TEXT,
            timestamp TEXT NOT NULL,
            details TEXT NOT NULL
          )
          
          CREATE TABLE IF NOT EXISTS job_positions (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            company TEXT NOT NULL,
            salary INTEGER NOT NULL,
            description TEXT NOT NULL
          )
          
     ''');
  }
}
