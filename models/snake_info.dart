import 'enums/heads.dart';
import 'enums/tails.dart';

class SnakeInfo {
  
  /// Version of the Battlesnake API implemented by this Battlesnake.
  ///
  /// **Example**: "1"
  final String apiVersion;

  /// Username of the author of this Battlesnake.
  ///
  /// If provided, this will be used to verify ownership.
  ///
  /// **Example**: "BattlesnakeOfficial" 
  final String? author;

  
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
  
  
  /// A version number or tag for your snake.
  final String version;
  
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