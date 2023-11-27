import 'dart:io';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..post('/start', _startHandler)
  ..post('/move', _moveHandler)
  ..post('/end', _endHandler);

/// Request handler for the root path
Response _rootHandler(Request req) {
  return Response.ok(
    json.encode({
      'apiversion': '1',
      'author': '',
      'color': '#888888',
      'head': 'default',
      'tail': 'default',
    }), 
    headers: {
    'Content-Type': 'application/json',
    });
}

/// Request handler for the Start path
Future<Response> _startHandler(Request request) async {
  final gameData = await request.readAsString();
  
  print('START');
  return Response.ok('ok');
}

/// Request handler for the Move path
Future<Response> _moveHandler(Request request) async {
  final gameData = await request.readAsString();

  // TODO: filter on possible moves
  final String move = '';
  // const possibleMoves: Direction[] = ['up', 'down', 'left', 'right']
  // const move = possibleMoves[Math.floor(Math.random() * possibleMoves.length)]

  print('MOVE: $move');

  return Response.ok('ok');
}


/// Request handler for the End path
Future<Response> _endHandler(Request request) async {
  final gameData = await request.readAsString();

  print('END');
  return Response.ok('ok');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '3000');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
