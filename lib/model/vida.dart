import 'dart:convert';
import 'Gender.dart';
import 'log/log.dart';
class Vida {

  ///Id of the state of the game. It will be null before it is inserte in the
  ///database for the first time.
  int? _id;
  get id => _id;

  /// Name of the player
  late String _name;
  get name => _name;

  /// Gender of the player.
  late Genders _gender;
  get gender => _gender;

  late int _avatar;
  get avatar => _avatar;

  /// Energy of the player. It decreases every time the player does an action,
  /// and it resets every new year.
  late double _energy;
  get energy => _energy / 100;

  /// Age of the player and current year of the game.
  late int _age;
  int get age => _age;
  set age(int age) => _age = age;

  /// Money of the player during the vida
  late int _money;
  get money => _money;

  /// Education of the player that includes all the education acquired until now
  // late Education _education;

  /// Stats of the player for the current Vida.
  // late Stats _stats;

  /// Trait that determines the player's ambitious/passive personality.
  /// It will influence the amount of fun that the player gets
  /// with certain activities, and the amount of stress that the player gets
  /// after working for long periods of time. If the player is passive, it is
  /// easier to reach higher levels of happiness.
  late double _ambitiousTrait;
  late double _passiveTrait;

  /// Trait that determines the player's extroverted/introverted personality.
  /// It will influence the amount of social activities
  /// that the player needs to fulfill its social needs, and the amount of
  /// energy used in social activities, besides the fun achieved with them.
  late double _extrovertedTrait;
  late double _introvertedTrait;

  /// Trait that determines the player's active/relaxed personality.
  /// It will influence the amount of energy used when the player does an
  /// activity, and the amount of fun that the player gets with physical
  /// activities.
  late double _activeTrait;
  late double _relaxedTrait;

  /// List of logs that contains all the logs of the player.
  late List<Log> _logs;

  ///Constructor for when a game is started for the first time. The parameter
  ///id is not required since it will be null until the game is inserted in the
  ///database for the first time.
  Vida.newGame({
    required String name,
    required Genders gender,
    required int avatar,
    // required Education education,
    // required Stats stats,
    required double ambitiousTrait,
    required double passiveTrait,
    required double extrovertedTrait,
    required double introvertedTrait,
    required double activeTrait,
    required double relaxedTrait,
  }) {
    _name = name;
    _gender = gender;
    _avatar = avatar;
    _energy = 100;
    _age = 0;
    _money = 0;
    // _education = education;
    // _stats = stats;
    _ambitiousTrait = ambitiousTrait;
    _passiveTrait = passiveTrait;
    _extrovertedTrait = extrovertedTrait;
    _introvertedTrait = introvertedTrait;
    _activeTrait = activeTrait;
    _relaxedTrait = relaxedTrait;
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

  ///Constructor for when a game is loaded from the database. The parameter
  ///id is required to be able to identify the game in the database.
  Vida.loadGame({
    required int id,
    required String name,
    required Genders gender,
    required int avatar,
    required int age,
    required int money,
    required double energy,
    // required Education education,
    // required Stats stats,
    required List<Log> logs,
    required double ambitiousTrait,
    required double passiveTrait,
    required double extrovertedTrait,
    required double introvertedTrait,
    required double activeTrait,
    required double relaxedTrait,
  }) {
    _id = id;
    _name = name;
    _gender = gender;
    _avatar = avatar;
    _age = age;
    _money = money;
    _energy = energy;
    _ambitiousTrait = ambitiousTrait;
    _passiveTrait = passiveTrait;
    _extrovertedTrait = extrovertedTrait;
    _introvertedTrait = introvertedTrait;
    _activeTrait = activeTrait;
    _relaxedTrait = relaxedTrait;

    _logs = logs;
    // _education = education;
    // _stats = stats;
  }

  factory Vida.fromMap(Map<String, dynamic> map) {
    return Vida.loadGame(
      id: map['id'],
      name: map['name'],
      gender: Genders.values[map['gender']],
      avatar: map['avatar'],
      energy: map['energy'] / 100,
      age: map['age'],
      money: map['money'],
      ambitiousTrait: map['ambitiousTrait'],
      passiveTrait: map['passiveTrait'],
      extrovertedTrait: map['extrovertedTrait'],
      introvertedTrait: map['introvertedTrait'],
      activeTrait: map['activeTrait'],
      relaxedTrait: map['relaxedTrait'],
      logs: List.from(map['logs'])
          .map((logJson) => Log.fromMap(logJson))
          .toList(),
    );
  }

  /// Translates the current state of the class into a Map format
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': _name,
      'gender': _gender.toString().split('.').last,
      'avatar': _avatar,
      'energy': _energy,
      'age': _age,
      'money': _money,
      'ambitiousTrait': _ambitiousTrait,
      'passiveTrait': _passiveTrait,
      'extrovertedTrait': _extrovertedTrait,
      'introvertedTrait': _introvertedTrait,
      'activeTrait': _activeTrait,
      'relaxedTrait': _relaxedTrait,
      'logs': _logs.map((log) => log.toJson()).toList(),
    };
  }

  factory Vida.fromJson(String json) {
    final Map<String, dynamic> map = jsonDecode(json);
    return Vida.fromMap(map);
  }

  String toJson() {
    return jsonEncode(toMap());
  }

}
