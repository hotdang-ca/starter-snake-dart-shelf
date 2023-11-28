import 'enums/direction.dart';

class Move {
  /// Your Battlesnake's move for this turn.
  ///
  /// Valid moves are up, down, left, or right.
  ///
  /// Example: "up"
  final Direction move;

  /// An optional message sent to all other Battlesnakes
  /// on the next turn. Must be 256 characters or less.
  ///
  /// Example: "I am moving up!"
  final String? shout;

  Move({ 
    required this.move,
    this.shout, 
  });
}