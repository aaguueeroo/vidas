import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WhiteContainer extends StatelessWidget {
  Key? key;
  AlignmentGeometry? alignment;
  double? width;
  double? height;
  double? borderRadius;
  BoxConstraints? constraints;
  EdgeInsetsGeometry? margin;
  Matrix4? transform;
  AlignmentGeometry? transformAlignment;
  Widget? child;
  Clip clipBehavior = Clip.none;

  WhiteContainer({
    this.key,
    this.alignment,
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
      padding: const EdgeInsets.all(15),
      key: key,
      alignment: alignment,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Theme.of(context).colorScheme.surface,
          ],
        ),
      ),
      child: child,
    );
  }
}
