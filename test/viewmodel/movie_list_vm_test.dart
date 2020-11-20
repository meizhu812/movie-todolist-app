import 'package:movie_todolist/viewmodel/movie_list_vm.dart';
import 'package:movie_todolist/viewmodel/movie_tile_vm.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_todolist/service/model/movie.dart';
import 'package:movie_todolist/service/movie_service.dart';

class MockService extends Mock implements MovieService {}

class MockMovie extends Mock implements Movie {}

main() {
  group('fetchMovies', () {
    final mockService = MockService();
    final vm = MovieListViewModel(mockService);

    test('stores a List of MovieViewModel if success', () async {
      final mockMovies = List.filled(4, MockMovie());
      when(mockService.fetchMovies("Batman"))
          .thenAnswer((_) async => mockMovies);

      await vm.fetchMovies("Batman");

      expect(
          vm.movies,
          isA<List<MovieTileVM>>()
              .having((movies) => movies.length, 'length', equals(4)));
    });
  });
}