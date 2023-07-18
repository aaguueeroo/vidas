import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/view/vida_view/vida_controller.dart';

import '../components/back_button.dart';
import '../components/background_container.dart';
import '../education_view/education_controller.dart';

class DebugView extends StatelessWidget {
  const DebugView({super.key});

  @override
  Widget build(BuildContext context) {
    VidaController vidaController = Provider.of<VidaController>(context);
    EducationController educationController =
        Provider.of<EducationController>(context);

    TextStyle? textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.tertiary,
        );

    return BackgroundContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const CustomBackButton(),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                vidaController.getVidaString(),
                style: textStyle,
              ),
              Text(
                educationController.getEducationString(),
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
