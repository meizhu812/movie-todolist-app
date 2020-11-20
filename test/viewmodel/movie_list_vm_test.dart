import 'dart:io';

import 'package:http/http.dart';
import 'package:movie_todolist/service/model/movie_status.dart';
import 'package:movie_todolist/service/movie_status_service.dart';
import 'package:movie_todolist/viewmodel/movie_list_vm.dart';
import 'package:movie_todolist/viewmodel/movie_tile_vm.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_todolist/service/model/movie.dart';
import 'package:movie_todolist/service/movie_service.dart';

class MockMovieService extends Mock implements MovieService {}

class MockStatusService extends Mock implements MovieStatusService {}

class MockMovie extends Mock implements Movie {}

main() {
  group('fetchMovies', () {
    final mockMovieService = MockMovieService();
    final mockStatusService = MockStatusService();
    final vm = MovieListViewModel(mockMovieService, mockStatusService);

    test('stores a List of MovieViewModel', () async {
      final mockResString =
          await (File('res/mockResponse.json')).readAsString();

      when(mockMovieService.fetchMovies(any))
          .thenAnswer((_) async => Response(mockResString, 200));
      when(mockStatusService.getMovieStatusById(any))
          .thenReturn(MovieStatus(isFavorite: true, isWatched: false));

      await vm.fetchMovies("keyword");

      expect(
          vm.movies,
          isA<List<MovieTileVM>>()
              .having((list) => list.length, 'length', equals(10))
              .having((list) => list.map((movieVM) => movieVM.isFavorite),
                  'is favorite', everyElement(isTrue))
              .having((list) => list.map((movieVM) => movieVM.isWatched),
                  'is not watched', everyElement(isFalse)));
    });
  });
}
