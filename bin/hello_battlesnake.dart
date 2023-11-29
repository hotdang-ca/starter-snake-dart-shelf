import 'dart:io';
import 'dart:convert';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/board.dart';
import '../models/coordinates.dart';
import '../models/enums/direction.dart';
import '../models/enums/heads.dart';
import '../models/enums/tails.dart';
import '../models/game.dart';
import '../models/main_response.dart';
import '../models/snake.dart';

/// configuration
// Your main configuration. Specify your details here.
final mainResponse = MainResponse(
  apiVersion: '1',
  author: 'Battlesnake',
  color: '#eb6433',
  head: Heads.defaultHead,
  tail: Tails.defaultTail,
);

/// Some global state.
Direction? lastDirection;

/// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..post('/start', _startHandler)
  ..post('/move', _moveHandler)
  ..post('/end', _endHandler);

/// Convenience method for returning a JSON response
Response _jsonResponse(encodable) => Response.ok(json.encode(encodable),
    headers: {'Content-Type': 'application/json'});

/// Request handler for the root path
Response _rootHandler(Request req) {
  return _jsonResponse(mainResponse);
}

/// Request handler for the Start path
Future<Response> _startHandler(Request request) async {
  final gameData = await request.readAsString();

  print('START: $gameData');
  return Response.ok('ok');
}

/// Request handler for the Move path
Future<Response> _moveHandler(Request request) async {
  final gameData = await request.readAsString();
  final gameDataJson = json.decode(gameData);

  final board = Board.fromJson(gameDataJson['board']);
  final you = Snake.fromJson(gameDataJson['you']);
  final game = Game.fromJson(gameDataJson['game']);

  print('My location: ${you.head.x}x${you.head.y}');

  final possibleMoves = [
    Direction.up,
    Direction.down,
    Direction.left,
    Direction.right,
  ];
  final Coordinates myCoordinate = Coordinates(x: you.head.x, y: you.head.y);

  // don't hit the walls
  if (myCoordinate.x == 0) {
    // no matter what, we're on the left column. Cannot go left.
    possibleMoves.remove(Direction.left);
  } else if (myCoordinate.x == board.width - 1) {
    // no matter what, we're on the right column. Cannot go right.
    possibleMoves.remove(Direction.right);
  }

  if (myCoordinate.y == 0) {
    // no matter what, we're on the bottom row. Cannot go down.
    possibleMoves.remove(Direction.down);
  } else if (myCoordinate.y == board.height - 1) {
    // no matter what, we're on the top row. Cannot go up.
    possibleMoves.remove(Direction.up);
  }

  // don't hit yourself
  for (final bodyPart in you.body) {
    if (bodyPart.x == myCoordinate.x) {
      if (bodyPart.y == myCoordinate.y + 1) {
        // body part is above head
        possibleMoves.remove(Direction.up);
      } else if (bodyPart.y == myCoordinate.y - 1) {
        // body part is below head
        possibleMoves.remove(Direction.down);
      }
    } else if (bodyPart.y == myCoordinate.y) {
      if (bodyPart.x == myCoordinate.x + 1) {
        // body part is to the right of head
        possibleMoves.remove(Direction.right);
      } else if (bodyPart.x == myCoordinate.x - 1) {
        // body part is to the left of head
        possibleMoves.remove(Direction.left);
      }
    }
  }

  // prefer the food if we're adjacent to it
  List<Direction> preferredMoves = [];
  for (final food in board.food) {
    // there is food to the right
    if (food.x == myCoordinate.x + 1 && food.y == myCoordinate.y) {
      preferredMoves.add(Direction.right);
    }

    // there is food to the left
    if (food.x == myCoordinate.x - 1 && food.y == myCoordinate.y) {
      preferredMoves.add(Direction.left);
    }

    // there is food above
    if (food.x == myCoordinate.x && food.y == myCoordinate.y + 1) {
      preferredMoves.add(Direction.up);
    }

    // there is food below
    if (food.x == myCoordinate.x && food.y == myCoordinate.y - 1) {
      preferredMoves.add(Direction.down);
    }
  }
  // All the remaining possible moves
  print('POSSIBLE MOVES: $possibleMoves');
  print('PREFERRED MOVES: $preferredMoves');

  late final Direction move;
  if (possibleMoves.length == 0) {
    // no possible moves, we lose
    print('NO POSSIBLE MOVES');
    move = lastDirection ?? Direction.up; // just pick something
  } else {
    // choose the first preferred move that is also in the remaing possible moves
    if (preferredMoves.length > 0) {
      for (final preferredMove in preferredMoves) {
        if (possibleMoves.contains(preferredMove)) {
          move = preferredMove;
          print('PREFERRED MOVE: ${move.name}');
          break;
        }
      }
    } else {
      // no food nearby. Prefer last action, otherwise pick a random move
      if (possibleMoves.contains(lastDirection)) {
        move = lastDirection!;
      } else if (possibleMoves.contains(Direction.left) &&
          (possibleMoves.contains(Direction.right))) {
        // we have two options, pick the one that has the most space
        if (myCoordinate.x < board.width / 2) {
          move = Direction.right;
        } else {
          move = Direction.left;
        }
      } else if (possibleMoves.contains(Direction.up) &&
          (possibleMoves.contains(Direction.down))) {
        // we have two options, pick the one that has the most space
        if (myCoordinate.y < board.height / 2) {
          move = Direction.up;
        } else {
          move = Direction.down;
        }
      } else {
        move = possibleMoves.elementAt(Random().nextInt(possibleMoves.length));
      }
    }

    print('MOVE: ${move.name}');
    lastDirection = move;
  }

  return _jsonResponse({'move': move.name});
}

/// Request handler for the End path
Future<Response> _endHandler(Request request) async {
  final gameData = await request.readAsString();

  // TODO: clear game state, the game is over
  print('END');
  return Response.ok('ok');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);

  print('Dart Shelf Battlesnake Server listening at port ${server.port}');
}
