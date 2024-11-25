import 'package:fadhli_test_flutter/features/movie/data/datasources/movie_remote_datasource.dart';
import 'package:fadhli_test_flutter/features/movie/data/models/movie_detail_model.dart';
import 'package:fadhli_test_flutter/features/movie/data/models/movie_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([
  MockSpec<BaseMovieRemoteDatasource>(),
])
import 'movie_remote_datasource_test.mocks.dart';


void main() async {
  // Create mock object.
  var remoteDataSource = MockBaseMovieRemoteDatasource();

  const movieId = 1;
  const page = 1;

  MovieDetailModel fakeMovieDetailModel = const MovieDetailModel(
    id: movieId,
    adult: false,
    backdropPath: 'backdropPath',
    posterPath: 'posterPath',
    budget: 3000,
    originalLanguage: 'originalLanguage',
    overview: 'overview',
    popularity: 900,
    releaseDate: 'releaseDate',
    revenue: 9394,
    status: 'status',
    tagline: 'tagline',
    title: 'title',
    voteAverage: 8.3,
    voteCount: 237,
  );

  List<MovieModel> fakeListMovie = const [
    MovieModel(
      adult: false,
      backdropPath: 'backdropPath',
      id: 1,
      originalLanguage: 'originalLanguage',
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 90,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      title: 'title',
      video: false,
      voteAverage: 5.4,
      voteCount: 234
    )
  ];

  group('Base Movie Remote Data Source', () {
    group('getMovieDetail()', () {
      test('BERHASIL', () async {
        when(remoteDataSource.getMovieDetail(1)).thenAnswer((_) async => fakeMovieDetailModel);

        try {
          var response = await remoteDataSource.getMovieDetail(movieId);
          expect(response, fakeMovieDetailModel);
        } catch (e) {
          fail('FAIL NOT IMPOSIBLE');
        }
      });
      test('GAGAL', () async {
        when(remoteDataSource.getMovieDetail(1)).thenThrow(Exception());

        try {
          await remoteDataSource.getMovieDetail(movieId);
          fail('FAIL NOT IMPOSIBLE');
        } catch (e) {
          expect(e, isException);
        }
      });
    });

    group('getNowPlaying()', () {
      test('BERHASIL', () async {
        when(remoteDataSource.getMovieNowPlaying(page)).thenAnswer((_) async => fakeListMovie);

        try {
          var response = await remoteDataSource.getMovieNowPlaying(page);
          expect(response, fakeListMovie);
        } catch (e) {
          fail('FAIL NOT IMPOSIBLE');
        }
      });
      test('GAGAL', () async {
        when(remoteDataSource.getMovieNowPlaying(1)).thenThrow(Exception());

        try {
          await remoteDataSource.getMovieNowPlaying(page);
          fail('FAIL NOT IMPOSIBLE');
        } catch (e) {
          expect(e, isException);
        }
      });
    });

    group('getUpcoming()', () {
      test('BERHASIL', () async {
        when(remoteDataSource.getMovieUpcaming(page)).thenAnswer((_) async => fakeListMovie);

        try {
          var response = await remoteDataSource.getMovieUpcaming(page);
          expect(response, fakeListMovie);
        } catch (e) {
          fail('FAIL NOT IMPOSIBLE');
        }
      });
      test('GAGAL', () async {
        when(remoteDataSource.getMovieUpcaming(1)).thenThrow(Exception());

        try {
          await remoteDataSource.getMovieUpcaming(page);
          fail('FAIL NOT IMPOSIBLE');
        } catch (e) {
          expect(e, isException);
        }
      });
    });
  });
}