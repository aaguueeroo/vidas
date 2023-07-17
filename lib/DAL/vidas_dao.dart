import 'package:sqflite/sqflite.dart';

import 'package:unavida/model/vida_saving_slot.dart';
import 'data_access_object.dart';

/// Manages the CRUD operations for the table called 'vidas' in the vidas.db
class VidasDao extends DataAccessObject {

  VidasDao(Database database) : super(database, 'vidas');

  ///Calls the super to retrieve the row from the table corresponding to the
  ///specified id and translates it into a VidaSavingSlot object.
  Future<List<VidaSavingSlot>?> getSlots() async {
    final List<Map<String, dynamic>>? maps = await readTable();

    if (maps == null) return null;
    return maps.map((map) => VidaSavingSlot.fromMap(map)).toList();
  }

  ///Calls the super to retrieve the row from the table corresponding to the
  ///specified id and translates it into a Vida object.
  Future<VidaSavingSlot?> getSlotById(int id) async {
    final map = await super.readRowById(id);

    if (map == null) return null;
    return VidaSavingSlot.fromMap(map);
  }
}
