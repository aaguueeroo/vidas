import 'dart:convert';

import 'package:unavida/model/log/log.dart';

/// A log is a record of a player's activity in the game.
class LogEntry {
  ///Type of the log entry.
  late LogType _type;
  get type => _type;

  /// Subtype of the log entry. Used in specific cases such as "social", to
  /// specify the person with whom the player interacted.
  late String? _subtype;
  get subtype => _subtype;

  /// Date of the log entry. Used to calculate the order of the log entries.
  late String _timestamp;
  get timestamp => _timestamp;

  /// Description of the log entry that contains that actual information that
  /// will be displayed to the player.
  late String _details;
  get details => _details;

  /// Constructor for a new log entry in game. The timestamp is generated
  /// automatically depending on the current game year.
  LogEntry(
    this._type,
    this._subtype,
    this._details,
  ) {
    //TODO make the timestamp depend on the game year
    _timestamp = DateTime.now().toIso8601String();
  }

  /// Constructor for a log entry from a the database, which includes all the
  /// fields.
  LogEntry.fromDatabase(
    this._type,
    this._timestamp,
    this._subtype,
    this._details,
  );

  LogEntry.fromMap(Map<String, dynamic> map) {
    _type = Log.stringToLogType(map['type']);
    _subtype = map['subtype'];
    _timestamp = map['timestamp'];
    _details = map['details'];
  }

  Map<String, dynamic> toMap() => {
        'type': Log.logTypeToString(_type),
        'subtype': _subtype,
        'timestamp': _timestamp,
        'details': _details,
      };

  factory LogEntry.fromJson(String jsonString) =>
      LogEntry.fromMap(jsonDecode(jsonString));

  String toJson() => jsonEncode(toMap());

  String toString() {
    return 'LogEntry: type: $_type, subtype: $_subtype, timestamp: $_timestamp, details: $_details';
  }
}
