import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/DAL/database_provider.dart';
import 'package:unavida/view/education_view/education_controller.dart';
import 'package:unavida/view/init_view/init_controller.dart';
import 'package:unavida/view/init_view/init_view.dart';
import 'package:unavida/view/vida_view/vida_controller.dart';

import 'utils/app_themes.dart';

final GlobalKey<NavigatorState> globalNavigationKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> dialogsNavigationKey =
    GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize database
  await DatabaseProvider.instance.database;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => VidaController()),
      ChangeNotifierProvider(create: (_) => InitController()),
      ChangeNotifierProvider(create: (_) => EducationController()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigationKey,
      title: 'Vidas',
      theme: AppThemes().aestheticTheme,
      home: InitView(),
    );
  }
}
