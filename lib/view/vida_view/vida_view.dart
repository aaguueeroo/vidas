import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/view/components/background_container.dart';
import 'package:unavida/view/vida_view/vida_controller.dart';
import 'package:unavida/view/vida_view/widgets/action_buttons.dart';
import 'package:unavida/view/vida_view/widgets/energy_bar.dart';
import 'package:unavida/view/vida_view/widgets/player_info.dart';
import 'package:unavida/view/vida_view/widgets/tool_bar.dart';
import 'package:unavida/view/components/gradient_button.dart';
import 'package:unavida/view/components/log_container.dart';

class VidaView extends StatelessWidget {
  const VidaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    VidaController controller = Provider.of<VidaController>(context);

    return BackgroundContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Flexible(
            flex: 2,
            child: ToolBar(),
          ),
          const Spacer(),
          Flexible(
            flex: 6,
            child: PlayerInfo(
              fullName: controller.name,
              age: controller.age,
              title:
                  controller.gender, //TODO substitute for position
            ),
          ),

          const Spacer(),

          //Main actions
          Flexible(
            flex: 25,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: width / 20,
                  child: EnergyBar(
                    energyLevel: controller.energy,
                    vertical: true,
                  ),
                ),
                const Spacer(),
                const Expanded(
                  flex: 19,
                  child: ActionButtons(),
                ),
              ],
            ),
          ),

          const Spacer(),

          //log
          const Flexible(
            flex: 13,
            child: LogContainer(),
          ),

          const Spacer(),

          //next year button
          GradientButton(
            width: width,
            height: height / 23,
            onPressed: () => controller.nextYearPressed(),
            text: 'Next year',
            textColor: Theme.of(context).colorScheme.onSecondary,
          ),
        ],
      ),
    );
  }
}
