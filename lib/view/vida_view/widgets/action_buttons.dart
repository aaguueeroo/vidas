import 'package:flutter/material.dart';
import 'package:unavida/view/components/light_container.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    int horizontalFlex = 10;
    int verticalFlex = 9;
    Color foregroundColor = Theme.of(context).colorScheme.onSurface;
    TextStyle? textStyle = width < 800
        ? Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: foregroundColor,
            )
        : Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: foregroundColor,
              fontSize: 40,
            );

    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: verticalFlex,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: horizontalFlex,
                  child: ActionButtonSingle(
                    text: "Learn",
                    icon: Icons.menu_book_rounded,
                    textStyle: textStyle,
                    foregroundColor: foregroundColor,
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: horizontalFlex,
                  child: ActionButtonSingle(
                    text: "Work",
                    icon: Icons.work,
                    textStyle: textStyle,
                    foregroundColor: foregroundColor,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: verticalFlex,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: horizontalFlex,
                  child: ActionButtonSingle(
                    text: "Leisure",
                    icon: Icons.chair_rounded,
                    textStyle: textStyle,
                    foregroundColor: foregroundColor,
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: horizontalFlex,
                  child: ActionButtonSingle(
                    text: "Health",
                    icon: Icons.healing,
                    textStyle: textStyle,
                    foregroundColor: foregroundColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButtonSingle extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextStyle? textStyle;
  final Color foregroundColor;

  const ActionButtonSingle({
    Key? key,
    required this.text,
    required this.icon,
    required this.textStyle,
    required this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LightContainer(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(icon),
                onPressed: () {},
                color: foregroundColor,
              ),
            ),
          ),
          Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
