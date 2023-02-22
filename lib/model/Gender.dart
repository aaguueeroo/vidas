
enum Genders {
  Male,
  Female,
  Diverse,
}

class Gender{
  /// Converts the enum [Genders] to String
  static String genderToString(Genders gender) {
    switch (gender) {
      case Genders.Male:
        return 'Male';
      case Genders.Female:
        return 'Female';
      case Genders.Diverse:
        return 'Diverse';
      default:
        throw UnimplementedError("Gender not implemented");
    }
  }

  ///Converts a string to the enum [Genders]
  static Genders stringToGender(String string) {
    switch (string) {
      case 'Male':
        return Genders.Male;
      case 'Female':
        return Genders.Female;
      case 'Diverse':
        return Genders.Diverse;
      default:
        throw UnimplementedError("Gender not implemented");
    }
  }

}