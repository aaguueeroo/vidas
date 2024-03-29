import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/DAL/database_provider.dart';
import 'package:unavida/main.dart';
import 'package:unavida/model/vida_saving_slot.dart';
import 'package:unavida/view/init_view/new_vida/widgets/choose_avatar.dart';
import 'package:unavida/view/init_view/new_vida/widgets/gender_dropdown.dart';

import '../../model/education/education.dart';
import '../../model/gender.dart';
import '../../model/traits.dart';
import '../../model/vida.dart';
import '../base_views/bottom_navigation_bar_view.dart';
import '../education_view/education_controller.dart';
import '../vida_view/vida_controller.dart';
import 'load_vida/load_vida_dialog.dart';
import 'new_vida/new_vida_dialog.dart';

class InitController with ChangeNotifier {
  /// The form key for the form in the [NewVidaDialog] to validate the form.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// The text editing controller for the name text field in the [NewVidaDialog].
  TextEditingController nameController = TextEditingController();

  /// Gender selected in the [GenderDropdown] in [NewVidaDialog]
  Genders? _selectedGender = Genders.Male;
  Genders? get selectedGender => _selectedGender;
  set selectedGender(Genders? gender) {
    _selectedGender = gender; // set the gender variable
    notifyListeners(); // notify listeners of the change
  }

  /// The avatar index selected in the [ChooseAvatar] in [NewVidaDialog]
  int _selectedAvatar = 0;
  int get selectedAvatar => _selectedAvatar;

  /// First slider value in [NewVidaDialog] that determines the Vida's
  /// ambitious/passive personality trait.
  double _ambitiousPassiveSlider = 0.5;
  double get ambitiousPassive => _ambitiousPassiveSlider;
  set ambitiousPassive(double value) {
    _ambitiousPassiveSlider = value;
    notifyListeners();
  }

  /// Second slider value in [NewVidaDialog] that determines the Vida's
  /// extroverted/introverted personality trait.
  double _extrovertedIntrovertedSlider = 0.5;
  double get extrovertedIntroverted => _extrovertedIntrovertedSlider;
  set extrovertedIntroverted(double value) {
    _extrovertedIntrovertedSlider = value;
    notifyListeners();
  }

  /// Third slider value in [NewVidaDialog] that determines the Vida's
  /// active/relaxed personality trait.
  double _activeRelaxedSlider = 0.5;
  double get activeRelaxed => _activeRelaxedSlider;
  set activeRelaxed(double value) {
    _activeRelaxedSlider = value;
    notifyListeners();
  }

  /// Validates the name field in the [NewVidaDialog]. Returns an error string
  /// if the name is empty.
  String? validateName(String? value) {
    if (value == null || value == '') {
      return 'Please enter a name';
    }
    return null;
  }

  /// Decreases the index of the avatar selected from the [ChooseAvatar] in
  /// [NewVidaDialog]. It is called when the left arrow button is pressed.
  /// If the index is less than 0, it is set to 19.
  void decreaseSelectedAvatar() {
    _selectedAvatar--;
    if (_selectedAvatar < 0) {
      _selectedAvatar = 19;
    }
    notifyListeners();
  }

  /// Increases the index of the avatar selected from the [ChooseAvatar] in
  /// [NewVidaDialog]. It is called when the right arrow button is pressed.
  /// If the index is greater than 19, it is set to 0.
  void increaseSelectedAvatar() {
    _selectedAvatar++;
    if (_selectedAvatar > 19) {
      _selectedAvatar = 0;
    }
    notifyListeners();
  }

  double getAmbitiousTrait() => _ambitiousPassiveSlider;
  double getPassiveTrait() => 1 - _ambitiousPassiveSlider;
  double getExtrovertedTrait() => _extrovertedIntrovertedSlider;
  double getIntrovertedTrait() => 1 - _extrovertedIntrovertedSlider;
  double getActiveTrait() => _activeRelaxedSlider;
  double getRelaxedTrait() => 1 - _activeRelaxedSlider;

  ///If all the fields in the [NewVidaDialog] are valid, a new Vida is created
  /// and the [BottomNavigationBarView] is shown, created with the new vida as
  /// parameter.
  void startVida(BuildContext context) async {
    // VidaDao vidaDao = VidaDao.instance;
    // await vidaDao.initialize();
    //
    // await vidaDao.createStateTables();

    if (formKey.currentState!.validate()) {

      Vida vida = Vida.newGame(
        name: nameController.text,
        gender: _selectedGender!,
        avatar: _selectedAvatar,
        traits: Traits(
          ambitious: getAmbitiousTrait(),
          passive: getPassiveTrait(),
          extroverted: getExtrovertedTrait(),
          introverted: getIntrovertedTrait(),
          active: getActiveTrait(),
          relaxed: getRelaxedTrait(),
        ),
      );

      final vidaController =
          Provider.of<VidaController>(context, listen: false);
      vidaController.updateVida(vida);
      final educationController =
          Provider.of<EducationController>(context, listen: false);
      final List<Education> educations = [];
      vida.educationList = educations;
      educationController.updateEducation(educations);

      globalNavigationKey.currentState!.pop();
      globalNavigationKey.currentState!.pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomNavigationBarView(),
        ),
      );

      restartNewVidaDialog();
    } else {
      print("Form is invalid");
    }
  }

  void showNewVidaOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => NewVidaDialog(),
    );
  }

  /// Opens dialog that shows all the saved Vidas.
  void showLoadedGames(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) => const LoadVidaDialog(),
    );
  }

  Future<void> loadGame(VidaSavingSlot slot, BuildContext context) async {
    Vida vida = await DatabaseProvider.instance.loadGame(slot);

    final vidaController = Provider.of<VidaController>(context, listen: false);
    vidaController.updateVida(vida);
    final educationController =
        Provider.of<EducationController>(context, listen: false);
    educationController.updateEducation(vida.educationList);

    globalNavigationKey.currentState!.pop();
    globalNavigationKey.currentState!.pushReplacement(
      MaterialPageRoute(
        builder: (context) => const BottomNavigationBarView(),
      ),
    );
  }

  Future<List<VidaSavingSlot>?> getVidaSlots() async {
    return await DatabaseProvider.instance.getSlots();
  }

  Future<void> deleteGame(VidaSavingSlot slot, BuildContext context) async {
    await DatabaseProvider.instance.deleteGame(slot);
    notifyListeners();
  }

  void randomButtonOnPressed() async {
    //TODO get random data
    // DatabaseDao databaseDao = DatabaseDao.instance;
    // await databaseDao.readDb();
    // VidaDao vidaDao = VidaDao.instance;
    // await vidaDao.initialize();
    // await vidaDao.createStateTables();
    // await vidaDao.getAllVidaIds();
  }

  void backButtonPressed(BuildContext context) {
    restartNewVidaDialog();
    Navigator.pop(context);
  }

  void restartNewVidaDialog() {
    nameController.clear();
    _selectedAvatar = 0;
    _selectedGender = Genders.Male;
    _ambitiousPassiveSlider = 0.5;
    _extrovertedIntrovertedSlider = 0.5;
    _activeRelaxedSlider = 0.5;
  }

}
