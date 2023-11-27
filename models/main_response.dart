class MainResponse {
  final int apiVersion;
  final String author;
  final String primaryColor;
  final String headColor;
  final String tailColor;

  MainResponse({
    required this.apiVersion,
    required this.author,
    required this.primaryColor,
    required this.headColor,
    required this.tailColor,
  });

  Map<String, dynamic> toJson() {
    return {
      'apiversion': apiVersion,
      'color': primaryColor,
      'head': headColor,
      'tail': tailColor,
    };
  }
}