import 'dart:convert';
import 'package:movie_todolist/service/dto/movie.dart';
import 'package:http/http.dart' as http;

const API_KEY = "31aa985c";

class MovieService {
  final http.Client _client;

  MovieService(this._client);

  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = "http://www.omdbapi.com/?s=$keyword&apikey=$API_KEY";
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Search"]
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } else {
      throw Exception("Request Failed!");
    }
  }
}
