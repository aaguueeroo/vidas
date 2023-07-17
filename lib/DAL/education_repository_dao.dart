import 'package:sqflite/sqflite.dart';

import 'data_access_object.dart';

class EducationRepositoryDao extends DataAccessObject {

  EducationRepositoryDao(Database database) : super(database, 'education_repository');

  Future<Map<String, dynamic>?> readRowById(int id) async {
    return await databaseHelper.readRowById(tableName, id);
  }

}