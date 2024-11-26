import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_detail.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getMovieNowPlaying(int page);
  Future<Either<Failure, List<Movie>>> getMovieUpcaming(int page);
  Future<Either<Failure, MovieDetail>> getMovieDetail(int movieId);

  addMovieToFavorite(Movie movie);
  deleteMovieToFavorite(String key);
  Either<Failure, Movie> getSingleMovieFavorited(String key);
  List<Movie> getMovieFavorited();
}