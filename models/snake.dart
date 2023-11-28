import 'coordinates.dart';
import 'snake_info.dart';

class Snake {
  /// Unique identifier for this Battlesnake in the context of the current Game.
  /// 
  /// Example: "totally-unique-snake-id"
  final String id;

  /// Name given to this Battlesnake by its author.
  /// 
  /// Example: "Sneky McSnek Face"
  final String name;

  /// Health value (integer) of this Battlesnake, between 0 and 100 inclusively.
  ///
  /// Example: 54
  ///
  /// TODO: is this final?
  final int health;

  /// Array of coordinates representing this Battlesnake's location on the game board.
  /// 
  /// This array is ordered from head to tail.
  /// 
  /// Example: [{"x": 0, "y": 0}, ..., {"x": 2, "y": 0}] */
  final List<Coordinates> body;

  /// The previous response time of this Battlesnake, in milliseconds.
  ///
  /// "0" means the Battlesnake timed out and failed to respond.
  /// 
  /// Example: "450"
  final String latency;

  /// Coordinates for this Battlesnake's head.
  ///
  /// Equivalent to the first element of the body array.
  /// 
  /// Example: {"x": 0, "y": 0}
  final Coordinates head;

  /// Length of this Battlesnake from head to tail.
  ///
  /// Equivalent to the length (integer) of the body array.
  /// 
  /// Example: 3
  final int length;

  /**
   * Message shouted by this Battlesnake on the previous turn.
   * Example: "why are we shouting??"
   */
  final String? shout;

  /// The squad that the Battlesnake belongs to.
  ///
  /// Used to identify squad members in Squad Mode games.
  ///
  /// Example: "1"
  /// 
  /// *TODO* : can we link this to a squad model?
  final String squad;

  /// The collection of customizations applied to
  /// this Battlesnake that represent how it is viewed.
  final SnakeInfo customizations;

  Snake({
    required this.id,
    required this.name,
    required this.health,
    required this.body,
    required this.latency,
    required this.head,
    required this.length,
    required this.shout,
    required this.squad,
    required this.customizations,
  });

  Map<String, dynamic> toJson() {    
    return <String, dynamic>{
      'id': this.id,
      'name': this.name,
      'health': this.health,
      'body': this.body,
      'latency': this.latency,
      'head': this.head,
      'lenth': this.length,
      'squad': this.squad,
      'customizations': this.customizations,
    };
  }
}