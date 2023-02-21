import 'package:flutter/material.dart';
import 'package:unavida/view/widgets/light_container.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double childSpacing = 17;
    Color foregroundColor = Theme.of(context).colorScheme.onSurface;
    TextStyle? textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: foregroundColor,
        );

    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      child: GridView.count(
        crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: childSpacing,
        crossAxisSpacing: childSpacing,
        children: [
          ActionButtonSingle(
            text: "Learn",
            icon: Icons.menu_book_rounded,
            textStyle: textStyle,
            foregroundColor: foregroundColor,
          ),
          ActionButtonSingle(
            text: "Work",
            icon: Icons.work,
            textStyle: textStyle,
            foregroundColor: foregroundColor,
          ),
          ActionButtonSingle(
            text: "Leisure",
            icon: Icons.chair_rounded,
            textStyle: textStyle,
            foregroundColor: foregroundColor,
          ),
          ActionButtonSingle(
            text: "Health",
            icon: Icons.healing,
            textStyle: textStyle,
            foregroundColor: foregroundColor,
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
          Flexible(
            flex: 7,
            child: FittedBox(
              child: IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: Icon(icon),
                onPressed: () {},
                color: foregroundColor,
                highlightColor: Colors.red,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(
              text,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
