import 'package:equatable/equatable.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';

abstract class BaseMovieState extends Equatable {}

class MovieStateEmpty extends BaseMovieState {
  @override
  List<Object?> get props => [];
}

class MovieStateLoading extends BaseMovieState {
  @override
  List<Object?> get props => [];
}

class MovieStateError extends BaseMovieState {
  final String message;
  MovieStateError(this.message);

  @override
  List<Object?> get props => [];
}

class MovieStateLoadedMovieList extends BaseMovieState {
  final List<Movie> movies;
  MovieStateLoadedMovieList(this.movies);

  @override
  List<Object?> get props => [movies];
}

class MovieStateLoadedMovieDetail extends BaseMovieState {
  final MovieDetail movie;
  MovieStateLoadedMovieDetail(this.movie);

  @override
  List<Object?> get props => [movie];
}