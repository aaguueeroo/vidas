import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/view/components/gradient_button.dart';

import '../../education_controller.dart';

class EducationOptionsDialog extends StatelessWidget {
  const EducationOptionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TextStyle? titleTextStyle =
        Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            );
    TextStyle? textStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Theme.of(context).colorScheme.tertiary,
        );

    EducationController controller = Provider.of<EducationController>(context);

    double sliderValue = controller.effortSlider;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        width: width,
        height: height / 1.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: const BackButton(),
            ),
            Text(
              'Options',
              style: titleTextStyle,
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '  Effort:',
                style: textStyle,
              ),
            ),
            const SizedBox(height: 10),
            Slider(
              divisions: 10,
              value: sliderValue,
              onChanged: (value) {
                controller.effortSlider = value;
              },
            ),
            // const SizedBox(height: 10),
            // CheckboxListTile(
            //   title: Text(
            //     'Socialize with classmates',
            //     style: textStyle,
            //   ),
            //   value: value,
            //   onChanged: onChanged,
            // ),
            Spacer(),
            Text(
              'Energy cost: ${controller.energyCost}',
              style: textStyle,
            ),
            const SizedBox(height: 10),
            GradientButton(
              textColor: Theme.of(context).colorScheme.onTertiary,
              text: 'Save',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
