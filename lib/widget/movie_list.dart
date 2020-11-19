import 'package:flutter/material.dart';
import 'package:movie_todolist/service/dto/Movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

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
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movie.posterUrl),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 50,
                height: 100,
              ),
              title: Text(
                movie.title,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                movie.year,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Color(0XFFFF0000),
                ),
                onPressed: () {},
              ),
            ));
      },
    );
  }
}
