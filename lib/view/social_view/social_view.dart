import 'package:flutter/material.dart';
import 'package:unavida/view/social_view/widgets/relationship_type_button.dart';

class SocialView extends StatelessWidget {
  const SocialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: [
            Row(
              children: [
                // RelationshipTypeButton(),

              ],
            ),
            PageView(),
          ],
        ),
      ),
    );
  }
}
