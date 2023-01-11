import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/modules/movies/domain/entities/movie.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase({required this.baseMovieRepository});

  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}