import 'package:flutter/material.dart';
import 'package:movie_todolist/service/dto/Movie.dart';
import 'package:movie_todolist/service/movie_service.dart';

class MovieListViewModel extends ChangeNotifier {
  List<Movie> _movies = List<Movie>();
  final MovieService movieService;

  List<Movie> get movies {
    return this._movies;
  }

  MovieListViewModel({this.movieService});

  Future<void> fetchMovies(String keyword) async {
    this._movies = await movieService.fetchMovies(keyword);
    notifyListeners();
  }
}
