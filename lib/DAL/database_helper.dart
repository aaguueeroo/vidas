import 'package:sqflite/sqflite.dart';

///Includes all the SQL code.
///
/// It always communicates with Maps as parameters and return values. The
/// translation to objects must be done in the DAOs.
class DatabaseHelper {
  final Database _database;

  DatabaseHelper(this._database);

  ////////BASIC CRUD OPERATIONS////////

  //Create
  Future<void> createRow(String tableName, Map<String, dynamic> row) async {
    await _database.insert(
      tableName,
      row,
      conflictAlgorithm: ConflictAlgorithm.rollback,
    );
  }

  //Read
  Future<List<Map<String, dynamic>>?> readTable(
    String tableName, {
    List<String>? columns,
  }) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      tableName,
      columns: columns,
    );

    return maps.isNotEmpty ? maps : null;
  }

  Future<Map<String, dynamic>?> readRowById(
    String tableName,
    int id, {
    List<String>? columns,
  }) async {
    final List<Map<String, dynamic>> rows = await _database.query(
      tableName,
      columns: columns,
      where: 'id = ?',
      whereArgs: [id],
    );
    return rows.isNotEmpty ? rows.first : null;
  }

  //Update
  Future<void> updateRow(
    String tableName,
    int id,
    Map<String, dynamic> row,
  ) async {
    await _database.update(
      tableName,
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Delete
  Future<void> deleteRow(String tableName, int primaryKey) async {
    await _database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [primaryKey],
    );
  }

  Future<void> deleteRowsByVidaId(String tableName, int vidaId) async {
    await _database.delete(
      tableName,
      where: 'vida_id = ?',
      whereArgs: [vidaId],
    );
  }

  //////// SPECIFIC OPERATIONS ////////
  Future<List<Map<String, dynamic>>?> selectLatestId() async {
    return await _database.rawQuery('SELECT last_insert_rowid();');
  }

  ///////// JOIN QUERIES //////////
  Future<List<Map<String, dynamic>>?> joinEducationVidaWithEducation(int id) async {
    const sql = '''
      SELECT 
        vida_coursez.id, 
        vida_coursez.education_id, 
        courses.name, 
        courses.price, 
        courses.field, 
        courses.level, 
        courses.institution, 
        courses.totalYears, 
        vida_course.current_year, 
        vida_course.extra_years, 
        vida_course.grade, 
        vida_course.finished, 
        vida_course.abandoned, 
        vida_course.kicked_out
      FROM vida_course
      JOIN courses ON vida_course.education_id = courses.id
      WHERE vida_course.vida_id = ?;
    ''';

    return await _database.rawQuery(sql, [id]);
  }

}
