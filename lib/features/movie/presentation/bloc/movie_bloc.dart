import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fadhli_test_flutter/features/movie/domain/usecases/get_single_movie_favorited.dart';
import 'movie_event.dart';
import 'movie_state.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecases/add_movie_to_favorite.dart';
import '../../domain/usecases/get_movie_favorited.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/usecases/get_movie_detail.dart';
import '../../domain/usecases/get_movie_now_playing.dart';
import '../../domain/usecases/get_movie_upcoming.dart';

class MovieBloc extends Bloc<BaseMovieEvent, BaseMovieState> {
  final GetMovieNowPlaying getMovieNowPlaying;
  final GetMovieUpcoming getMovieUpcoming;
  final GetMovieDetail getMovieDetail;
  final AddMovieToFavorite addMovieToFavorite;
  final GetMovieFavorited getFavoritedMovies;
  final GetSingleMovieFavorited getSingleMovieFavorited;


  MovieBloc({
    required this.getMovieNowPlaying,
    required this.getMovieUpcoming,
    required this.getMovieDetail,
    required this.addMovieToFavorite,
    required this.getFavoritedMovies,
    required this.getSingleMovieFavorited
  }) : super(MovieStateEmpty()) {
    on<MovieEventGetNowPlaying>((event, emit) async {
      emit(MovieStateLoading());

      Either<Failure, List<Movie>> responseResult = await getMovieNowPlaying.execute(event.page);

      responseResult.fold((leftResponseResult) {
        emit(MovieStateError('Cannot get movies'));
      }, (rightResponseResult) {
        emit(MovieStateLoadedMovieList(rightResponseResult));
      });
    });
    on<MovieEventGetUpcoming>((event, emit) async {
      emit(MovieStateLoading());

      Either<Failure, List<Movie>> responseResult = await getMovieUpcoming.execute(event.page);

      responseResult.fold((leftResponseResult) {
        emit(MovieStateError('Cannot get movies'));
      }, (rightResponseResult) {
        emit(MovieStateLoadedMovieList(rightResponseResult));
      });
    });
    on<MovieEventGetDatail>((event, emit) async {
      emit(MovieStateLoading());

      Either<Failure, MovieDetail> responseResult = await getMovieDetail.execute(event.movieId);

      responseResult.fold((leftResponseResult) {
        emit(MovieStateError('Cannot get movies'));
      }, (rightResponseResult) {
        emit(MovieStateLoadedMovieDetail(rightResponseResult));
      });
    });
    on<MovieEventGetFavoritedMovies>((event, emit) async {
      emit(MovieStateLoading());

      var movieResults = await getFavoritedMovies.execute();
      
      emit(MovieStateLoadedMovieFromFavorite(movieResults));
    });
    on<MovieEventAddToFavorite>((event, emit) async {
      await addMovieToFavorite.execute(event.movie);
    });
    on<MovieEventGetSingleFavoritedMovies>((event, emit) => getSingleMovieFavorited.execute(event.key));
  }
}