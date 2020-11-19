import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_todolist/service/dto/Movie.dart';
import 'package:movie_todolist/service/movie_service.dart';
import 'package:movie_todolist/widget/movie_list.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../test_util.dart';

class MockService extends Mock implements MovieService {}

class MockMovie extends Mock implements Movie {}

main() {
  group('render movie list', () {
    testWidgets('render empty list', (WidgetTester tester) async {
      await mockNetworkImagesFor(
          () => tester.pumpWidget(wrapWidget(MovieList(movies: []))));

      expect(find.byType(ListTile), findsNothing);
    });
    testWidgets('render filled list', (WidgetTester tester) async {
      final movies = [
        Movie(title: "Demo 1", year: "2001", posterUrl: "url1"),
        Movie(title: "Demo 2", year: "2002", posterUrl: "url2")
      ];

      await mockNetworkImagesFor(
          () => tester.pumpWidget(wrapWidget(MovieList(movies: movies))));

      expect(find.byType(ListTile), findsNWidgets(2));
    });
  });
}
