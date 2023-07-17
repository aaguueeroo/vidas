class VidaSavingSlot {
  int? id;
  String name;
  int avatarId;
  int age;
  DateTime last_access;

  /// JSON string containing the state of the vida object
  String game_data;

  VidaSavingSlot({
    required this.id,
    required this.name,
    required this.avatarId,
    required this.age,
    required this.last_access,
    required this.game_data,
  });

  factory VidaSavingSlot.fromMap(Map<String, dynamic> map) {
    return VidaSavingSlot(
      id: map['id'] as int,
      name: map['name'] as String,
      avatarId: map['avatar_id'] as int,
      age: map['age'] as int,
      last_access: DateTime.parse(map['last_access'] as String),
      game_data: map['game_data'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return id == null
        ? {
            'name': name,
            'avatar_id': avatarId,
            'age': age,
            'last_access': last_access.toIso8601String(),
            'game_data': game_data,
          }
        : {
            'id': id,
            'name': name,
            'avatar_id': avatarId,
            'age': age,
            'last_access': last_access.toIso8601String(),
            'game_data': game_data,
          };
  }
}
