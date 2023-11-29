import 'royale_settings.dart';
import 'squad_settings.dart';

class GameSettings {
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
  RoyaleSettings? royale;

  /// Optional Squad Settings
  SquadSettings? squad;

  GameSettings({
    required this.foodSpawnChance,
    required this.minimumFood,
    required this.hazardDamagePerTurn,
    this.royale,
    this.squad,
  });

  GameSettings.fromJson(Map<String, dynamic> json)
      : foodSpawnChance = json['foodSpawnChance'],
        minimumFood = json['minimumFood'],
        hazardDamagePerTurn = json['hazardDamagePerTurn'],
        royale = json['royale'] != null
            ? RoyaleSettings.fromJson(json['royale'])
            : null,
        squad = json['squad'] != null
            ? SquadSettings.fromJson(json['squad'])
            : null;
}
