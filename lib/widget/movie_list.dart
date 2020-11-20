import 'package:flutter/material.dart';
import 'package:movie_todolist/viewmodel/movie_tile_vm.dart';
import 'movie_tile.dart';

class MovieList extends StatelessWidget {
  final List<MovieTileVM> movieVMs;

  MovieList({this.movieVMs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movieVMs.length,
      itemBuilder: (context, index) {
        final movieVM = this.movieVMs[index];
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFDDDDDD), width: 1.0),
            ),
          ),
          child: MovieTile(movieTileVM: movieVM),
        );
      },
    );
  }
}

