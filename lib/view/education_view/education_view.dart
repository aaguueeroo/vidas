import 'package:flutter/material.dart';
import 'package:unavida/view/components/background_container.dart';
import 'package:unavida/view/education_view/widgets/logs_and_buttons.dart';
import 'package:unavida/view/education_view/widgets/main_info.dart';

import '../../model/education/education.dart';
import '../components/back_button.dart';

class EducationView extends StatelessWidget {
  final String name;
  String currentGrade;
  int grade;
  double performance;
  List<Education> educationHistory;

  // EducationController controller;

  EducationView({
    Key? key,
    required this.name,
    required this.currentGrade,
    required this.grade,
    required this.performance,
    required this.educationHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomBackButton(),
            const SizedBox(height: 10),
            MainInfo(
              name: name,
              currentDegree: currentGrade,
              grade: grade,
              performance: performance,
              educationHistory: educationHistory,
            ),
            const SizedBox(height: 10),
            Spacer(), //List of education history
            const SizedBox(height: 10),
            const LogsAndButtons(),
          ],
        ),
      ),
    );
  }
}
