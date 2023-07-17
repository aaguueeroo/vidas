import 'dart:convert';

import 'package:unavida/model/traits.dart';
import 'package:unavida/model/vida_saving_slot.dart';
import 'package:unavida/model/education/education.dart';
import 'package:unavida/model/gender.dart';

/// Class that contains all the information of the game.
class Vida {
  static final Vida _instance = Vida._();

  Vida._();

  factory Vida() {
    return _instance;
  }

  ///Id of the state of the game. It will be null before it is inserte in the
  ///database for the first time.
  int? id;

  late int _avatar;
  get avatar => _avatar;

  late String _name;
  get name => _name;

  late int _age;
  int get age => _age;

  late Genders _gender;
  get gender => _gender;

  late int _money;
  get money => _money;

  /// Energy of the player. It decreases every time the player does an action,
  /// and it resets every new year.
  late double _energy;
  double get energy => _energy / 100;

  /// Traits of the players.
  late Traits _traits;
  get traits => _traits;

  /// Education of the player that includes all the education acquired until now
  late List<Education> _education;
  get education => _education;

  /// Stats of the player for the current Vida.
  // late Stats _stats;

  /// List of logs that contains all the performed actions, random events and
  /// other information that will be displayed in the log view.
  // late List<Log> _logs;

  ///Constructor for when a game is started for the first time.
  ///
  ///The parameters are selected by the user in the UI.
  ///
  ///The parameter id is not required since it will be null until the game is
  ///inserted in the database for the first time.
  factory Vida.newGame({
    required String name,
    required Genders gender,
    required int avatar,
    required Traits traits,
  }) {
    // final traits = Traits(); // Create traits object
    return _instance._initialize(
      name: name,
      gender: gender,
      avatar: avatar,
      traits: traits,
    );
  }

  factory Vida.loadGame({
    required VidaSavingSlot slot,
    required List<Education> education,
  }) {
    // Get game_data
    Map<String, dynamic> gameData =
        jsonDecode(slot.game_data) as Map<String, dynamic>;

    // Map<String, dynamic> traitsMap = gameData['traits'] as Map<String, dynamic>;
    // List<Education> loadedEducation = await DatabaseProvider().getAllEducation(slot.vidaId);
    // must retrieve with query from another table

    _instance._initialize(
      id: slot.id,
      name: slot.name,
      avatar: slot.avatarId,
      age: slot.age,
      gender: Gender.fromString(gameData['gender'] as String),
      money: gameData['money'] as int,
      energy: gameData['energy'] as double,
      traits: Traits.fromJson(
        gameData['traits'],
      ),
      education: education,
    );

    return _instance;
  }

  Vida _initialize({
    int? id,
    required String name,
    required Genders gender,
    required int avatar,
    required Traits traits,
    double energy = 100,
    int age = 0,
    int money = 0,
    List<Education> education = const [],
  }) {
    this.id = id;
    _name = name;
    _gender = gender;
    _avatar = avatar;
    _energy = energy;
    _age = age;
    _money = money;
    _traits = traits;
    _education = education;

    // _initializeEducation(id);

    // Assign other properties
    return this;
  }

  void growUp() {
    _age++;
    _energy = 100;

    // for (int i = 0; i < _education.length; i++) {
    //   _education[i].advanceYear();
    // }
  }

  VidaSavingSlot toSlot() {
    return VidaSavingSlot(
      id: id,
      name: name,
      avatarId: avatar,
      age: age,
      last_access: DateTime.now(),
      game_data: gameDataToJson(),
    );
  }

  String gameDataToJson() {
    return jsonEncode({
      'energy': energy,
      'money': money,
      'gender': Gender.genderToString(gender),
      'traits': traits.toJson()
    });
  }
}
