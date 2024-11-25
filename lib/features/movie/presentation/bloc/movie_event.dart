import 'package:equatable/equatable.dart';
import 'package:fadhli_test_flutter/features/movie/domain/entities/movie.dart';

abstract class BaseMovieEvent extends Equatable{}

class MovieEventGetNowPlaying extends BaseMovieEvent {
  final int page;
  MovieEventGetNowPlaying(this.page);
  
  @override
  List<Object?> get props => [page];
}

class MovieEventGetUpcoming extends BaseMovieEvent {
  final int page;
  MovieEventGetUpcoming(this.page);
  
  @override
  List<Object?> get props => [page];
}

class MovieEventGetDatail extends BaseMovieEvent {
  final int movieId;
  MovieEventGetDatail(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class MovieEventAddToFavorite extends BaseMovieEvent {
  final Movie movie;
  MovieEventAddToFavorite(this.movie);
  
  @override
  List<Object?> get props => [movie];
}

class MovieEventGetFavoritedMovies extends BaseMovieEvent {
  @override
  List<Object?> get props => [];
}

class MovieEventGetSingleFavoritedMovies extends BaseMovieEvent {
  final String key;
  MovieEventGetSingleFavoritedMovies(this.key);
  
  @override
  List<Object?> get props => [];
}