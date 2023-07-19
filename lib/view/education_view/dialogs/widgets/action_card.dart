import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/main.dart';
import 'package:unavida/view/education_view/education_controller.dart';

class ActionCard extends StatelessWidget {
  final String text;
  final int energyCost;
  final String? routeKey;

  const ActionCard(
      {super.key, required this.text, required this.energyCost, this.routeKey});

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.tertiary,
        );
    TextStyle? energyCostTextStyle =
        Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            );

    EducationController controller = Provider.of<EducationController>(
      context,
    );

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () => {
        if (routeKey != null)
          dialogsNavigationKey.currentState?.pushReplacementNamed(routeKey!)
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: textStyle,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bolt, color: Theme.of(context).colorScheme.tertiary),
                Text(energyCost.toString(), style: energyCostTextStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
