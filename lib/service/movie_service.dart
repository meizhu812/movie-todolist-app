import 'dart:convert';
import 'package:movie_todolist/service/dto/Movie.dart';
import 'package:http/http.dart' as http;

const API_KEY = "f7db45a";

class MovieService {
  final http.Client _client;

  MovieService(this._client);

  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = "http://www.omdbapi.com/?s=$keyword&apikey=$API_KEY";
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      print(json);
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
