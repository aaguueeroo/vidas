import 'package:flutter/cupertino.dart';
import 'package:unavida/model/stats.dart';
import 'education/education.dart';
import 'log/log.dart';

class Vida with ChangeNotifier{
  /// Name of the player
  late String _name;
  get name => _name;

  /// Last name of the player
  late String _lastName;
  get lastName => _lastName;

  /// Energy of the player. It decreases every time the player does an action,
  /// and it resets every new year.
  late double _energy;
  get energy => _energy / 100;

  /// Age of the player
  late int _age;
  get age => _age;

  /// Money of the player during the vida
  late int _money;
  get money => _money;

  /// Education of the player that includes all the education acquired until now
  // late Education _education;

  /// List of logs that contains all the logs of the player.
  late List<Log> _logs;

  /// Stats of the player for the current Vida.
  // late Stats _stats;

  ///Constructor for when a game is started for the first time.
  Vida.newGame({required String name, required String lastName}) {
    _name = name;
    _lastName = lastName;
    _energy = 100;
    _age = 0;
    _money = 0;
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
    required int age,
    required int money,
    required Education education,
    required List<Log> logs,
    required Stats stats,
  }) {
    _name = name;
    _lastName = lastName;
    _age = age;
    _money = money;
    _logs = logs;
    // _education = education;
    // _stats = stats;
  }


}
