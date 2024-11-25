import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie_detail.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetail {
  final BaseMovieRepository baseMovieRepository;

  const GetMovieDetail(this.baseMovieRepository);

  Future<Either<Failure, MovieDetail>> execute(int movieId) async {
    return await baseMovieRepository.getMovieDetail(movieId);
  }

}