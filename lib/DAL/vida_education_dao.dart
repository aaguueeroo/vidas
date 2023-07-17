import 'package:sqflite/sqflite.dart';

import '../model/education/education.dart';
import 'data_access_object.dart';

class VidaEducationDao extends DataAccessObject {
  static const vidaEducationTableName = 'vida_education';
  VidaEducationDao(Database database) : super(database, vidaEducationTableName);

  ///Calls the super to retrieve the row from the table corresponding to the
  ///specified id and translates it into a Education object. Then it puts all
  ///the objects into a List
  Future<List<Education>?> getEducationListById(int id) async {
    final map = await databaseHelper.joinEducationVidaWithEducation(id);
    List<Education>? list;

    if (map != null) {
      list = [];

      for (int i = 0; i < map.length; i++) {
        list.add(Education.fromMap(map[i]));
      }
    }

    return list;
  }

  Future<void> deleteRowByVidaId(int vidaId) async {
    await databaseHelper.deleteRowsByVidaId(vidaEducationTableName, vidaId);
  }
}
