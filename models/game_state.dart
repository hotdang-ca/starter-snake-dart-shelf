import 'board.dart';
import 'game.dart';
import 'snake.dart';

class GameState {
  /// Game Object describing the game being played.
  final Game game;

  /// Turn number (integer) of the game being played (0 for new games).
  final int turn;

  /// Board Object describing the initial state of the game board.
  final Board board;
  
  /// Battlesnake Object describing your Battlesnake.
  final Snake you; 

  GameState({
    required this.game,
    required this.turn,
    required this.board,
    required this.you,
  });
}