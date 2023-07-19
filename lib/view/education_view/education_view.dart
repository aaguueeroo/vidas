import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/view/components/background_container.dart';
import 'package:unavida/view/education_view/education_controller.dart';
import 'package:unavida/view/education_view/widgets/education_list.dart';
import 'package:unavida/view/education_view/widgets/main_info.dart';

import '../../model/education/education.dart';
import '../components/back_button.dart';
import '../components/gradient_button.dart';
import '../components/log_container.dart';

class EducationView extends StatelessWidget {
  final String name;
  final List<Education> education;

  // EducationController controller;

  const EducationView({
    Key? key,
    required this.name,
    required this.education,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    EducationController controller = Provider.of<EducationController>(
      context,
    );

    return BackgroundContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: CustomBackButton(),
          actions: [
            IconButton(
              // height: 10,
              onPressed: () => controller.showOptionsDialog(context),
              icon: Icon(
                Icons.settings_outlined,
                size: width / 12,
              ),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              MainInfo(
                name: name,
                courseName: controller.courseName,
                grade: controller.grade,
                educationHistory: education,
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 150,
                child: LogContainer(),
              ),
              const SizedBox(height: 20),
              Expanded(child: EducationList(education: education)),
              const SizedBox(height: 30),
              GradientButton(
                width: width - 50,
                onPressed: () => controller.showActionsDialog(context),
                text: 'Actions',
                textColor: Theme.of(context).colorScheme.onSecondary,
              ),
              // const LogsAndButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
