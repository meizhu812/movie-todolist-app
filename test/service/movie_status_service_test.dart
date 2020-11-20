import 'dart:io';

import 'package:flutter_test/flutter_test.dart' show TestWidgetsFlutterBinding;
import 'package:movie_todolist/service/model/movie_status.dart';
import 'package:movie_todolist/service/movie_status_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart' show equals, expect, group, isA, isFalse, isTrue, test;

main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues(
      {"movie_status": await (File('res/mockStatus.json')).readAsString()});
  final movieStatusService = MovieStatusService();

  group('fetchMovieStatus', () {
    test('returns a Map of MovieStatus if success', () async {
      await movieStatusService.fetchMovieStatus();

      expect(
          movieStatusService.movieStatusMap,
          isA<Map<String, MovieStatus>>()
              .having((map) => map.entries.length, "length", equals(4)));
    });
  });

  group("getMovieStatusById", () {
    test('return data if id exists', () async {
      await movieStatusService.fetchMovieStatus();
      final movieStatus = movieStatusService.getMovieStatusById("tt3748528");
      expect(movieStatus.isFavorite, isTrue);
      expect(movieStatus.isWatched, isTrue);
    });

    test('return default if id does not exist', () async {
      await movieStatusService.fetchMovieStatus();
      final movieStatus = movieStatusService.getMovieStatusById("not exist");
      expect(movieStatus.isFavorite, isFalse);
      expect(movieStatus.isWatched, isFalse);
    });
  });
}
