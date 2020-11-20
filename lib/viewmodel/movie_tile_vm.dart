import 'package:flutter/material.dart';
import 'package:movie_todolist/service/model/movie.dart';
import 'package:movie_todolist/service/model/movie_status.dart';

class MovieTileVM extends ChangeNotifier {
  final Movie _movie;
  bool isFavorite = false;
  bool isWatched = false;

  MovieTileVM(Movie movie, MovieStatus status)
      : _movie = movie,
        isFavorite = status.isFavorite,
        isWatched = status.isWatched;

  String get title => _movie.title;

  String get year => _movie.year;

  String get posterUrl => _movie.posterUrl;
}
