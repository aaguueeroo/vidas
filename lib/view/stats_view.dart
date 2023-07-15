import 'package:flutter/material.dart';

class StatsView extends StatelessWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Stats',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
