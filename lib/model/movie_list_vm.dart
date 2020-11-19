import 'package:flutter/material.dart';
import 'package:movie_todolist/model/movie_vm.dart';
import 'package:movie_todolist/service/movie_service.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieVM> _movies = List<MovieVM>();
  final MovieService movieService;

  List<MovieVM> get movies {
    return this._movies;
  }

  MovieListViewModel({this.movieService});

  Future<void> fetchMovies(String keyword) async {
    this._movies = (await movieService.fetchMovies(keyword)).map((movie) => MovieVM(movie)).toList();
    notifyListeners();
  }
}
