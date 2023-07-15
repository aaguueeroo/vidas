import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData backIcon = Icons.arrow_back;

    return Container(
      alignment: Alignment.centerLeft,
      width: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(40, 0),
        ),
        onPressed: () => {
          Navigator.of(context).pop(),
        },
        child: Icon(
          backIcon,
          size: 40,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
