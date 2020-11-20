import 'dart:io';

import 'package:movie_todolist/service/model/movie_status.dart';
import 'package:movie_todolist/service/movie_status_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

main() {
  group('fetch movie status', () {
    final movieStatusService = MovieStatusService();

    test('returns a List of MovieStatus if success', () async {
      SharedPreferences.setMockInitialValues(
          {"movie_status": await (File('res/mockStatus.json')).readAsString()});

      await movieStatusService.fetchMovieStatus();

      expect(
          movieStatusService.movieStatusMap,
          isA<Map<String, MovieStatus>>()
              .having((map) => map.entries.length, "length", equals(4)));
    });
  });
}
