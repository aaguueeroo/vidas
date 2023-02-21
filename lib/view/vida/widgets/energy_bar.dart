import 'dart:math';

import 'package:flutter/material.dart';

class EnergyBar extends StatelessWidget {
  final double energyLevel;

  const EnergyBar({Key? key, required this.energyLevel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = 8;
    Color fillingColor = Theme.of(context).colorScheme.primaryContainer;
    Color borderColor = Theme.of(context).colorScheme.primaryContainer;
    Color backgroundColor1 = Theme.of(context).colorScheme.tertiary.withOpacity(0.0);
    Color backgroundColor2 = Theme.of(context).colorScheme.surface.withOpacity(0.2);

    return Stack(
      children: [
        //Background
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(
              transform: GradientRotation(3 * pi / 1.7),
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
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [energyLevel, energyLevel],
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),

        //Border
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ],
    );
  }
}
