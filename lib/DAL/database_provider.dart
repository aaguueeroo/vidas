import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static const String _databaseName = 'unavida.db';
  static const int _databaseVersion = 1;

  // Private constructor
  DatabaseProvider._();

  static final DatabaseProvider instance = DatabaseProvider._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    // Copy the database from assets if it doesn't exist in the app directory
    await _copyDatabase();

    // Otherwise, open the database from the app directory
    _database = await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      version: _databaseVersion,
    );
    return _database;
  }

  Future<void> _copyDatabase() async {
    try {
      // Get a reference to the directory where the app can store files.
      final documentsDirectory = await getApplicationDocumentsDirectory();

      // Get a reference to the database asset file
      const assetPath = 'assets/$_databaseName';
      final ByteData data = await rootBundle.load(assetPath);

      // Write the data out to a file
      final Uint8List bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      final file = File('${documentsDirectory.path}/$_databaseName');
      await file.writeAsBytes(bytes, flush: true);
    } catch (e) {
      print(e);
    }
  }

  Future<void> readDb() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db!.query('viders');
    print(result);
  }
}
