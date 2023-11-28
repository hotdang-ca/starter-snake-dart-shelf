import 'rule_set.dart';

class Game {
  /// A unique identifier for this Game.
  ///
  /// **Example**: "totally-unique-game-id"
  final int id;

  /// Information about the ruleset being used to run this game.
  final RuleSet ruleSet;

  /// How much time your snake has to respond to
  /// requests for this Game in milliseconds (integer).
  ///
  /// **Example**: 500
  final int timeout;

  Game({
    required this.id,
    required this.ruleSet,
    required this.timeout,
  });
}