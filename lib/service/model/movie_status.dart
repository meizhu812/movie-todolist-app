class MovieStatus {
  final String id;
  bool isFavorite;
  bool isWatched;

  MovieStatus({this.id, this.isFavorite = false, this.isWatched = false});

  factory MovieStatus.fromJson(Map<String, dynamic> json) {
    return MovieStatus(
        id: json["id"],
        isFavorite: json["isFavorite"],
        isWatched: json["isWatched"]);
  }
}
