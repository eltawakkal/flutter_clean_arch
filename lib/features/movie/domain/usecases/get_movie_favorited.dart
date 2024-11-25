import 'package:fadhli_test_flutter/features/movie/domain/entities/movie.dart';
import 'package:fadhli_test_flutter/features/movie/domain/repositories/movie_repository.dart';

class GetMovieFavorited {
  final BaseMovieRepository baseMovieRepository;
  
  const GetMovieFavorited(this.baseMovieRepository);

  Future<List<Movie>> execute() async {
    return baseMovieRepository.getMovieFavorited();
  }
}