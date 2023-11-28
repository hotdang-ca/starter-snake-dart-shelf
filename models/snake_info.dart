import 'enums/heads.dart';
import 'enums/tails.dart';

class SnakeInfo {
  final String apiVersion;
  final String version;
  final String? author;
  final String? color;
  final Heads? head;
  final Tails? tail;

  SnakeInfo({
    required this.apiVersion,
    required this.version,
    this.author,
    this.color,
    this.head,
    this.tail,
  });

  Map<String, dynamic> toJson() {
    final returnValue = <String, dynamic>{};

    // required values
    returnValue['apiversion'] = this.apiVersion;
    returnValue['version'] = this.version;

    if (this.author != null) returnValue['author'] = this.author;
    if (this.color != null) returnValue['color'] = this.color;
    if (this.head != null) returnValue['head'] = this.head!.unsanitizedStringValue;
    if (this.tail != null) returnValue['tail'] = this.tail!.unsanitizedStringValue;

    return returnValue;
  }
}