import 'enums/direction.dart';

class Move {
  final Direction move;
  final String? shout;

  Move({ 
    required this.move,
    this.shout, 
  });
}