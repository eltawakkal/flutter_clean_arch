import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exeption.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';

abstract class BaseMovieRemoteDatasource {
  Future<List<MovieModel>> getMovieNowPlaying(int page);
  Future<List<MovieModel>> getMovieUpcaming(int page);
  Future<MovieDetailModel> getMovieDetail(int movieId);
}

class MovieRemoteDataSourceImplementation extends BaseMovieRemoteDatasource {
  final Dio client;

  MovieRemoteDataSourceImplementation({required this.client});

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    
    final response = await client.get(ApiConstants.getMovieDetailsUrl(movieId));

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else if (response.statusCode == 404) {
      throw const EmptyExeption(message: 'Data not found');
    } else {
      throw const GeneralExeption(message: 'connection failure');
    }
  }

  @override
  Future<List<MovieModel>> getMovieNowPlaying(int page) async {
    final response = await client.get(ApiConstants.getNowPlayingUrl(page));

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['results'];
      return MovieModel.fromJsonList(data);
    } else if (response.statusCode == 404) {
      throw const EmptyExeption(message: 'Data not found');
    } else {
      throw const GeneralExeption(message: 'connection failure');
    }
  }

  @override
  Future<List<MovieModel>> getMovieUpcaming(int page) async {
    final response = await client.get(ApiConstants.getUpcomingUrl(page));
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['results'];
      return MovieModel.fromJsonList(data);
    } else if (response.statusCode == 404) {
      throw const EmptyExeption(message: 'Data not found');
    } else {
      throw const GeneralExeption(message: 'connection failure');
    }
  }
  
}