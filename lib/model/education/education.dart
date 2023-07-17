class Education {
  /// Id of the education with current state
  int? id;

  /// Id of the education slot in the repository
  int repositoryId;
  String institutionName;
  String courseName;
  int price;
  Fields field;
  Levels level;
  int totalYears;
  int currentYear;
  int extraYears;
  double grade; // 0-100
  static const double maxGrade = 100.0;
  static const double passingGrade = 50.0;
  static const int maxExtraYears = 3;
  bool finished;
  bool abandoned;
  bool kickedOut;

  ///Unnamed constructor. Used when an education is created for the first time
  ///instead of being loaded from the database.
  Education({
    this.id,
    required this.repositoryId,
    required this.institutionName,
    required this.courseName,
    required this.price,
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

  /// Kind of constructor for when the Education is loaded from the database.
  static Education fromMap(Map<String, dynamic> map) {
    return Education(
      id: map['id'],
      repositoryId: map['education_id'],
      courseName: map['name'],
      price: map['price'],
      field: Field().fromString(map['field']),
      level: Level().fromString(map['level']),
      institutionName: map['institution'],
      totalYears: map['totalYears'],
      currentYear: map['current_year'],
      extraYears: map['extra_years'],
      grade: map['grade'],
      finished: map['finished'] == 1,
      abandoned: map['abandoned'] == 1,
      kickedOut: map['kicked_out'] == 1,
    );
  }

  Map<String, dynamic> toMap(int vidaId) {
    return id == null? {
      'education_id': repositoryId,
      'name': courseName,
      'price': price,
      'field': Field().fieldToString(field),
      'level': Level().levelToString(level),
      'institution': institutionName,
      'totalYears': totalYears,
      'current_year': currentYear,
      'extra_years': extraYears,
      'grade': grade,
      'finished': finished ? 1 : 0,
      'abandoned': abandoned ? 1 : 0,
      'kicked_out': kickedOut ? 1 : 0,
    } :{
      'id': id,
      'education_id': repositoryId,
      'name': courseName,
      'price': price,
      'field': Field().fieldToString(field),
      'level': Level().levelToString(level),
      'institution': institutionName,
      'totalYears': totalYears,
      'current_year': currentYear,
      'extra_years': extraYears,
      'grade': grade,
      'finished': finished ? 1 : 0,
      'abandoned': abandoned ? 1 : 0,
      'kicked_out': kickedOut ? 1 : 0,
    };
  }
}

enum Levels {
  school,
  university,
  master,
  phd,
  course,
}

class Level {
  String levelToString(Levels level) {
    switch (level) {
      case Levels.school:
        return 'School';
      case Levels.university:
        return 'University';
      case Levels.master:
        return 'Master';
      case Levels.phd:
        return 'PhD';
      case Levels.course:
        return 'Course';
      default:
        return 'Course';
    }
  }

  Levels fromString(String string) {
    switch (string) {
      case 'School':
        return Levels.school;
      case 'University':
        return Levels.university;
      case 'Master':
        return Levels.master;
      case 'PhD':
        return Levels.phd;
      case 'Course':
        return Levels.course;
      default:
        return Levels.course;
    }
  }
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
  languages,
  other,
}

class Field {
  String fieldToString(Fields field) {
    switch (field) {
      case Fields.science:
        return 'Science';
      case Fields.technology:
        return 'Technology';
      case Fields.engineering:
        return 'Engineering';
      case Fields.mathematics:
        return 'Mathematics';
      case Fields.arts:
        return 'Arts';
      case Fields.humanities:
        return 'Humanities';
      case Fields.socialSciences:
        return 'Social Sciences';
      case Fields.business:
        return 'Business';
      case Fields.health:
        return 'Health';
      case Fields.education:
        return 'Education';
      case Fields.law:
        return 'Law';
      case Fields.languages:
        return 'Languages';
      case Fields.other:
        return 'Other';
      default:
        return 'Other';
    }
  }

  Fields fromString(String string) {
    switch (string) {
      case 'Science':
        return Fields.science;
      case 'Technology':
        return Fields.technology;
      case 'Engineering':
        return Fields.engineering;
      case 'Mathematics':
        return Fields.mathematics;
      case 'Arts':
        return Fields.arts;
      case 'Humanities':
        return Fields.humanities;
      case 'Social Sciences':
        return Fields.socialSciences;
      case 'Business':
        return Fields.business;
      case 'Health':
        return Fields.health;
      case 'Education':
        return Fields.education;
      case 'Law':
        return Fields.law;
      case 'Languages':
        return Fields.languages;
      case 'Other':
        return Fields.other;
      default:
        return Fields.other;
    }
  }
}
