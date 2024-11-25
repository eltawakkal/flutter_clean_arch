import 'package:equatable/equatable.dart';

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