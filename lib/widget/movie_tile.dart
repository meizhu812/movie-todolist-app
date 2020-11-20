import 'package:flutter/material.dart';
import 'package:movie_todolist/viewmodel/movie_tile_vm.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    Key key,
    @required this.movieTileVM,
  }) : super(key: key);

  final MovieTileVM movieTileVM;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(movieTileVM.posterUrl),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          width: 50,
          height: 100,
        ),
        title: Text(
          movieTileVM.title,
          style: TextStyle(
            fontSize: 16.0,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          movieTileVM.year,
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: movieTileVM.isFavorite
                    ? Color(0XFFFF0000)
                    : Color(0XFF888888),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.check,
                color: movieTileVM.isWatched
                    ? Color(0XFFFF0000)
                    : Color(0XFF888888),
              ),
              onPressed: () {},
            ),
          ],
        ));
  }
}
