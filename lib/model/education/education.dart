enum Levels {
  elementary,
  highSchool,
  university,
  master,
  doctorate,
  postDoc,
}

enum Fields {
  science,
  technology,
  engineering,
  mathematics,
  arts,
  humanities,
  socialSciences,
  business,
  health,
  education,
  law,
  other,
}

class Education {
  String institutionName;
  String courseName;
  String? description;
  int cost;
  Fields field;
  Levels level;
  int totalYears;
  int currentYear;
  int extraYears;
  int grade; // 0-100
  static const int maxGrade = 100;
  static const int passingGrade = 50;
  static const int maxExtraYears = 3;
  bool finished;
  bool abandoned;
  bool kickedOut;

  Education({
    required this.institutionName,
    required this.courseName,
    this.description,
    required this.cost,
    required this.field,
    required this.level,
    required this.totalYears,
    this.currentYear = 0,
    this.extraYears = 0,
    this.grade = passingGrade,
    this.finished = false,
    this.abandoned = false,
    this.kickedOut = false,
  });

  void advanceYear() {
    if (!finished && !abandoned && !kickedOut) {
      currentYear++;

      if (extraYears > maxExtraYears) {
        kickOut();
      } else if (currentYear > totalYears && grade >= passingGrade) {
        finished = true;
      } else if (currentYear > totalYears && grade < passingGrade) {
        extraYears++;
      }
    }
  }

  void updateGrade(int amount) {
    grade += amount;
    if (grade > maxGrade) {
      grade = maxGrade;
    } else if (grade < 0) {
      grade = 0;
    }
  }

  void graduate() {
    finished = true;
  }

  void dropOut() {
    abandoned = true;
  }

  void kickOut() {
    kickedOut = true;
  }
}
