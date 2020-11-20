import 'package:flutter/material.dart';
import 'package:movie_todolist/viewmodel/movie_tile_vm.dart';
import 'movie_tile.dart';

class MovieList extends StatelessWidget {
  final List<MovieTileVM> movies;

  MovieList({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      itemBuilder: (context, index) {
        final movie = this.movies[index];
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFDDDDDD), width: 1.0),
            ),
          ),
          child: MovieTile(movie: movie),
        );
      },
    );
  }
}

