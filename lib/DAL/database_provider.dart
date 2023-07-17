import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:unavida/DAL/education_repository_dao.dart';
import 'package:unavida/DAL/vida_education_dao.dart';
import 'package:unavida/DAL/vidas_dao.dart';
import 'package:unavida/model/vida.dart';
import 'package:unavida/model/vida_saving_slot.dart';

import '../model/education/education.dart';
import 'database_helper.dart';

class DatabaseProvider {
  static final DatabaseProvider instance = DatabaseProvider._();

  static const String _databaseName = 'vidas.db';
  static const int _databaseVersion = 1;
  late DatabaseHelper databaseHelper;
  late VidasDao vidasDao;
  late VidaEducationDao vidaEducationDao;
  late EducationRepositoryDao educationRepositoryDao;
  static Database? _database;

  DatabaseProvider._() {
    _initialize();
  }

  _initialize() async {
    databaseHelper = DatabaseHelper(await database);
    vidasDao = VidasDao(await database);
    vidaEducationDao =
        VidaEducationDao(await database);
    educationRepositoryDao =
        EducationRepositoryDao(await database);
  }

  /// Returns the [_database] instance or creates a new one if it doesn't exist.
  /// If the database does not exist in the app directory, it will be copied
  /// from the assets directory.
  ///
  /// Returns a [Future] that resolves to a [Database] instance once it is
  /// available.
  ///
  /// Throws an error if the database cannot be opened.
  get database async {
    if (_database != null) return _database;

    // Copy the database from assets if it doesn't exist in the app directory
    final databasesPath = await getDatabasesPath();
    final databasePath = join(databasesPath, _databaseName);
    final databaseFile = File(databasePath);

    if(!databaseFile.existsSync()){
      await _copyDatabase();
    }

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
      print('Error copying the database: $e');
    }
  }

  /// Saves the game in the database.
  ///
  /// Translates from object to database. For that, it gets a Vida object and
  /// breaks it down into the different tables in the database.
  ///
  /// Checks if the game has been saved before. If it has (vida.id != null), it
  /// updates the game data in the database. If it hasn't (vida.id == null), it
  /// inserts the game data in the database.
  Future<void> saveGame(Vida vida) async {
    if (vida.id == null) {
      //Store the game for the first time



      await vidasDao.createRow(vida.toSlot().toMap());

      // Other tables
      for (int i = 0; i < vida.education.length; i++) {
        await vidaEducationDao.createRow(vida.education[i].toMap());
      }
    } else {
      //Updates a stored game
      await vidasDao.updateRow(vida.id!, vida.toSlot().toMap());

      if (vida.education.length > 0){
        for (int i = 0; i < vida.education.length; i++) {
          if (vida.education[i].id == null) {
            await vidaEducationDao.createRow(vida.education[i].toMap());
          } else {
            await vidaEducationDao.updateRow(
                vida.education[i].id!, vida.education[i].toMap());
          }
        }
      }
    }
    print('Game saved');
  }

  Future<int?> getLatestId() async {
    final result = await databaseHelper.selectLatestId();
    if (result != null && result.isNotEmpty) {
      final lastId = result.first.values.first;
      if (lastId is int) {
        print('Last inserted row ID: $lastId');
        return lastId;
      }
    }
    return null;
  }

  Future<Vida> loadGame(VidaSavingSlot slot) async {

    final List<Education>? education = await vidaEducationDao.getEducationListById(slot.id!);

    if (education == null) {
      print('Education not found');
      // return;
    }

    return Vida.loadGame(
      slot: slot,
      education: education!,
    );

  }

  Future<void> deleteGame(VidaSavingSlot slot) async {
    await vidasDao.deleteOneRow(slot.id!);

    print('Game deleted');
  }

  Future<List<VidaSavingSlot>?> getSlots() async {
      return (await vidasDao.getSlots())!;
  }

}
