import 'package:sqflite/sqflite.dart';
import 'package:unavida/model/log/log_entry.dart';

import 'log.dart';

class LogEntryDao {
  final Database db;

  LogEntryDao(this.db);

  /// Returns a list of all the log entries. It includes all the different
  /// types.
  Future<List<LogEntry>> getAllLogEntries() async {
    final List<Map<String, dynamic>> maps = await db.query('log_entries');
    return List.generate(maps.length, (i) {
      return LogEntry.fromMap(maps[i]);
    });
  }

  ///Returns a list of all the log entries of a given type as parameter.
  Future<List<LogEntry>> getLogEntriesByType(LogType type) async {
    final List<Map<String, dynamic>> maps = await db.query(
      'log_entries',
      where: 'type = ?',
      whereArgs: [
        Log.logTypeToString(type),
      ],
    );
    return List.generate(maps.length, (i) {
      return LogEntry.fromMap(maps[i]);
    });
  }

  /// Inserts a new log entry into the database.
  Future<void> insertLogEntry(LogEntry logEntry) async {
    print('Inserting log entry: ${logEntry.toMap()}');
    await db
        .insert(
      'log_entries',
      logEntry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    )
        .then((value) {
      if (value > 0) {
        print('Log entry inserted successfully');
      } else {
        print('Log entry insertion failed');
      }
    });
  }
}
