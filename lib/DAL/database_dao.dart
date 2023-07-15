import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseDao {
  static const String _databaseName = 'unavida.db';
  static const int _databaseVersion = 1;

  // Private constructor
  DatabaseDao._();

  static final DatabaseDao instance = DatabaseDao._();

  static Database? _database;

  /// Returns the [_database] instance or creates a new one if it doesn't exist.
  /// If the database does not exist in the app directory, it will be copied
  /// from the assets directory.
  ///
  /// Returns a [Future] that resolves to a [Database] instance once it is
  /// available.
  ///
  /// Throws an error if the database cannot be opened.
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

  /// Copies the database file from the assets folder to the application
  /// documents directory for use in the app.
  ///
  /// This function first obtains the directory where the app can store files,
  /// then loads the database file from the assets folder using its asset path,
  /// and finally writes the loaded database data to a file in the documents
  /// directory. If successful, the function completes with a `Future<void>`.
  ///
  /// If any errors occur during the copying process, the function catches the
  /// error and prints it to the console, but does not throw the error.
  ///
  /// Throws:
  ///   - None.
  ///
  /// Returns:
  ///   - A `Future` that completes with `void` when the database file is
  ///     successfully copied.
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

  //CREATE


  //READ
  // Future<void> readDb() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> result = await db!.query('vidas');
  //   print(result);
  // }

  //UPDATE


  //DELETE
}
