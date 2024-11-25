import 'package:fadhli_test_flutter/features/movie/domain/entities/movie.dart';
import 'package:fadhli_test_flutter/features/movie/domain/repositories/movie_repository.dart';

class GetSingleMovieFavorited {
  final BaseMovieRepository baseMovieRepository;
  const GetSingleMovieFavorited(this.baseMovieRepository);
  
  Movie execute(String key) {
    return baseMovieRepository.getSingleMovieFavorited(key);
  }
}