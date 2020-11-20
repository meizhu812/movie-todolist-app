import 'dart:convert';

import 'package:movie_todolist/service/model/movie_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieStatusService {
  Future<List<MovieStatus>> fetchMovieStatus() async {
    final pref = await SharedPreferences.getInstance();
    return (jsonDecode(pref.getString('movie_status')) as Iterable)
            .map((e) => MovieStatus.fromJson(e))
            .toList();
  }
}
