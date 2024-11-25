import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovieNowPlaying {
  final BaseMovieRepository baseMovieRepository;

  const GetMovieNowPlaying(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute(int page) async {
    var result = await baseMovieRepository.getMovieNowPlaying(page);
    return result;
  }

}