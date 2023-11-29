class RoyaleSettings {
  /// The number of turns between generating
  /// new hazards (shrinking the safe board space).
  ///
  /// **Example**: 5
  final int shrinkEveryNTurns;

  RoyaleSettings({
    required this.shrinkEveryNTurns,
  });

  RoyaleSettings.fromJson(Map<String, dynamic> json)
      : shrinkEveryNTurns = json['shrinkEveryNTurns'];
}
