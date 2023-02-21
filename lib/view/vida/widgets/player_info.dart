import 'package:flutter/material.dart';

import '../../widgets/light_container.dart';

class PlayerInfo extends StatelessWidget {
  final String fullName;
  final int age;
  final String title;

  const PlayerInfo({
    Key? key,
    required this.fullName,
    required this.age,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? nameTextStyle = Theme.of(context).textTheme.headlineMedium;
    TextStyle? textStyle = Theme.of(context).textTheme.headlineSmall;

    return Row(
      children: [
        Flexible(
          flex: 10,
          child: LightContainer(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Icon(
                Icons.person,
                size: 100,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
        Spacer(),
        Flexible(
          flex: 28,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Player name and last name
              Text(
                fullName,
                textAlign: TextAlign.start,
                style: nameTextStyle,
              ),

              //Player age
              Text(
                age.toString() + ' years old',
                textAlign: TextAlign.start,
                style: textStyle,
              ),

              //Player job position or study
              Text(
                title,
                textAlign: TextAlign.start,
                style: textStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
