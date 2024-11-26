import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class AddMovieToFavorite {
  final BaseMovieRepository baseMovieRepository;

  const AddMovieToFavorite(this.baseMovieRepository);

  execute(Movie movie) {
    baseMovieRepository.addMovieToFavorite(movie);
  }
}