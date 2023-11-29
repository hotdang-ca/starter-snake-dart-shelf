import 'enums/heads.dart';
import 'enums/tails.dart';

/// https://docs.battlesnake.com/api/requests/info
class MainResponse {
  static const keyApiVersion = 'apiversion';
  static const keyColor = 'color';
  static const keyHead = 'head';
  static const keyTail = 'tail';
  static const keyAuthor = 'author';

  final String apiVersion;
  final String? author;
  final String? color;
  final Heads? head;
  final Tails? tail;

  MainResponse({
    required this.apiVersion,
    this.author,
    this.color,
    this.head,
    this.tail,
  });

  Map<String, dynamic> toJson() {
    final response = {
      keyApiVersion: apiVersion,
    };

    if (color != null) {
      response[keyColor] = color!;
    }
    if (author != null) {
      response[keyAuthor] = author!;
    }
    if (head != null) {
      response[keyHead] = head!.unsanitizedStringValue;
    }
    if (tail != null) {
      response[keyTail] = tail!.unsanitizedStringValue;
    }

    return response;
  }
}
