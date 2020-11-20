import 'package:flutter/material.dart';
import 'package:movie_todolist/viewmodel/movie_vm.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final MovieVM movie;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}