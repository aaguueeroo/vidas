import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/view/init_view/init_controller.dart';
import 'package:unavida/view/init_view/init_view.dart';
import 'package:unavida/view/vida_view/vida_controller.dart';

import 'app_themes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => VidaController()),
      ChangeNotifierProvider(create: (_) => InitController()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Unavida',
      theme: AppThemes().aestheticTheme,
      home: InitView(),
    );
  }
}
