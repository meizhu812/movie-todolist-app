class Movie {
  final String title;
  final String year;
  final String imdbId;
  final String posterUrl;

  Movie({this.title, this.year, this.imdbId, this.posterUrl});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["Title"],
      year: json["Year"],
      imdbId: json["imdbID"],
      posterUrl: json["Poster"],
    );
  }
}
