import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_todolist/service/model/movie_status.dart';
import 'package:movie_todolist/viewmodel/movie_tile_vm.dart';
import 'package:movie_todolist/service/model/movie.dart';
import 'package:movie_todolist/service/movie_service.dart';
import 'package:movie_todolist/widget/movie_tile.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../test_util.dart';

class MockService extends Mock implements MovieService {}

main() {
  group('render movie tile', () {
    testWidgets('render tile with movie not favorite nor watched',
        (WidgetTester tester) async {
      final movie =
          Movie(title: "title", year: "year", imdbId: "id", posterUrl: "url");
      final status = MovieStatus(id: "id");
      final movieTileVM = MovieTileVM(movie, status);

      await mockNetworkImagesFor(() =>
          tester.pumpWidget(wrapWidget(MovieTile(movieTileVM: movieTileVM))));

      expect((tester.firstWidget(find.byIcon(Icons.favorite)) as Icon).color,
          Color(0xFF888888));
      expect((tester.firstWidget(find.byIcon(Icons.check)) as Icon).color,
          Color(0xFF888888));
    });

    testWidgets('render tile with movie favorite and watched',
        (WidgetTester tester) async {
      final movie =
          Movie(title: "title", year: "year", imdbId: "id", posterUrl: "url");
      final status = MovieStatus(id: "id", isFavorite: true, isWatched: true);
      final movieTileVM = MovieTileVM(movie, status);

      await mockNetworkImagesFor(() =>
          tester.pumpWidget(wrapWidget(MovieTile(movieTileVM: movieTileVM))));

      expect((tester.firstWidget(find.byIcon(Icons.favorite)) as Icon).color,
          Color(0xFFFF0000));
      expect((tester.firstWidget(find.byIcon(Icons.check)) as Icon).color,
          Color(0xFFFF0000));
    });
  });
}
