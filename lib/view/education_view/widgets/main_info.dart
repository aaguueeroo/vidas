import 'package:flutter/material.dart';

import '../../../model/education/education.dart';
import '../../components/light_container.dart';
import '../../vida_view/widgets/energy_bar.dart';

/// Widget that displays the info on top the page. It will display an icon, and
/// three text lines: title, subtitle and details. It also includes a progress
/// bar showing performance.
class MainInfo extends StatelessWidget {
  final String name;
  final String? courseName;
  final double? grade;
  final List<Education> educationHistory;

  const MainInfo({
    Key? key,
    required this.name,
    required this.courseName,
    required this.grade,
    required this.educationHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TextStyle? nameTextStyle = width < 800
        ? height < 800
        ? Theme.of(context).textTheme.headlineSmall
        : Theme.of(context).textTheme.headlineMedium
        : Theme.of(context).textTheme.headlineLarge;
    TextStyle? textStyle = width < 800
        ? Theme.of(context).textTheme.headlineSmall
        : Theme.of(context)
        .textTheme
        .headlineMedium
        ?.copyWith(fontWeight: FontWeight.normal);

    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 10,
              child: WhiteContainer(
                alignment: Alignment.center,
                child: const FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(
                    Icons.school,
                    size: 150,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 28,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Player name and last name
                  Text(
                    name,
                    textAlign: TextAlign.start,
                    style: nameTextStyle,
                  ),

                  //Player age
                  Text(
                    courseName == null
                        ? 'No current studies'
                        : 'Course: $courseName',
                    textAlign: TextAlign.start,
                    style: textStyle,
                  ),

                  //Player job position or study
                  Text(
                    grade == null ? '' : 'Grade: $grade/100',
                    textAlign: TextAlign.start,
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // height: 15,
        Column(
          children: [
            const SizedBox(
              height: 15,
              child: EnergyBar(
                energyLevel: 0.4,
                vertical: false,
                borderRadius: 12,
              ),
            ),
            Text(
              'Grade',
              style: textStyle,
            ),
          ],
        ),
      ],
    );
  }
}
