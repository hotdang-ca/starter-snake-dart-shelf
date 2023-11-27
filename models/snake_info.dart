import 'enums/heads.dart';
import 'enums/tails.dart';

class SnakeInfo {
  final String apiVersion;
  final String? author;
  final String? color;
  final Heads? head;
  final Tails? tail;
  final String version;

  SnakeInfo({
    required this.apiVersion,
    required this.version,
    this.author,
    this.color,
    this.head,
    this.tail,
  });
}