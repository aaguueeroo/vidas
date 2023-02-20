import 'log_entry.dart';

/// Types of log entries.
enum LogType {
  general,
  social,
  health,
  work,
  education,
  leisure,
}

class Log {
  /// Identifies the type of log.
  late final LogType _type;
  get type => _type;

  /// List of log entries.
  late List<LogEntry> _entries;
  get entries => _entries;

  Log({required LogType type}) {
    _type = type;
    _entries = [];
  }

  /// Factory constructor from map.
  factory Log.fromMap(Map<String, dynamic> map) => Log(
        type: stringToLogType(map['type']),
      ).._entries = List<LogEntry>.from(
          map['entries'].map((e) => LogEntry.fromMap(e)),
        );

  /// Converts the log to a map.
  Map<String, dynamic> toMap() => {
        'type': logTypeToString(_type),
        'entries': _entries.map((e) => e.toMap()).toList(),
      };

  /// Helper function to convert a [LogType] to a string.
  static String logTypeToString(LogType logType) {
    switch (logType) {
      case LogType.general:
        return 'general';
      case LogType.social:
        return 'social';
      case LogType.health:
        return 'health';
      case LogType.work:
        return 'work';
      case LogType.education:
        return 'education';
      case LogType.leisure:
        return 'leisure';
      default:
        throw Exception('Unknown LogType: $logType');
    }
  }

  /// Helper function to convert a string to a [LogType].
  static LogType stringToLogType(String str) {
    switch (str) {
      case 'general':
        return LogType.general;
      case 'social':
        return LogType.social;
      case 'health':
        return LogType.health;
      case 'work':
        return LogType.work;
      case 'education':
        return LogType.education;
      case 'leisure':
        return LogType.leisure;
      default:
        throw Exception('Unknown LogType string: $str');
    }
  }
}
