import 'package:fadhli_test_flutter/features/movie/domain/entities/movie.dart';
import 'package:fadhli_test_flutter/features/movie/domain/repositories/movie_repository.dart';

class AddMovieToFavorite {
  final BaseMovieRepository baseMovieRepository;

  const AddMovieToFavorite(this.baseMovieRepository);

  execute(Movie movie) {
    baseMovieRepository.addMovieToFavorite(movie);
  }
}