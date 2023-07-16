import 'package:flutter/material.dart';
import 'package:unavida/view/components/gradient_button.dart';
import 'package:unavida/view/components/log_container.dart';

/// Widget that displays the logs and buttons on the bottom of the page. It has
/// a row for the Actions and Options buttons, below a field for the logs
/// history and at the bottom a Button for the main action of the page.
class LogsAndButtons extends StatelessWidget {
  const LogsAndButtons({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GradientButton(
              colorTop: Theme.of(context).colorScheme.background,
              colorBottom: Theme.of(context).colorScheme.surface,
              height: 25,
              width: (width - 50) / 2,
              onPressed: () {},
              text: 'Actions',
            ),
            GradientButton(
              colorTop: Theme.of(context).colorScheme.background,
              colorBottom: Theme.of(context).colorScheme.surface,
              height: 25,
              width: (width - 50) / 2,
              onPressed: () {},
              text: 'Options',
            ),
          ],
        ),
        const SizedBox(height: 10),
        const SizedBox(
          height: 150,
          child: LogContainer(),
        ),
        const SizedBox(height: 10),
        GradientButton(
          width: width - 50,
          onPressed: () {},
          text: 'Go to class',
          textColor: Theme.of(context).colorScheme.onSecondary,
        ),
      ],
    );
  }
}
