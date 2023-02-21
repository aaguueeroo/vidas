import 'package:flutter/material.dart';

class GameController with ChangeNotifier {

  ///Name of the character in the vida they are going to start.
  late String _name;
  get name => _name;

  ///Last name of the character in the vida they are going to start.
  late String _lastName;
  get lastName => _lastName;

  ///Money of the character during the vida.
  late int _money;
  get money => _money;

  ///Age of the character
  late int _age;
  get age => _age;


}
