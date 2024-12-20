import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/movie.dart';
import '../../../../core/error/exeption.dart';
import '../models/movie_detail_model.dart';
import '../../../../core/constants/local_constants.dart';
import '../models/movie_model.dart';

abstract class BaseMovieLocalDatasource {
  Future<List<MovieModel>> getMovieNowPlaying(int page);
  Future<List<MovieModel>> getMovieUpcaming(int page);
  Future<MovieDetailModel> getMovieDetail(int movieId);

  addMovieTofavorite(Movie movie);
  deleteFavoritedMovie(String key);
  Movie getSingleMovieFavorited(String key);
  List<Movie> getFavoritedMovies();
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
  
  @override
  List<Movie> getFavoritedMovies() {
    var box = Hive.box(LocalConstants.favoritedMovieBox);
    Map<dynamic, dynamic> response = box.toMap();
    List<Movie> favoriteData = [];
    response.forEach((key, value) {
      favoriteData.add(value);
    });
    return favoriteData;
  }
  
  @override
  addMovieTofavorite(Movie movie) {
    var box = Hive.box(LocalConstants.favoritedMovieBox);
    box.put(movie.id.toString(), movie);
  }
  
  @override
  Movie getSingleMovieFavorited(String key) {
    var box = Hive.box(LocalConstants.favoritedMovieBox);
    // print('data: ${box.get(key)}');
    Movie? movie = box.get(key);

    if (movie == null) {
      throw const EmptyExeption(message: 'No Data Found');
    } else {
      return movie;
    }
  }
  
  @override
  deleteFavoritedMovie(String key) {
    var box = Hive.box(LocalConstants.favoritedMovieBox);
    box.delete(key);
  }

}