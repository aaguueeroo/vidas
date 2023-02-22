import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unavida/view/init_view/init_controller.dart';

import '../../../../model/Gender.dart';

class GenderDropdown extends StatelessWidget {
  final InitController controller;
  const GenderDropdown({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> genderItems = Genders.values.map((gender) {
      return DropdownMenuItem<String>(
        value: describeEnum(gender),
        child: Text(describeEnum(gender)),
      );
    }).toList();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: describeEnum(controller.selectedGender as Object),
        dropdownColor:
        Theme.of(context).colorScheme.primaryContainer,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        isDense: true,
        borderRadius: BorderRadius.circular(10),
        elevation: 0,
        alignment: Alignment.centerRight,
        isExpanded: true,
        items: genderItems,
        onChanged: (value) {
          controller.selectedGender = Gender.stringToGender(value!);
        },
      ),
    );
  }
}
