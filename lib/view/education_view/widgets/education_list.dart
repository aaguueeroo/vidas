import 'package:flutter/material.dart';
import 'package:unavida/model/education/education.dart';

class EducationList extends StatelessWidget {
  List<Education>? education;

  EducationList({
    Key? key,
    required this.education,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? titleStyle = Theme.of(context).textTheme.titleLarge!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Titles:",
          style: titleStyle,
        ),
        (education == null || education!.isEmpty)
            ? Center(
                child: Text('No educatioooot'),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: education!.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return EducationListItem(
                      courseName: education![index].courseName,
                      grade: education![index].grade,
                      finished: education![index].finished,
                    );
                  },
                ),
              )
        // ListView.builder(itemBuilder: Edu),
      ],
    );
  }
}

class EducationListItem extends StatelessWidget {
  final String courseName;
  final double grade;
  final bool finished;

  const EducationListItem({
    super.key,
    required this.courseName,
    required this.grade,
    required this.finished,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.tertiary;
    TextStyle? titleStyle = Theme.of(context).textTheme.headlineSmall!;
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //icon
          Icon(
            Icons.school,
            size: 50,
            color: color,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseName,
                style: titleStyle,
              ),
              Text(
                'Grade: $grade',
                style: textStyle,
              ),
              Text(
                finished ? "Finished" : "Not finished",
                style: textStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
