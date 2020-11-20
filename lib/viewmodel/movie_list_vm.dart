import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_todolist/service/model/movie.dart';
import 'package:movie_todolist/service/movie_status_service.dart';
import 'package:movie_todolist/viewmodel/movie_tile_vm.dart';
import 'package:movie_todolist/service/movie_service.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieTileVM> _movies = List<MovieTileVM>();
  final MovieService _movieService;
  final MovieStatusService _statusService;

  List<MovieTileVM> get movies {
    return this._movies;
  }

  MovieListViewModel(
      MovieService movieService, MovieStatusService statusService)
      : _movieService = movieService,
        _statusService = statusService;

  Future<void> fetchMovies(String keyword) async {
    final response = await _movieService.fetchMovies(keyword);
    this._movies = (jsonDecode(response.body)["Search"] as Iterable)
        .map((movieJson) => Movie.fromJson(movieJson))
        .map((movie) =>
            MovieTileVM(movie, _statusService.getMovieStatusById(movie.imdbId)))
        .toList();
    notifyListeners();
  }
}
