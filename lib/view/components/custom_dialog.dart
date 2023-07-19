import 'package:flutter/material.dart';
import 'package:unavida/main.dart';
import 'package:unavida/utils/app_routes.dart';

class CustomDialog extends StatelessWidget {
  final Map<String, Widget> pages; //Map <route name, page>

  const CustomDialog({required this.pages});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: height / 1.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Scaffold(
            extendBody: false,
            // backgroundColor: Colors.transparent,
            drawerEnableOpenDragGesture: false,
            resizeToAvoidBottomInset: true,
            body: Navigator(
              key: dialogsNavigationKey,
              initialRoute: '/',
              onGenerateRoute: (settings) {
                String? targetName;

                for (int i = 0;
                    i < AppRoutes.educationActions['name']!.length;
                    i++) {
                  if (settings.name == AppRoutes.educationActions['name']![i]) {
                    targetName = AppRoutes.educationActions['name']![i];
                    break;
                  }
                }

                if (targetName == null) {
                  return PageRouteBuilder(
                    pageBuilder: (_, __, ___) => Container(
                      child: Center(
                        child: Text(
                          'Error loading navigation inside dialog.',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    transitionDuration: const Duration(seconds: 0),
                  );
                } else {
                  return PageRouteBuilder(
                    pageBuilder: (_, __, ___) => pages[settings.name]!,
                    transitionDuration: const Duration(seconds: 0),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
