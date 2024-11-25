import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovieUpcoming {
  final BaseMovieRepository baseMovieRepository;

  const GetMovieUpcoming(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute(int page) async {
    return await baseMovieRepository.getMovieUpcaming(page);
  }
}