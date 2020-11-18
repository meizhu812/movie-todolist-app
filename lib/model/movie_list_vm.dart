import 'package:flutter/material.dart';
import 'package:movie_todolist/service/dto/Movie.dart';
import 'package:movie_todolist/service/movie_service.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = List<MovieViewModel>();
  final MovieService movieService;

  MovieListViewModel({this.movieService});

  Future<void> fetchMovies(String keyword) async {
    final results = await movieService.fetchMovies(keyword);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }
}

class MovieViewModel {
  final Movie movie;

  MovieViewModel({this.movie});

  String get title {
    return this.movie.title;
  }

  int get year {
    return int.parse(this.movie.year);
  }

  String get posterUrl {
    return this.movie.posterUrl;
  }
}
