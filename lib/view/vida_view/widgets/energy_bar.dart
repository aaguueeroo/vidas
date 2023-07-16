import 'dart:math';

import 'package:flutter/material.dart';

class EnergyBar extends StatelessWidget {
  final double energyLevel;
  final bool vertical;
  final double borderRadius;

  const EnergyBar({
    Key? key,
    required this.energyLevel,
    required this.vertical,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color fillingColor = Theme.of(context).colorScheme.primaryContainer;
    // Color borderColor = Theme.of(context).colorScheme.primaryContainer;
    Color backgroundColor1 =
        Theme.of(context).colorScheme.primary;
    Color backgroundColor2 =
        Theme.of(context).colorScheme.surface.withOpacity(0.6);

    return Stack(
      children: [
        //Background
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(
              transform: vertical
                  ? GradientRotation(3 * pi / 1.7)
                  : GradientRotation(0.7),
              colors: [
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
                backgroundColor1,
                backgroundColor2,
              ],
              begin: vertical ? Alignment.topCenter : Alignment.centerLeft,
              end: vertical ? Alignment.bottomCenter : Alignment.centerRight,
            ),
          ),
        ),

        //Filling
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                fillingColor,
                Colors.transparent,
              ],
              begin: vertical ? Alignment.bottomCenter : Alignment.centerLeft,
              end: vertical ? Alignment.topCenter : Alignment.centerRight,
              stops: [energyLevel, energyLevel],
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),

        //Border
        // showBorder
        //     ? Container(
        //         decoration: BoxDecoration(
        //           border: Border.all(
        //             color: borderColor,
        //             width: 2,
        //           ),
        //           borderRadius: BorderRadius.circular(borderRadius),
        //         ),
        //       )
        //     : Container(),
      ],
    );
  }
}
