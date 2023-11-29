import 'enums/heads.dart';
import 'enums/tails.dart';

class SnakeInfo {
  /// Hex color code used to display this Battlesnake.
  ///
  /// Must start with "#" and be 7 characters long.
  ///
  /// **Example**: "#888888"
  final String? color;

  /// Displayed head of this Battlesnake.
  /// See battlesnake.io docs for head images.
  ///
  /// **Example**: "default"
  final Heads? head;

  /// Displayed tail of this Battlesnake.
  ///
  /// See battlesnake.io docs for tail images.
  ///
  /// **Example**: "default"
  final Tails? tail;

  SnakeInfo({
    this.color,
    this.head,
    this.tail,
  });

  SnakeInfo.fromJson(Map<String, dynamic> json)
      : color = json['color'],
        head = Heads.values.firstWhere(
          (h) => h.name == json['head'],
          orElse: () => Heads.defaultHead,
        ),
        tail = Tails.values.firstWhere(
          (t) => t.name == json['tail'],
          orElse: () => Tails.defaultTail,
        );

  Map<String, dynamic> toJson() {
    final returnValue = <String, dynamic>{};

    returnValue['color'] = this.color;
    returnValue['head'] = this.head!.unsanitizedStringValue;
    returnValue['tail'] = this.tail!.unsanitizedStringValue;

    return returnValue;
  }
}
