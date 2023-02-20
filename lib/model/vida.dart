import 'package:unavida/model/stats.dart';
import 'education.dart';
import 'log.dart';

class Vida {
  /// Name of the player
  late String _name;

  /// Last name of the player
  late String _lastName;

  /// Education of the player that includes all the education acquired until now
  late Education _education;

  /// List of logs that contains all the logs of the player.
  late List<Log> _logs;

  /// Stats of the player for the current Vida.
  late Stats _stats;

  ///Constructor for when a game is started for the first time.
  Vida.newGame({required String name, required String lastName}) {
    _name = name;
    _lastName = lastName;
    _logs = [
      Log(type: LogType.general),
      Log(type: LogType.social),
      Log(type: LogType.health),
      Log(type: LogType.work),
      Log(type: LogType.education),
      Log(type: LogType.leisure),
    ];
    //TODO education
    //TODO stats
  }

  ///Constructor for when a game is loaded from the database.
  Vida.loadGame({
    required String name,
    required String lastName,
    required Education education,
    required List<Log> logs,
    required Stats stats,
  }) {
    _name = name;
    _lastName = lastName;
    _education = education;
    _logs = logs;
    _stats = stats;
  }


}
