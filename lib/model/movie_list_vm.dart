import 'package:flutter/material.dart';
import 'package:movie_todolist/service/dto/Movie.dart';
import 'package:movie_todolist/service/movie_service.dart';

class MovieListViewModel extends ChangeNotifier {
  List<Movie> movies = List<Movie>();
  final MovieService movieService;

  MovieListViewModel({this.movieService});

  Future<void> fetchMovies(String keyword) async {
    this.movies = await movieService.fetchMovies(keyword);
    notifyListeners();
  }
}
