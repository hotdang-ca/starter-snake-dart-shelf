class MainResponse {
  static const keyApiVersion = 'apiversion';
  static const keyColor = 'color';
  static const keyHead = 'head';
  static const keyTail = 'tail';
  
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
      keyApiVersion: apiVersion,
      keyColor: primaryColor,
      keyHead: headColor,
      keyTail: tailColor,
    };
  }
}