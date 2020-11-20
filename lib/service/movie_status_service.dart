import 'dart:convert';

import 'package:movie_todolist/service/model/movie_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieStatusService {
  List<MovieStatus> _movieStatusList;

  List<MovieStatus> get movieStatusList => _movieStatusList;

  Future<void> fetchMovieStatus() async {
    final pref = await SharedPreferences.getInstance();
    _movieStatusList = (jsonDecode(pref.getString('movie_status')) as Iterable)
        .map((e) => MovieStatus.fromJson(e))
        .toList();
  }
}
