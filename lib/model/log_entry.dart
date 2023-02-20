/// A log is a record of a player's activity in the game.
class LogEntry {
  /// Subtype of the log entry. Used in specific cases such as "social", to
  /// specify the person with whom the player interacted.
  late String? _subtype;
  get subtype => _subtype;

  /// Date of the log entry. Used to calculate the order of the log entries.
  late DateTime _timestamp;
  get timestamp => _timestamp;

  /// Description of the log entry that contains that actual information that
  /// will be displayed to the player.
  late String _description;
  get description => _description;

  /// Constructor for a log entry.
  LogEntry(
    this._subtype,
    this._timestamp,
    this._description,
  );

  LogEntry.fromMap(Map<String, dynamic> map) {
    _subtype = map['subtype'];
    _timestamp = DateTime.parse(map['timestamp']);
    _description = map['description'];
  }

  Map<String, dynamic> toMap() => {
        'subtype': _subtype,
        'timestamp': _timestamp.toIso8601String(),
        'description': _description,
      };
}
