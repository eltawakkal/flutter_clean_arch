import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovieFavorited {
  final BaseMovieRepository baseMovieRepository;
  
  const GetMovieFavorited(this.baseMovieRepository);

  Future<List<Movie>> execute() async {
    return baseMovieRepository.getMovieFavorited();
  }
}