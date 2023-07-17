import 'package:flutter/material.dart';
import 'package:unavida/view/init_view/init_view.dart';

import '../../DAL/database_provider.dart';
import '../../model/gender.dart';
import '../../model/vida.dart';
import '../education_view/education_view.dart';
import '../options_view.dart';

class VidaController with ChangeNotifier {
  static late Vida _vida;

  String get name => _vida.name;
  Genders get gender => _vida.gender;
  String get avatar {
    return "assets/images/avatars/${_vida.avatar}.png";
  }

  double get energy => _vida.energy;
  int get age => _vida.age;
  int get money => _vida.money;

  // VidaController([Vida? vida]) {
  //   if (vida != null) {
  //     _vida = vida;
  //   } else {
  //     _vida = Vida.newGame(
  //       name: '',
  //       gender: Genders.Female,
  //       avatar: 0,
  //     );
  //   }
  // }

  void updateVida(Vida vida) {
    _vida = vida;
    notifyListeners();
  }

  //BUTTON ACTIONS

  void nextYearPressed() {
    _vida.growUp();
    notifyListeners();

    print('id: ${_vida.id}');
    print('name: ${_vida.name}');
    print('age: ${_vida.age}');
    print(_vida.traits.toJson());
    for(int i=0; i<_vida.education.length; i++){
      print(' ${_vida.education[i]}');
    }

  }

  void openOptions(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OptionsView(),
      ),
    );
  }

  //options
  void quitGame(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const InitView(),
      ),
    );
  }

  void saveGame(BuildContext context) async {
    await DatabaseProvider.instance.saveGame(_vida);
    _vida.id = await DatabaseProvider.instance.getLatestId();

    print(_vida.toSlot().toMap().toString());
    print(_vida.education.toString());
  }

  void openEducation(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EducationView(
          name: name,
          grade: 40,
          currentGrade: 'B',
          performance: 0.5,
          educationHistory: [],
        ),
      ),
    );
  }

  //open Work
  //open Leisure
  //open Health
}
