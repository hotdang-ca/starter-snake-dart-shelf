import 'coordinates.dart';
import 'snake.dart';

class Board {
  /// Height of the game board (integer).
  /// 
  /// **Example**: 11
  final int height;

  /// Width of the game board (integer).
  ///
  /// **Example**: 11
  final int width;

  /// Array of coordinates representing food locations on the game board.
  ///
  /// **Example**: [{"x": 5, "y": 5}, ..., {"x": 2, "y": 6}]
  final List<Coordinates> food;

  /// Array of coordinates representing hazardous locations on the game board.
  ///
  /// These will only appear in some game modes.
  ///
  /// **Example**: [{"x": 0, "y": 0}, ..., {"x": 0, "y": 1}]
   
  final List<Coordinates> hazards;

  /// Array of Battlesnake Objects representing all Battlesnakes
  /// remaining on the game board (including yourself if you haven't been eliminated).
  ///
  /// **Example**: [{"id": "snake-one", ...}, ...]
  final List<Snake> snakes;

  Board({
    required this.height,
    required this.width,
    required this.food,
    required this.hazards,
    required this.snakes,
  });
}