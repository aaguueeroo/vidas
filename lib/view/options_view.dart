import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/view/vida_view/vida_controller.dart';
import 'package:unavida/view/components/gradient_button.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    VidaController controller = Provider.of<VidaController>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primaryContainer,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BackButton(),
                ],
              ),
              GradientButton(
                width: width,
                text: "save game",
                onPressed: () => controller.saveGame(context),
              ),
              GradientButton(
                width: width,
                text: "load game",
                onPressed: () => controller.quitGame(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
