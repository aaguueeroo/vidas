import 'package:flutter/material.dart';
import 'package:unavida/main.dart';
import 'package:unavida/utils/app_routes.dart';

class EducationFieldsDialog extends StatelessWidget {
  const EducationFieldsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            dialogsNavigationKey.currentState
                ?.pushNamed(AppRoutes.educationActions['name']![3]);
          },
          child: Text('Show courses'),
        ),
      ),
    );
  }
}
