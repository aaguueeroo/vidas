import 'package:unavida/model/traits.dart';

import 'Gender.dart';
import 'education/education.dart';
import 'log/log.dart';

/// Class that contains all the information of the game.
class Vida {
  static final Vida _instance = Vida._();

  Vida._();

  // factory Vida() {
  //   return _instance;
  // }

  ///Id of the state of the game. It will be null before it is inserte in the
  ///database for the first time.
  int? _id;
  get id => _id;

  late int _avatar;
  get avatar => _avatar;

  late String _name;
  get name => _name;

  late Genders _gender;
  get gender => _gender;

  late int _age;
  int get age => _age;

  late int _money;
  get money => _money;

  /// Education of the player that includes all the education acquired until now
  late List<Education> _education;

  /// Stats of the player for the current Vida.
  // late Stats _stats;

  /// Traits of the players.
  late Traits _traits;

  /// Energy of the player. It decreases every time the player does an action,
  /// and it resets every new year.
  late double _energy;
  get energy => _energy / 100;

  /// List of logs that contains all the performed actions, random events and
  /// other information that will be displayed in the log view.
  late List<Log> _logs;

  Vida _initialize({
    int? id,
    required String name,
    required Genders gender,
    required int avatar,
    double energy = 100,
    int age = 0,
    int money = 0,
    List<Education> education = const [],
    List<Log> logs = const [],
    required Traits traits,
    // Other required parameters
  }) {
    _id = id;
    _name = name;
    _gender = gender;
    _avatar = avatar;
    _energy = energy;
    _age = age;
    _money = money;
    _logs = logs;
    _traits = traits;
    // Assign other properties
    return this;
  }

  ///Constructor for when a game is started for the first time. The parameter
  ///id is not required since it will be null until the game is inserted in the
  ///database for the first time.
  factory Vida.newGame({
    required String name,
    required Genders gender,
    required int avatar,
    required Traits traits,
    // Other required parameters
  }) {

    // final traits = Traits(); // Create traits object
    return _instance._initialize(
      name: name,
      gender: gender,
      avatar: avatar,
      traits: traits,
      // TODO: Education
      // TODO: Stats
    );
  }

  void growUp() {
    _age++;
    _energy = 100;

    for (int i = 0; i< _education.length; i++) {
      _education[i].advanceYear();
    }
  }

  ///Constructor for when a game is loaded from the database. The parameter
  ///id is required to be able to identify the game in the database.
  // factory Vida.loadGame({
  //   required int id,
  //   required String name,
  //   required Genders gender,
  //   required int avatar,
  //   required int age,
  //   required int money,
  //   required double energy,
  //   // required Education education,
  //   // required Stats stats,
  //   required List<Log> logs,
  //   required Traits traits,
  // }) {
  //   final vida = _instance._initialize(
  //     id: id,
  //     name: name,
  //     gender: gender,
  //     avatar: avatar,
  //     age: age,
  //     money: money,
  //     energy: energy,
  //     logs: logs,
  //     traits: traits,
  //     // Other parameters
  //   );
  //
  //   return vida;
  // }

}
