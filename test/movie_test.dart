
// import 'package:fadhli_test_flutter/features/movie/data/datasources/movie_remote_datasource.dart';

import 'package:dio/dio.dart';
import 'package:fadhli_test_flutter/features/movie/data/datasources/movie_remote_datasource.dart';

void main() async {
  final MovieRemoteDataSourceImplementation movieRemoteDatasourceImplementation = MovieRemoteDataSourceImplementation(
    client: Dio()
  );


  try {
    var responseNowPlaying = await movieRemoteDatasourceImplementation.getMovieNowPlaying(1);
    print('GEETTING NOW PLAYING====================');
    for (var element in responseNowPlaying) {
      print(element.posterPath);
    }
  } catch (e) {
    print(e);
  }

  var responseUpcoming = await movieRemoteDatasourceImplementation.getMovieUpcaming(1);
  var responseDetailMovie = await movieRemoteDatasourceImplementation.getMovieDetail(1034541);

  print('GEETTING UPCOMING====================');
  for (var element in responseUpcoming) {
    print(element.posterPath);
  }

  print('GETTING DETAIL MOVIE====================');
  print(responseDetailMovie.posterPath);
  print(responseDetailMovie.originalLanguage);
}