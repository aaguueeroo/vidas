import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unavida/view/init_view/new_vida/widgets/choose_avatar.dart';
import 'package:unavida/view/init_view/new_vida/widgets/gender_dropdown.dart';
import 'package:unavida/view/init_view/new_vida/widgets/sliders.dart';
import 'package:unavida/view/components/gradient_button.dart';
import 'package:unavida/view/components/light_container.dart';

import '../init_controller.dart';

class NewVidaDialog extends StatelessWidget {
  const NewVidaDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = 20;

    String randomButtonText = "Random";
    String nameLabelText = "Name";
    String genderLabelText = "Gender";
    String startVidaButtonText = "Start Vida";

    TextStyle? buttonTextStyle = Theme.of(context).textTheme.bodyMedium;
    TextStyle? labelStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        );

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Upper row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                GradientButton(
                  child: Text(
                    randomButtonText,
                    style: buttonTextStyle,
                  ),
                  onPressed: () => controller.randomButtonOnPressed(),
                ),
              ],
            ),

            //Name and Sex row
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameLabelText,
                        style: labelStyle,
                      ),
                      Form(
                        key: controller.formKey,
                        child: TextFormField(
                          controller: controller.nameController,
                          validator: (value) => controller.validateName(value),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        genderLabelText,
                        style: labelStyle,
                      ),
                      GenderDropdown(controller: controller),
                    ],
                  ),
                ),
              ],
            ),

            const Spacer(),

            //Sliders
            Expanded(
              flex: 15,
              child: Sliders(controller: controller, textStyle: labelStyle),
            ),

            const Spacer(flex: 10),

            //Choose avatar
            Expanded(
              flex: 15,
              child: ChooseAvatar(
                controller: controller,
                textStyle: labelStyle,
              ),
            ),

            const Spacer(),

            //Start Vida button
            GradientButton(
              width: 500,
              child: Text(
                startVidaButtonText,
                style: buttonTextStyle,
              ),
              onPressed: () => controller.startVidaButtonOnPressed(context),
            ),
          ],
        ),
      ),
    );
  }
}
