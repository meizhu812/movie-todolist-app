import 'dart:io';

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:movie_todolist/service/model/movie.dart';
import 'package:movie_todolist/service/movie_service.dart';

class MockClient extends Mock implements http.Client {}

main() {
  group('fetchMovies', () {
    final mockClient = MockClient();
    final mockService = MovieService(mockClient);

    test('returns response if success', () async {
      when(mockClient.get(any)).thenAnswer((_) async => http.Response("", 200));

      expect(await mockService.fetchMovies("Batman"), isA<http.Response>());
    });

    test('throws an exception if error happens', () {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(mockService.fetchMovies("ThreeBody"), throwsException);
    });
  });
}
