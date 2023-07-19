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
  double grade; // 0-100
  static const double maxGrade = 100.0;
  static const double passingGrade = 50.0;
  static const int maxYears = 3;
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
    this.grade = passingGrade,
    this.finished = false,
    this.abandoned = false,
    this.kickedOut = false,
  });

  void advanceYear() {
    if (!finished && !abandoned && !kickedOut) {
      currentYear++;

      if (currentYear > maxYears) {
        kickOut();
      } else if (currentYear > totalYears && grade >= passingGrade) {
        finished = true;
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
      field: Field.fromString(map['field']),
      level: Level.fromString(map['level']),
      institutionName: map['institution'],
      totalYears: map['totalYears'],
      currentYear: map['current_year'],
      grade: (map['grade'] as int) * 1.0,
      finished: map['finished'] == 1,
      abandoned: map['abandoned'] == 1,
      kickedOut: map['kicked_out'] == 1,
    );
  }

  Map<String, dynamic> toMap(int vidaId) {
    return id == null
        ? {
            'vida_id': vidaId,
            'education_id': repositoryId,
            'current_year': currentYear,
            'grade': grade,
            'finished': finished ? 1 : 0,
            'abandoned': abandoned ? 1 : 0,
            'kicked_out': kickedOut ? 1 : 0,
          }
        : {
            'id': id,
            'vida_id': vidaId,
            'education_id': repositoryId,
            'current_year': currentYear,
            'grade': grade,
            'finished': finished ? 1 : 0,
            'abandoned': abandoned ? 1 : 0,
            'kicked_out': kickedOut ? 1 : 0,
          };
  }

  @override
  String toString() {
    return '\nCourse: \n'
        '   Id: $id, \n'
        '   RepositoryId: $repositoryId, \n'
        '   InstitutionName: $institutionName, \n'
        '   courseName: $courseName, \n'
        '   price: $price, \n'
        '   field: $field, \n'
        '   level: $level, \n'
        '   totalYears: $totalYears, \n'
        '   currentYear: $currentYear, \n'
        '   grade: $grade\n'
        '   finished: $finished\n'
        '   abandoned: $abandoned\n'
        '   kickedOut: $kickedOut\n';
  }
}

enum Levels {
  school,
  university,
  master,
  phd,
  course,
  language,
}

class Level {
  static String levelToString(Levels level) {
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
      case Levels.language:
        return 'Language';
      default:
        return 'Course';
    }
  }

  static Levels fromString(String string) {
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
      case 'Language':
        return Levels.language;
      default:
        return Levels.course;
    }
  }

  static int levelToInt(Levels level) {
    switch (level) {
      case Levels.language:
        return 0;
      case Levels.course:
        return 1;
      case Levels.school:
        return 2;
      case Levels.university:
        return 3;
      case Levels.master:
        return 4;
      case Levels.phd:
        return 5;
      default:
        return 1;
    }
  }

  static Levels fromInt(int level) {
    switch (level) {
      case 0:
        return Levels.language;
      case 1:
        return Levels.course;
      case 2:
        return Levels.school;
      case 3:
        return Levels.university;
      case 4:
        return Levels.master;
      case 5:
        return Levels.phd;
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
  static String fieldToString(Fields field) {
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

  static Fields fromString(String string) {
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
