import 'package:flutter/material.dart';

class LogContainer extends StatelessWidget {
  final Widget? child;
  const LogContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: child,
    );
  }
}
