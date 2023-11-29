import 'dart:convert';
import 'package:test/test.dart';

import '../models/board.dart';
import '../models/enums/game_map.dart';
import '../models/enums/game_mode.dart';
import '../models/enums/game_source.dart';
import '../models/enums/heads.dart';
import '../models/enums/tails.dart';
import '../models/game.dart';
import '../models/snake.dart';

void main() {
  group('It creates models from the Start response:', () {
    const String sampleStartReponse = '''
{
    "game": {
        "id": "dfa9b3d4-831c-40dd-8621-dab104d8d41e",
        "ruleset": {
            "name": "standard",
            "version": "v1.2.3",
            "settings": {
                "foodSpawnChance": 15,
                "minimumFood": 1,
                "hazardDamagePerTurn": 0,
                "hazardMap": "",
                "hazardMapAuthor": "",
                "royale": {
                    "shrinkEveryNTurns": 0
                },
                "squad": {
                    "allowBodyCollisions": false,
                    "sharedElimination": false,
                    "sharedHealth": false,
                    "sharedLength": false
                }
            }
        },
        "map": "standard",
        "timeout": 500,
        "source": "custom"
    },
    "turn": 0,
    "board": {
        "height": 11,
        "width": 11,
        "snakes": [
            {
                "id": "gs_GmdWwDkgKvDW3YcykBRW3KHC",
                "name": "My First Battlesnake",
                "latency": "",
                "health": 100,
                "body": [
                    {
                        "x": 9,
                        "y": 9
                    },
                    {
                        "x": 9,
                        "y": 9
                    },
                    {
                        "x": 9,
                        "y": 9
                    }
                ],
                "head": {
                    "x": 9,
                    "y": 9
                },
                "length": 3,
                "shout": "",
                "squad": "",
                "customizations": {
                    "color": "#888888",
                    "head": "default",
                    "tail": "default"
                }
            }
        ],
        "food": [
            {
                "x": 8,
                "y": 10
            },
            {
                "x": 5,
                "y": 5
            }
        ],
        "hazards": []
    },
    "you": {
        "id": "gs_GmdWwDkgKvDW3YcykBRW3KHC",
        "name": "My First Battlesnake",
        "latency": "",
        "health": 100,
        "body": [
            {
                "x": 9,
                "y": 9
            },
            {
                "x": 9,
                "y": 9
            },
            {
                "x": 9,
                "y": 9
            }
        ],
        "head": {
            "x": 9,
            "y": 9
        },
        "length": 3,
        "shout": "",
        "squad": "",
        "customizations": {
            "color": "#888888",
            "head": "default",
            "tail": "default"
        }
    }
}
''';
    final Map<String, dynamic> response = json.decode(sampleStartReponse);

    test('It creates a Snake object from JSON', () {
      final Snake snake = Snake.fromJson(response['you']);
      expect(snake.id, 'gs_GmdWwDkgKvDW3YcykBRW3KHC');
      expect(snake.name, 'My First Battlesnake');
      expect(snake.health, 100);
      expect(snake.body.length, 3);
      expect(snake.head.x, 9);
      expect(snake.head.y, 9);
      expect(snake.length, 3);
      expect(snake.shout, '');
      expect(snake.squad, '');
      expect(snake.customizations.color, '#888888');
      expect(snake.customizations.head, Heads.defaultHead);
      expect(snake.customizations.tail, Tails.defaultTail);
    });

    test('It creates a Board from JSON', () {
      final Board board = Board.fromJson(response['board']);
      expect(board.height, 11);
      expect(board.width, 11);
      expect(board.hazards.length, 0);
      expect(board.snakes.length, 1);
      expect(board.food.length, 2);
    });

    test('It creates a Game from JSON', () {
      final Game game = Game.fromJson(response['game']);

      expect(game.id, 'dfa9b3d4-831c-40dd-8621-dab104d8d41e');
      expect(game.ruleSet.name, GameMode.standard);
      expect(game.ruleSet.version, 'v1.2.3');
      expect(game.ruleSet.settings.foodSpawnChance, 15);
      expect(game.ruleSet.settings.minimumFood, 1);
      expect(game.ruleSet.settings.hazardDamagePerTurn, 0);
      //   expect(game.ruleSet.settings.royale, true);
      //   expect(game.ruleSet.settings.squad, true);
      expect(game.map, GameMap.standard);
      expect(game.timeout, 500);
      expect(game.gameSource, GameSource.custom);
    });
  });
}
