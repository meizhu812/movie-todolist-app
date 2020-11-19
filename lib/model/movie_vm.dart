import 'package:flutter/material.dart';
import 'package:movie_todolist/service/dto/Movie.dart';

class MovieVM extends ChangeNotifier {
  final Movie _movie;
  bool isFavorite;
  bool isWatched;

  MovieVM(Movie movie) : _movie = movie;

  String get title => _movie.title;

  String get year => _movie.year;

  String get posterUrl => _movie.posterUrl;
}
