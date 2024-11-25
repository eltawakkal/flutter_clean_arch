import 'package:hive_flutter/hive_flutter.dart';

import '../models/movie_detail_model.dart';
import '../../../../core/constants/local_constants.dart';
import '../models/movie_model.dart';

abstract class BaseMovieLocalDatasource {
  Future<List<MovieModel>> getMovieNowPlaying(int page);
  Future<List<MovieModel>> getMovieUpcaming(int page);
  Future<MovieDetailModel> getMovieDetail(int movieId);
}

class MovieLocalDataSourceImplementation extends BaseMovieLocalDatasource {
  final Box box;

  MovieLocalDataSourceImplementation({required this.box});

  @override
  Future<List<MovieModel>> getMovieNowPlaying(int page) {
    return box.get(LocalConstants.nowPlayingBoxField);
  }

  @override
  Future<List<MovieModel>> getMovieUpcaming(int page) {
    return box.get(LocalConstants.upcomingBoxField);
  }
  
  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) {
    return box.get(LocalConstants.movieDetalBoxField);
  }

}