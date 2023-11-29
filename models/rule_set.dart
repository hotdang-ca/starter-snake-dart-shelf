import 'enums/game_mode.dart';
import 'ruleset_settings.dart';

class RuleSet {
  /// Name of the ruleset being used to run this game.
  final GameMode name;

  /// The release version of the Rules module used in this game.
  ///
  /// **Example**: "v1.2.3"
  final String version;

  /// A collection of specific settings being used by the
  /// current game that control how the rules are applied.
  final RulesetSettings settings;

  RuleSet({
    required this.name,
    required this.version,
    required this.settings,
  });

  RuleSet.fromJson(Map<String, dynamic> json)
      : name = GameMode.values.firstWhere(
          (g) => g.name == json['name'],
        ),
        version = json['version'],
        settings = RulesetSettings.fromJson(json['settings']);
}
