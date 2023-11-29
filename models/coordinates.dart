class Coordinates {
  /// An x-coordinate on the board (integer).
  ///
  /// **Example**: 1
  final int x;

  /// A y-coordinate on the board (integer).
  ///
  /// **Example**: 1
  final int y;

  Coordinates({
    required this.x,
    required this.y,
  });

  Coordinates.fromJson(Map<String, dynamic> json)
      : x = json['x'],
        y = json['y'];
}
