import 'package:sqflite/sqflite.dart';

import '../model/vida.dart';
import 'database_dao.dart';

class VidaDao {
  static final VidaDao instance = VidaDao._();
  late Database? _database;

  VidaDao._();

  Future<void> initialize() async {
    _database = await DatabaseDao.instance.database;
  }

  //CREATE
  Future<void> createStateTables() async {
    final db = await _database;

    await db?.transaction((txn) async {
      // Create the vidas table
      await txn.execute('''
      CREATE TABLE IF NOT EXISTS vidas (
        id INTEGER PRIMARY KEY,
        date_created TEXT NOT NULL,
        date_modified TEXT NOT NULL,
        game_data TEXT NOT NULL
      )
    ''');

      // Create the vida_event table
      await txn.execute('''
      CREATE TABLE IF NOT EXISTS vida_event (
        id INTEGER PRIMARY KEY,
        vida_id INTEGER NOT NULL,
        event_id INTEGER NOT NULL,
        FOREIGN KEY (vida_id) REFERENCES vidas(id),
        FOREIGN KEY (event_id) REFERENCES events(id)
      )
    ''');

      // Create the events table
      await txn.execute('''
      CREATE TABLE IF NOT EXISTS events (
        id INTEGER PRIMARY KEY,
        type TEXT,
        subtype TEXT,
        details TEXT
      )
    ''');
      print('tables created');
    });

  }

  Future<void> insertVida(String gameData) async {
    final db = await instance._database;
    final now = DateTime.now();
    await db?.insert(
      'vidas',
      {
        'date_created': now.toIso8601String(),
        'date_modified': now.toIso8601String(),
        'game_data': gameData,
      },
    );

    print('vida stored');
  }

  //READ
  Future<List<int>?> getAllVidaIds() async {
    final result = await _database?.rawQuery('SELECT id FROM vidas');
    print('getAllVidaIds: $result');
    print(result?.map<int>((row) => row['id'] as int).toList());
    return result?.map<int>((row) => row['id'] as int).toList();
  }

  Future<Vida> loadVida(int id) async {
    final result = await _database!.query('vidas', where: 'id = ?', whereArgs: [id]);
    return Vida.fromMap(result.first);
  }


  //UPDATE

  //save vida
  Future<void> saveVida(Vida vida) async {
    final db = await instance._database;
    final now = DateTime.now();
    await db?.update(
      'vidas',
      {
        'date_modified': now.toIso8601String(),
        'game_data': vida.toJson(),
      },
      where: 'id = ?',
      whereArgs: [vida.id],
    );
  }

  //DELETE
}
