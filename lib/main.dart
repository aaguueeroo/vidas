import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/view/widgets/bottom_navigation_bar_view.dart';

import 'app_themes.dart';
import 'model/vida.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => Vida.newGame(
          name: 'Jorge',
          lastName: 'García',
        ),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unavida',
      theme: AppThemes().aestheticTheme,
      home: BottomNavigationBarView(),
    );
  }
}
