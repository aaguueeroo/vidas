import 'package:flutter/material.dart';
import 'package:unavida/view/init_view/init_controller.dart';

class ChooseAvatar extends StatelessWidget {
  final InitController controller;
  final TextStyle? textStyle;
  const ChooseAvatar({Key? key, required this.controller, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Avatar",
          style: textStyle?.copyWith(fontSize: 20),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => controller.decreaseSelectedAvatar(),
              icon: Icon(Icons.arrow_back_ios),
            ),
            Expanded(
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix([
                  0.2126 + 0.7874 * 0.2, 0.7152 - 0.7152 * 0.2, 0.0722 - 0.0722 * 0.2, 0, 0,
                  0.2126 - 0.2126 * 0.2, 0.7152 + 0.2848 * 0.2, 0.0722 - 0.0722 * 0.2, 0, 0,
                  0.2126 - 0.2126 * 0.2, 0.7152 - 0.7152 * 0.2, 0.0722 + 0.9278 * 0.2, 0, 0,
                  0,                    0,                    0,                    1, 0,
                ]),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SizedBox(
                    height: 90,
                    width: 100,
                    child: Image.asset(
                      "assets/images/avatars/${controller.selectedAvatar}.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () => controller.increaseSelectedAvatar(),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ],
    );
  }
}
