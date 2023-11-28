class SquadSettings {
  /// Allow members of the same squad to move over each other without dying.
  /// 
  /// **Example**: true
  final bool allowBodyCollisions;

  /// All squad members are eliminated when one is eliminated.
  ///
  /// **Example**: true
  final bool sharedElimination;

  /// All squad members share health.
  /// 
  /// **Example**: true
  final bool sharedHealth;

  /// All squad members share length.
  ///
  /// **Example**: true
  final bool sharedLength;

  SquadSettings({
    required this.allowBodyCollisions,
    required this.sharedElimination,
    required this.sharedHealth,
    required this.sharedLength,
  });
}