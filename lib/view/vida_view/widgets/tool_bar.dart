import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/view/vida_view/vida_controller.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VidaController controller = Provider.of<VidaController>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Money available
        Row(
          children: [
            Icon(
              Icons.currency_bitcoin,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            const Text('3000€'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Debug button
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.bug_report,
                size: 30,
              ),
              color: Theme.of(context).colorScheme.onSecondary,
              onPressed: () => controller.showDebugView(context),
            ),

            //Store button
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.store,
                size: 30,
              ),
              color: Theme.of(context).colorScheme.onSecondary,
              onPressed: () {},
            ),

            //Vida settings button
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.save_as,
                size: 30,
              ),
              color: Theme.of(context).colorScheme.onSecondary,
              onPressed: () => controller.showOptionsView(context),
            ),
          ],
        ),
      ],
    );
  }
}
