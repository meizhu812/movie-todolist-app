import 'dart:convert';

import 'package:movie_todolist/service/model/movie_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieStatusService {
  Map<String, MovieStatus> _movieStatusMap;

  Map<String, MovieStatus> get movieStatusMap => _movieStatusMap;

  Future<void> fetchMovieStatus() async {
    final pref = await SharedPreferences.getInstance();
    _movieStatusMap = Map.fromIterable(
        (jsonDecode(pref.getString('movie_status')) as Iterable),
        key: (json) => json["id"],
        value: (json) => MovieStatus.fromJson(json));
  }
}
