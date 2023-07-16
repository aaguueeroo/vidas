import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unavida/view/init_view/init_controller.dart';
import 'package:unavida/view/components/gradient_button.dart';

class InitView extends StatelessWidget {
  const InitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = 20;

    String newVidaButtonText = "New Vida";
    String loadVidaButtonText = "Load Vida";
    String authorName = "Julia Parker";
    Icon twitterIcon = Icon(Icons.account_circle_outlined);
    Icon githubIcon = Icon(Icons.account_balance);

    InitController controller = Provider.of<InitController>(
      context,
      listen: false,
    );

    return Scaffold(
      body: Container(
        width: width,
        height: height,
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
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 8),
            GradientButton(
              height: height / 18,
              width: width,
              colorTop: Theme.of(context).colorScheme.background,
              colorBottom: Theme.of(context).colorScheme.primaryContainer,
              onPressed: () => controller.newVidaButtonOnPressed(context),
              text: newVidaButtonText,
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            GradientButton(
              height: height / 18,
              width: width,
              colorTop: Theme.of(context).colorScheme.background,
              colorBottom: Theme.of(context).colorScheme.primaryContainer,
              onPressed: () => controller.loadVidaButtonOnPressed(context),
              text: loadVidaButtonText,
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const Spacer(flex: 10),
            Column(
              children: [
                Text(
                  authorName,
                  style: GoogleFonts.exo2(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    twitterIcon,
                    const SizedBox(width: 5),
                    githubIcon,
                  ],
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
