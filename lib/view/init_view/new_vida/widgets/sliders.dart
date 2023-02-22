import 'package:flutter/material.dart';

import '../../init_controller.dart';

class Sliders extends StatelessWidget {
  final TextStyle? textStyle;
  final InitController controller;
  const Sliders({Key? key, required this.textStyle, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double value1 = controller.ambitiousPassive;
    double value2 = controller.extrovertedIntroverted;
    double value3 = controller.activeRelaxed;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Ambitious/passive
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Passive",
                  style: textStyle,
                ),
                Text(
                  "Ambitious",
                  style: textStyle,
                ),
              ],
            ),
            Slider(
              value: value1,
              onChanged: (sliderValue) {
                controller.ambitiousPassive = sliderValue;
              },
            ),
          ],
        ),

        //Extroverted/introverted
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Introverted",
                  style: textStyle,
                ),
                Text(
                  "Extroverted",
                  style: textStyle,
                ),
              ],
            ),
            Container(
              width: 50,
              padding: EdgeInsets.zero,
              child: Slider(
                value: value2,
                onChanged: (sliderValue) {
                  controller.extrovertedIntroverted = sliderValue;
                },
              ),
            ),
          ],
        ),

        //Active/relaxed
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Relaxed",
                  style: textStyle,
                ),
                Text(
                  "Active",
                  style: textStyle,
                ),
              ],
            ),
            Slider(
              value: value3,
              onChanged: (sliderValue) {
                controller.activeRelaxed = sliderValue;
              },
            ),
          ],
        ),
      ],
    );
  }
}
