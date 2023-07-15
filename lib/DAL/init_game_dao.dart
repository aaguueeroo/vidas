import 'package:sqflite/sqflite.dart';

import 'database_dao.dart';

///Gathers the connections to the database to init the game. It can query
///all the saved games, create a new game, delete a game, and load a game.
class InitGameDao{
  static final InitGameDao instance = InitGameDao._();
  late Database? _database;

  InitGameDao._();

  Future<void> initialize() async {
    _database = await DatabaseDao.instance.database;
  }

}