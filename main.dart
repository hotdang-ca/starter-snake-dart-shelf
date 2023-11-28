import 'dart:io';
import 'dart:convert';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'models/enums/direction.dart';
import 'models/main_response.dart';

/// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..post('/start', _startHandler)
  ..post('/move', _moveHandler)
  ..post('/end', _endHandler);

/// Your main response. Specify your details here.
final mainResponse = MainResponse(
  apiVersion: '1',
  author: 'Battlesnake',
  primaryColor: '#888888',
  headColor: 'default',
  tailColor: 'default',
);

/// Convenience method for returning a JSON response
Response _jsonResponse (encodable) => Response.ok(json.encode(encodable), headers: { 'Content-Type': 'application/json'});

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
  // TODO:
  // reference the GameData object
  // Handle some special logic written by you
  // Return your move!

  // All the possible moves
  final possibleMoves = Direction.values;
  // choose a move based on logic... random, in this case.
  final move = possibleMoves.elementAt(Random().nextInt(possibleMoves.length));

  print('MOVE: ${move.name}');
  return Response.ok('ok');
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
  final handler = Pipeline()
    .addMiddleware(logRequests())
    .addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);

  print('Dart Shelf Battlesnake Server listening at port ${server.port}');
}
