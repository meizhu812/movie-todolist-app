import 'package:flutter/material.dart';
import 'package:movie_todolist/viewmodel/movie_tile_vm.dart';
import 'package:movie_todolist/service/movie_service.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieTileVM> _movies = List<MovieTileVM>();
  final MovieService _movieService;

  List<MovieTileVM> get movies {
    return this._movies;
  }

  MovieListViewModel(MovieService movieService) : _movieService = movieService;

  Future<void> fetchMovies(String keyword) async {
    this._movies = (await _movieService.fetchMovies(keyword))
        .map((movie) => MovieTileVM(movie))
        .toList();
    notifyListeners();
  }
}
