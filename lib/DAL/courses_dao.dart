import 'package:sqflite/sqflite.dart';

import 'data_access_object.dart';

class CoursesDao extends DataAccessObject {
  CoursesDao(Database database) : super(database, 'courses');

  Future<Map<String, dynamic>?> readRowById(int id) async {
    return await databaseHelper.readRowById(tableName, id);
  }
}