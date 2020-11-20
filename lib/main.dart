import 'package:flutter/material.dart';
import 'package:movie_todolist/service/movie_status_service.dart';
import 'package:movie_todolist/viewmodel/movie_list_vm.dart';
import 'package:movie_todolist/page/movie_list_page.dart';
import 'package:movie_todolist/service/movie_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final movieService = MovieService(Client());
  final movieStatusService = MovieStatusService();
  await movieStatusService.fetchMovieStatus();
  runApp(MyApp(
      movieService: movieService, movieStatusService: movieStatusService));
}

class MyApp extends StatelessWidget {
  final movieService;

  final movieStatusService;

  MyApp({this.movieService, this.movieStatusService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies",
      home: ChangeNotifierProvider(
        create: (context) =>
            MovieListViewModel(movieService, movieStatusService),
        child: MovieListPage(),
      ),
    );
  }
}
