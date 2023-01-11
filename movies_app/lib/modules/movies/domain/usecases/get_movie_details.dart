import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase({required this.baseMovieRepository});

  Future<Either<Failure, MovieDetails>> call(int movieId) async {
    return await baseMovieRepository.getMovieDetails(movieId);
  }
}
