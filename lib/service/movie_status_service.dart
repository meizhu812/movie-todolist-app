import 'dart:convert';

import 'package:movie_todolist/service/model/movie_status.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;

class MovieStatusService {
  Map<String, MovieStatus> _movieStatusMap;

  Map<String, MovieStatus> get movieStatusMap => _movieStatusMap;

  Future<void> fetchMovieStatus() async {
    final pref = await SharedPreferences.getInstance();
    var status = await rootBundle.loadString("res/mockStatus.json");
    _movieStatusMap = Map.fromIterable((jsonDecode(status) as Iterable),
        key: (json) => json["id"], value: (json) => MovieStatus.fromJson(json));
  }

  MovieStatus getMovieStatusById(String id) {
    return _movieStatusMap[id] ?? MovieStatus(id: id);
  }
}
