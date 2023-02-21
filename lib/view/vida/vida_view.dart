import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/view/vida/widgets/action_buttons.dart';
import 'package:unavida/view/vida/widgets/energy_bar.dart';
import 'package:unavida/view/vida/widgets/player_info.dart';
import 'package:unavida/view/vida/widgets/upper_information.dart';
import 'package:unavida/view/widgets/gradient_button.dart';
import 'package:unavida/view/widgets/log_container.dart';

import '../../model/vida.dart';

class VidaView extends StatelessWidget {
  const VidaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Vida vida = Vida.newGame(
      name: 'Jorge',
      lastName: 'García',
    );

    Vida v = Provider.of<Vida>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 0,
        bottom: 35,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primaryContainer,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Flexible(
              flex: 2,
              child: UpperInformation(),
            ),
            const Spacer(),
            Flexible(
              flex: 8,
              child: PlayerInfo(
                fullName: v.name + ' ' + v.lastName,
                age: v.age,
                title: 'test',
              ),
            ),

            const Spacer(),

            //Main actions
            Flexible(
              flex: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  SizedBox(
                    width: 25,
                    child: EnergyBar(energyLevel: 0.2),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 19,
                    child: ActionButtons(),
                  ),
                ],
              ),
            ),

            const Spacer(flex: 2,),

            //log
            Flexible(
              flex: 16,
              child: LogContainer(),
            ),

            const Spacer(flex: 2),

            //next year button
            GradientButton(
              text: 'Next Year',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
