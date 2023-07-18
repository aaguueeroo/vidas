import 'package:flutter/material.dart';
import 'package:unavida/view/init_view/init_view.dart';

import '../../DAL/database_provider.dart';
import '../../model/vida.dart';
import '../debug_view/debug_view.dart';
import '../education_view/education_view.dart';
import '../options_view.dart';

class VidaController with ChangeNotifier {
  static late Vida _vida;

  String get name => _vida.name;
  String get gender => _vida.gender.toString();
  String get avatar {
    return "assets/images/avatars/${_vida.avatar}.png";
  }

  double get energy => _vida.energy;
  String get age => _vida.age.toString();
  String get money => _vida.money.toString();

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

    print('Vida id: ${_vida.id}');
    print('Name: ${_vida.name}');
    print('Age: ${_vida.age}');

  }

  void showOptionsView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OptionsView(),
      ),
    );
  }


  void showDebugView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DebugView(),
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
    _vida.id ??= await DatabaseProvider.instance.getLatestId();

    print('Vida saved: ${_vida.toSlot().id}');
  }

  void openEducation(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EducationView(
          name: _vida.name,
          education: _vida.educationList,
        ),
      ),
    );
  }

  String getVidaString(){
    return _vida.toString();
  }

  //open Work
  //open Leisure
  //open Health
}
