import '../repositories/movie_repository.dart';

class DeleteFavoritedMovie {
  final BaseMovieRepository baseMovieRepository;
  DeleteFavoritedMovie(this.baseMovieRepository);

  excute(String key) {
    baseMovieRepository.deleteMovieToFavorite(key);
  }
}