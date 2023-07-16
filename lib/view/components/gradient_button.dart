import 'package:flutter/material.dart';
import 'package:unavida/app_themes.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  TextStyle? textStyle;
  Color? textColor;
  Color? colorTop;
  Color? colorBottom;
  double? height;
  double? width;
  late double? borderRadius;

  GradientButton({
    super.key,
    required this.text,
    this.textStyle,
    this.textColor,
    required this.onPressed,
    this.colorTop,
    this.colorBottom,
    this.height,
    this.width,
    this.borderRadius,
  }) {
    colorTop =
        colorTop ??= AppThemes().aestheticTheme.colorScheme.secondaryContainer;
    colorBottom =
        colorBottom ??= AppThemes().aestheticTheme.colorScheme.secondary;
    height = height ??= 40;
    width = width ??= null;
    borderRadius = borderRadius ??= 30;
  }

  @override
  Widget build(BuildContext context) {

    textStyle = textStyle ??= Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: textColor ??= Theme.of(context).colorScheme.tertiary,
    );

    return Container(
      padding: const EdgeInsets.all(0),
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorTop!,
            colorBottom!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
            shadowColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
          ),
          onPressed: () => onPressed(),
          child: Text(
            text,
            style: textStyle,
          )
        ),
      ),
    );
  }
}
