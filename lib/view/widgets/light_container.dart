import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LightContainer extends StatelessWidget {
  Key? key;
  AlignmentGeometry? alignment;
  EdgeInsetsGeometry? padding;
  double? width;
  double? height;
  double? borderRadius;
  BoxConstraints? constraints;
  EdgeInsetsGeometry? margin;
  Matrix4? transform;
  AlignmentGeometry? transformAlignment;
  Widget? child;
  Clip clipBehavior = Clip.none;

  LightContainer({
    this.key,
    this.alignment,
    this.padding,
    this.width,
    this.height,
    this.borderRadius,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surfaceVariant,
          ],
        ),
      ),
      child: child,
    );
  }
}
