import 'package:flutter/material.dart';
import 'package:movie_todolist/viewmodel/movie_list_vm.dart';
import 'package:movie_todolist/page/movie_list_page.dart';
import 'package:movie_todolist/service/movie_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final movieService = MovieService(Client());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies",
      home: ChangeNotifierProvider(
        create: (context) => MovieListViewModel(movieService),
        child: MovieListPage(),
      ),
    );
  }
}
