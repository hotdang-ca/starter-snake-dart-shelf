import 'royale_settings.dart';
import 'squad_settings.dart';

class RulesetSettings {
  /// Percentage chance of spawning a new food every round.
  ///
  /// **Example**: 25
  final int foodSpawnChance;

  /// Minimum food to keep on the board every turn.
  ///
  /// **Example**: 1
  final int minimumFood;

  /// Health damage a snake will take when ending its turn in a hazard.
  ///
  /// This stacks on top of the regular 1 damage a snake takes per turn.
  ///
  /// **Example**: 14
  final int hazardDamagePerTurn;

  /// Optional Royale Settings
  RoyaleSettings royale;

  /// Optional Squad Settings
  SquadSettings squad;

  RulesetSettings({
    required this.foodSpawnChance,
    required this.minimumFood,
    required this.hazardDamagePerTurn,
    required this.royale,
    required this.squad,
  });

  RulesetSettings.fromJson(Map<String, dynamic> json)
      : foodSpawnChance = json['foodSpawnChance'],
        minimumFood = json['minimumFood'],
        hazardDamagePerTurn = json['hazardDamagePerTurn'],
        royale = RoyaleSettings.fromJson(json['royale']),
        squad = SquadSettings.fromJson(json['squad']);
}
