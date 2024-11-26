import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/constants/local_constants.dart';
import 'features/movie/data/datasources/movie_local_datasource.dart';
import 'features/movie/data/datasources/movie_remote_datasource.dart';
import 'features/movie/data/repositories/movie_repository_implemtation.dart';
import 'features/movie/domain/entities/movie.dart';
import 'features/movie/domain/entities/movie_detail.dart';
import 'features/movie/domain/repositories/movie_repository.dart';
import 'features/movie/domain/usecases/add_movie_to_favorite.dart';
import 'features/movie/domain/usecases/delete_favorited_movie.dart';
import 'features/movie/domain/usecases/get_movie_detail.dart';
import 'features/movie/domain/usecases/get_movie_favorited.dart';
import 'features/movie/domain/usecases/get_movie_now_playing.dart';
import 'features/movie/domain/usecases/get_movie_upcoming.dart';
import 'features/movie/domain/usecases/get_single_movie_favorited.dart';
import 'features/movie/presentation/bloc/movie_bloc.dart';

var movieInjection = GetIt.instance;

Future<void> init() async {
  Hive.registerAdapter(MovieAdapter());
  Hive.registerAdapter(MovieDetailAdapter());

  await Hive.openBox(LocalConstants.favoritedMovieBox);
  var box = await Hive.openBox(LocalConstants.movieBox);

  //BOX
  movieInjection.registerLazySingleton(
    () => box
  );
  //NETWORK CLIENT
  movieInjection.registerLazySingleton(
    () => Dio()
  );

  // FEATURE - MOVIE
  //BLOC
  movieInjection.registerFactory(
    () => MovieBloc(
      getMovieNowPlaying: movieInjection(),
      getMovieUpcoming: movieInjection(),
      getMovieDetail: movieInjection(), 
      addMovieToFavorite: movieInjection(), 
      getFavoritedMovies: movieInjection(),
      getSingleMovieFavorited: movieInjection(),
      deleteFavoritedMovie: movieInjection()
    )
  );

  //USECASES
  movieInjection.registerLazySingleton(
    () => GetMovieNowPlaying(
      movieInjection()
    )
  );
  movieInjection.registerLazySingleton(
    () => GetMovieUpcoming(
      movieInjection()
    )
  );
  movieInjection.registerLazySingleton(
    () => GetMovieDetail(
      movieInjection()
    )
  );
  movieInjection.registerLazySingleton(
    () => AddMovieToFavorite(
      movieInjection()
    )
  );
  movieInjection.registerLazySingleton(
    () => GetMovieFavorited(
      movieInjection()
    )
  );
  movieInjection.registerLazySingleton(
    () => GetSingleMovieFavorited(
      movieInjection()
    )
  );
  movieInjection.registerLazySingleton(
    () => DeleteFavoritedMovie(
      movieInjection()
    )
  );

  //REPOSITORY
  movieInjection.registerLazySingleton<BaseMovieRepository>(
    () => MovieRepositoryImplemtation(
      baseMovieRemoteDatasource: movieInjection(),
      baseMovieLocalDataSource: movieInjection(), 
      box: movieInjection()
    )
  );

  //DATA SOURCE
  movieInjection.registerLazySingleton<BaseMovieLocalDatasource>(
    () => MovieLocalDataSourceImplementation(
      box: movieInjection(),
    )
  );
  movieInjection.registerLazySingleton<BaseMovieRemoteDatasource>(
    () => MovieRemoteDataSourceImplementation(
      client: movieInjection()
    )
  );
}