import 'package:dio/dio.dart';
import 'core/constants/local_constants.dart';
import 'features/movie/data/datasources/movie_local_datasource.dart';
import 'features/movie/data/datasources/movie_remote_datasource.dart';
import 'features/movie/data/repositories/movie_repository_implemtation.dart';
import 'features/movie/domain/entities/movie.dart';
import 'features/movie/domain/entities/movie_detail.dart';
import 'features/movie/domain/repositories/movie_repository.dart';
import 'features/movie/domain/usecases/get_movie_detail.dart';
import 'features/movie/domain/usecases/get_movie_now_playing.dart';
import 'features/movie/domain/usecases/get_movie_upcoming.dart';
import 'features/movie/presentation/bloc/movie_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

var movieInjection = GetIt.instance;

Future<void> init() async {
  Hive.registerAdapter(MovieAdapter());
  Hive.registerAdapter(MovieDetailAdapter());

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
      box: movieInjection()
    )
  );
  movieInjection.registerLazySingleton<BaseMovieRemoteDatasource>(
    () => MovieRemoteDataSourceImplementation(
      client: movieInjection()
    )
  );
}