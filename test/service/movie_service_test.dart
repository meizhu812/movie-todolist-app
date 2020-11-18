import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:movie_todolist/service/dto/Movie.dart';
import 'package:movie_todolist/service/movie_service.dart';

class MockClient extends Mock implements http.Client {}

main() {
  group('fetchMovies', () {
    final mockClient = MockClient();
    final mockService = MovieService(mockClient);

    test('returns a List of Movies if success', () async {
      final mockJsonString =
          '{"Search":[{"Title":"Batman Begins","Year":"2005","imdbID":"tt0372784","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"},{"Title":"Batman Returns","Year":"1992","imdbID":"tt0103776","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BOGZmYzVkMmItM2NiOS00MDI3LWI4ZWQtMTg0YWZkODRkMmViXkEyXkFqcGdeQXVyODY0NzcxNw@@._V1_SX300.jpg"},{"Title":"Batman: The Dark Knight Returns, Part 1","Year":"2012","imdbID":"tt2313197","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMzIxMDkxNDM2M15BMl5BanBnXkFtZTcwMDA5ODY1OQ@@._V1_SX300.jpg"}]}';
      when(mockClient.get("http://www.omdbapi.com/?s=Batman&apikey=$API_KEY"))
          .thenAnswer((_) async => http.Response(mockJsonString, 200));

      expect(await mockService.fetchMovies("Batman"), isA<List<Movie>>());
    });

    test('throws an exception if error happens', () {
      when(mockClient
              .get("http://www.omdbapi.com/?s=ThreeBody&apikey=$API_KEY"))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(mockService.fetchMovies("ThreeBody"), throwsException);
    });
  });
}
