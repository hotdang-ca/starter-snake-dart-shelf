import 'board.dart';
import 'game.dart';
import 'snake.dart';

class GameState {
  final Game game;
  final int turn;
  final Board board;
  final Snake you; // TODO: should this be a Battlesnake object?

  GameState({
    required this.game,
    required this.turn,
    required this.board,
    required this.you,
  });
}