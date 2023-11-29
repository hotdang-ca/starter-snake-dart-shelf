import 'enums/game_source.dart';
import 'rule_set.dart';

/// https://docs.battlesnake.com/api/objects/game
class Game {
  /// A unique identifier for this Game.
  ///
  /// **Example**: "totally-unique-game-id"
  final String id;

  /// Information about the ruleset being used to run this game.
  final RuleSet ruleSet;

  /// The name of the map used to populate the game board with snakes,
  /// food, and hazards.
  ///
  /// **Example**: "standard"
  final String? map;

  /// How much time your snake has to respond to
  /// requests for this Game in milliseconds (integer).
  ///
  /// **Example**: 500
  final int timeout;

  /// The source of this game. One of:
  ///
  /// * tournament
  /// * league (for League Arenas)
  /// * arena (for all other Arenas)
  /// * challenge
  /// * custom (for all other games sources)
  ///
  /// The values for this field may change in the near future.
  GameSource gameSource;

  Game({
    required this.id,
    required this.ruleSet,
    required this.timeout,
    required this.map,
    required this.gameSource,
  });

  Game.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        ruleSet = RuleSet.fromJson(json['ruleset']),
        timeout = json['timeout'],
        map = json['map'],
        gameSource = GameSource.values.firstWhere(
          (g) => g.name == json['source'],
        );
}
