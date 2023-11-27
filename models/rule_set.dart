import 'enums/game_mode.dart';
import 'game_settings.dart';

class RuleSet {
  final GameMode name;
  final String version;
  final GameSettings settings;

  RuleSet({
    required this.name,
    required this.version,
    required this.settings,
  });
}