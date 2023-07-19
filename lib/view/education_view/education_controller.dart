import 'package:flutter/material.dart';
import 'package:unavida/model/education/education.dart';
import 'package:unavida/model/vida.dart';
import 'package:unavida/utils/app_routes.dart';
import 'package:unavida/view/components/custom_dialog.dart';

import 'dialogs/actions/education_actions_view.dart';
import 'dialogs/actions/education_courses_view.dart';
import 'dialogs/actions/education_fields_dialog.dart';
import 'dialogs/actions/education_levels_view.dart';
import 'dialogs/options/education_options_dialog.dart';

class EducationController with ChangeNotifier {
  static late List<Education> _education;

  //Information displayed on the top of the screen: Person name, course name,
  //and grade
  String name = Vida().name;

  double _effortSlider = 0.5;

  double get effortSlider => _effortSlider;

  set effortSlider(double value) {
    _effortSlider = value;
    notifyListeners();
  }

  int _energyCost = 30;

  int get energyCost {
    return (_energyCost * 50).toInt();
    //Perform changed depending on actions selected
  }

  set energyCost(int value) {
    _energyCost = value;
    notifyListeners();
  }

  String? get courseName {
    Education? currentEducation = getCurrentEducation();
    if (currentEducation == null) {
      return null;
    } else {
      return currentEducation.courseName;
    }
  }

  double? get grade {
    Education? currentEducation = getCurrentEducation();
    if (currentEducation == null) {
      return null;
    } else {
      return currentEducation.grade;
    }
  }

  Education? getCurrentEducation() {
    if (_education == null) {
      return null;
    }

    for (Education education in _education) {
      if (!education.finished && !education.abandoned && !education.kickedOut) {
        return education;
      }
    }

    return null;
  }

  void updateEducation(List<Education> education) {
    _education = education;
    notifyListeners();
  }

  //BUTTONS PRESSED
  void showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => EducationOptionsDialog(),
    );
  }

  void showActionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => CustomDialog(
        pages: {
          AppRoutes.educationActions['name']![0]: EducationActionsView(),
          // Initial route
          AppRoutes.educationActions['name']![1]: EducationLevelsView(),
          // Enroll
          AppRoutes.educationActions['name']![2]: EducationFieldsDialog(),
          AppRoutes.educationActions['name']![3]: EducationCourseListDialog(),
          // Enroll
        },
      ),
    );
  }

  void performAction() {}

  String getEducationString() {
    String educationString = '--- EDUCATION ---\n';
    for (int i = 0; i < _education.length; i++) {
      educationString += _education[i].toString();
    }
    return educationString;
  }
}
