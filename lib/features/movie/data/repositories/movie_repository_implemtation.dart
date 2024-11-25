import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constants/local_constants.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_local_datasource.dart';
import '../datasources/movie_remote_datasource.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';

class MovieRepositoryImplemtation extends BaseMovieRepository {

  final BaseMovieRemoteDatasource baseMovieRemoteDatasource;
  final BaseMovieLocalDatasource baseMovieLocalDataSource;
  final Box box;

  MovieRepositoryImplemtation({
    required this.baseMovieRemoteDatasource,
    required this.baseMovieLocalDataSource,
    required this.box
  });

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(int movieId) async {
    final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

    try {
      if (connectivityResult.contains(ConnectivityResult.none)) {
        MovieDetailModel movieDetail = await baseMovieLocalDataSource.getMovieDetail(movieId);
        return Right(movieDetail);
      } else {
        MovieDetailModel movieDetail = await baseMovieRemoteDatasource.getMovieDetail(movieId);
        
        box.put(LocalConstants.movieDetalBoxField, movieDetail);

        return Right(movieDetail);
      }      
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovieNowPlaying(int page) async {
    final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

    try {
      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<MovieModel> nowPlaying = await baseMovieLocalDataSource.getMovieNowPlaying(page);
        return Right(nowPlaying);
      } else {
        List<MovieModel> nowPlaying = await baseMovieRemoteDatasource.getMovieNowPlaying(page);
        box.put(LocalConstants.nowPlayingBoxField, nowPlaying);

        return Right(nowPlaying);
      }
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovieUpcaming(int page) async {
    final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

    try {
      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<MovieModel> upcoming = await baseMovieLocalDataSource.getMovieUpcaming(page);
        return Right(upcoming);
      } else {
        List<MovieModel> upcoming = await baseMovieRemoteDatasource.getMovieUpcaming(page);
        
        box.put(LocalConstants.upcomingBoxField, upcoming);

        return Right(upcoming);
      }
    } catch (e) {
      return Left(Failure());
    }
  }

}