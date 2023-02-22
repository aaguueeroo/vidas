import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/light_container.dart';
import '../init_controller.dart';

class LoadVidaDialog extends StatelessWidget {
  const LoadVidaDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = 20;

    InitController controller = Provider.of<InitController>(
      context,
    );

    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: LightContainer(
        alignment: Alignment.center,
        borderRadius: 30,
        width: width,
        height: height / 1.3,
        padding: EdgeInsets.all(padding),
        child: ListView(

        ),
      ),
    );
  }
}
