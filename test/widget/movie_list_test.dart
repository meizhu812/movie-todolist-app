import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_todolist/viewmodel/movie_tile_vm.dart';
import 'package:movie_todolist/service/model/movie.dart';
import 'package:movie_todolist/service/movie_service.dart';
import 'package:movie_todolist/widget/movie_list.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../test_util.dart';

class MockService extends Mock implements MovieService {}

class MockMovieTileVM extends Mock implements MovieTileVM {
  @override
  bool isFavorite = true;
  @override
  bool isWatched = false;

  @override
  String get title {
    return "title";
  }

  @override
  String get year {
    return "year";
  }

  @override
  String get posterUrl {
    return "url";
  }
}

main() {
  group('render movie list', () {
    testWidgets('render empty list', (WidgetTester tester) async {
      await mockNetworkImagesFor(
          () => tester.pumpWidget(wrapWidget(MovieList(movieVMs: []))));

      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('render filled list', (WidgetTester tester) async {
      final mockMovieVMs = List.filled(4, MockMovieTileVM());
      await mockNetworkImagesFor(() =>
          tester.pumpWidget(wrapWidget(MovieList(movieVMs: mockMovieVMs))));

      expect(find.byType(ListTile), findsNWidgets(4));
    });
  });
}
