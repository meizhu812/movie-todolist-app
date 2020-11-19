import 'package:flutter/material.dart';
import 'package:movie_todolist/model/movie_list_vm.dart';
import 'package:movie_todolist/widget/movie_list.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("star");
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Movies")),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    vm.fetchMovies(value);
                    _controller.clear();
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
              ),
            ),
            Expanded(child: MovieList(movies: vm.movies))
          ],
        ),
      ),
    );
  }
}
