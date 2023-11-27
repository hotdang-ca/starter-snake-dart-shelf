import 'rule_set.dart';

class Game {
  final int id;
  final RuleSet ruleSet;
  final int timeout;

  Game({
    required this.id,
    required this.ruleSet,
    required this.timeout,
  });
}