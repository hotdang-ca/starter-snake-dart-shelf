class RoyaleSettings {
  /// The number of turns between generating
  /// new hazards (shrinking the safe board space).
  ///
  /// **Example**: 5
  final int shrinkEveryNTurns;

  RoyaleSettings({
    required this.shrinkEveryNTurns,
  });
}