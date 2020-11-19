import 'package:flutter/material.dart';
import 'package:movie_todolist/model/movie_vm.dart';
import 'package:movie_todolist/service/movie_service.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieVM> _movies = List<MovieVM>();
  final MovieService _movieService;

  List<MovieVM> get movies {
    return this._movies;
  }

  MovieListViewModel(MovieService movieService) : _movieService = movieService;

  Future<void> fetchMovies(String keyword) async {
    this._movies = (await _movieService.fetchMovies(keyword))
        .map((movie) => MovieVM(movie))
        .toList();
    notifyListeners();
  }
}
