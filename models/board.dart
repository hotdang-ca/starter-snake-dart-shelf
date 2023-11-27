import 'coordinates.dart';
import 'snake.dart';

class Board {
  final int height;
  final int width;
  final List<Coordinates> food;
  final List<Coordinates> hazards;
  final List<Snake> snakes;

  Board({
    required this.height,
    required this.width,
    required this.food,
    required this.hazards,
    required this.snakes,
  });
}