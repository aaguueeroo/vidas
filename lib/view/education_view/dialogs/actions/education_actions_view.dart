import 'package:flutter/material.dart';
import 'package:unavida/main.dart';
import 'package:unavida/view/education_view/dialogs/widgets/action_card.dart';

class EducationActionsView extends StatelessWidget {
  const EducationActionsView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    IconData backIcon = Icons.arrow_back;

    TextStyle? titleTextStyle =
        Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            );

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      width: width,
      // height: height / 1.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              alignment: Alignment.centerLeft,
              width: 40,
              height: 40,
              child: InkWell(
                highlightColor: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
                onTap: () => {
                  globalNavigationKey.currentState?.pop(),
                },
                child: Icon(
                  backIcon,
                  size: 40,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),
          Text(
            'Actions',
            style: titleTextStyle,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                ActionCard(
                  text: 'Enroll in new course',
                  energyCost: 18,
                  routeKey: 'levels',
                ),
                SizedBox(height: 15),
                ActionCard(
                  text: 'Drop out',
                  energyCost: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
