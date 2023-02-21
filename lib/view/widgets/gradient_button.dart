import 'package:flutter/material.dart';
import 'package:unavida/app_themes.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  Color? colorTop;
  Color? colorBottom;
  Color? textColor;

  GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.colorTop,
    this.colorBottom,
    this.textColor,
  }) {
    colorTop =
        colorTop ??= AppThemes().aestheticTheme.colorScheme.secondaryContainer;
    colorBottom =
        colorBottom ??= AppThemes().aestheticTheme.colorScheme.secondary;
    textColor = textColor ??= AppThemes().aestheticTheme.colorScheme.onSecondary;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextStyle? textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: textColor,
        );

    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorTop!,
            colorBottom!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
          shadowColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
