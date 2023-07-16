import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/light_container.dart';
import '../vida_controller.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    VidaController controller = Provider.of<VidaController>(context);

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

    return Row(
      children: [
        Flexible(
          flex: 10,
          child: WhiteContainer(
            alignment: Alignment.center,
            child: FittedBox(
                fit: BoxFit.contain,
                child: ColorFiltered(
                  colorFilter: ColorFilter.matrix([
                    0.2126 + 0.7874 * 0.2, 0.7152 - 0.7152 * 0.2, 0.0722 - 0.0722 * 0.2, 0, 0,
                    0.2126 - 0.2126 * 0.2, 0.7152 + 0.2848 * 0.2, 0.0722 - 0.0722 * 0.2, 0, 0,
                    0.2126 - 0.2126 * 0.2, 0.7152 - 0.7152 * 0.2, 0.0722 + 0.9278 * 0.2, 0, 0,
                    0,                    0,                    0,                    1, 0,
                  ]),
                  child: Image.asset(
                    controller.avatar,
                    height: 150,
                  ),
                )),
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
