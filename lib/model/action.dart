class Action {
  final String text;
  int baseEnergyCost;

  /// Calculated by taking into account different influences in the
  /// action such as the vida state, traits or education.
  late int energyCost;

  Action(this.text, this.baseEnergyCost, this.energyCost);

  int calculateEnergyCost() {
    return 42;
  }
}
