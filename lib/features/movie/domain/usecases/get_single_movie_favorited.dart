import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetSingleMovieFavorited {
  final BaseMovieRepository baseMovieRepository;
  const GetSingleMovieFavorited(this.baseMovieRepository);
  
  Either<Failure, Movie> execute(String key) {
    return baseMovieRepository.getSingleMovieFavorited(key);
  }
}