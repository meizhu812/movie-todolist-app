class Movie {
  final String title;
  final String year;
  final String posterUrl;

  Movie({this.title, this.year, this.posterUrl});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["Title"],
      year: json["Year"],
      posterUrl: json["Poster"],
    );
  }
}
