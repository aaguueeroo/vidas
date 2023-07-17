import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/model/vida_saving_slot.dart';

import '../../components/light_container.dart';
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
      content: WhiteContainer(
        alignment: Alignment.center,
        borderRadius: 30,
        width: width - padding * 2,
        height: height / 1.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            Expanded(
              child: FutureBuilder<List?>(
                future: controller.getVidaSlots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 0,
                          ),
                          child: VidaSlotWidget(
                            vida: snapshot.data![index],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No saved games'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VidaSlotWidget extends StatelessWidget {
  final VidaSavingSlot vida;

  const VidaSlotWidget({super.key, required this.vida});

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.tertiary,
        );
    TextStyle? smallTextStyle = Theme.of(context).textTheme.bodySmall;

    InitController controller = Provider.of<InitController>(
      context,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(2),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        onPressed: () => controller.loadGame(vida, context),
        onLongPress: () => controller.deleteGame(vida, context),
        child: Container(
          height: 100,
          padding: const EdgeInsets.only(
            left: 10,
            right: 0,
            top: 10,
            bottom: 10,
          ),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   // color: Theme.of(context).colorScheme.primaryContainer,
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(vida.name, style: textStyle),
                  Text('${vida.age} years old', style: textStyle),
                  const Spacer(),
                  Text("23/07/2023", style: smallTextStyle),
                ],
              ),
              Image.asset(
                "assets/images/avatars/${vida.avatarId}.png",
                // height: 100,
                // width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
