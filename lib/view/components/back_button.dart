import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData backIcon = Icons.arrow_back;

    return Container(
      alignment: Alignment.centerLeft,
      width: 40,
      height: 40,
      child: InkWell(
        highlightColor: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
        onTap: () => {
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
