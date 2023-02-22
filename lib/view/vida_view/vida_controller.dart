import 'package:flutter/material.dart';
import 'package:unavida/view/init_view/init_view.dart';

import '../../model/Gender.dart';
import '../../model/vida.dart';
import '../options_view.dart';

class VidaController with ChangeNotifier {
  late Vida _vida;

  VidaController([Vida? vida]) {
    if (vida != null) {
      _vida = vida;
    } else {
      _vida = Vida.newGame(
        name: '',
        gender: Genders.Female,
        avatar: 0,
        ambitiousTrait: 50,
        passiveTrait: 50,
        extrovertedTrait: 50,
        introvertedTrait: 50,
        activeTrait: 50,
        relaxedTrait: 50,
      );
    }
  }

  String get name => _vida.name;
  Genders get gender => _vida.gender;
  String get avatar {
    return "assets/images/avatars/${_vida.avatar}.png";
  }

  int get energy => _vida.energy;
  int get age => _vida.age;
  int get money => _vida.money;

  void updateVida(Vida vida) {
    _vida = vida;
    notifyListeners();
  }

  void nextYear() {
    _vida.age++;
    notifyListeners();
    print('age: ${_vida.age}');
  }

  void openOptions(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OptionsView(),
      ),
    );
  }

  void quitGame(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const InitView(),
      ),
    );
  }

  void saveGame(BuildContext context) {

  }
}
