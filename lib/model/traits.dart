import 'dart:convert';

class Traits {
  /// Trait that determines the player's ambitious/passive personality.
  /// It will influence the amount of fun that the player gets
  /// with certain activities, and the amount of stress that the player gets
  /// after working for long periods of time. If the player is passive, it is
  /// easier to reach higher levels of happiness.
  late double _ambitious;
  late double _passive;

  /// Trait that determines the player's extroverted/introverted personality.
  /// It will influence the amount of social activities
  /// that the player needs to fulfill its social needs, and the amount of
  /// energy used in social activities, besides the fun achieved with them.
  late double _extroverted;
  late double _introverted;

  /// Trait that determines the player's active/relaxed personality.
  /// It will influence the amount of energy used when the player does an
  /// activity, and the amount of fun that the player gets with physical
  /// activities.
  late double _active;
  late double _relaxed;

  ///Constructor
  Traits({
    required double ambitious,
    required double passive,
    required double extroverted,
    required double introverted,
    required double active,
    required double relaxed,
  }) {
    _ambitious = ambitious;
    _passive = passive;
    _extroverted = extroverted;
    _introverted = introverted;
    _active = active;
    _relaxed = relaxed;
  }

  String toJson() {
    return jsonEncode({
      'ambitious': _ambitious,
      'passive': _passive,
      'extroverted': _extroverted,
      'introverted': _introverted,
      'active': _active,
      'relaxed': _relaxed,
    });
  }

  static Traits fromJson(Map json) {
    return Traits(
      ambitious: json['ambitious'],
      passive: json['passive'],
      extroverted: json['extroverted'],
      introverted: json['introverted'],
      active: json['active'],
      relaxed: json['relaxed'],
    );
  }
}
