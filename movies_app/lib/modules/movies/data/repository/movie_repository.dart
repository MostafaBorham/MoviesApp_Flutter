import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/modules/movies/data/datasources/movie_datasource.dart';
import 'package:movies_app/modules/movies/domain/entities/movie.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movie_repository.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieDataSource baseMovieDataSource;

  MovieRepository({required this.baseMovieDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await baseMovieDataSource.fetchNowPlayingMovies();
      return Right(result);
    } on ServerException catch (serverEx) {
      return Left(
          ServerFailure(message: serverEx.serverErrorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await baseMovieDataSource.fetchPopularMovies();
      return Right(result);
    } on ServerException catch (serverEx) {
      return Left(
          ServerFailure(message: serverEx.serverErrorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await baseMovieDataSource.fetchTopRatedMovies();
      return Right(result);
    } on ServerException catch (serverEx) {
      return Left(
          ServerFailure(message: serverEx.serverErrorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async {
    try {
      final result = await baseMovieDataSource.fetchMovieDetails(movieId);
      return Right(result);
    } on ServerException catch (serverEx) {
      return Left(
          ServerFailure(message: serverEx.serverErrorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendation>>> getMovieRecommendations(int movieId) async{
    try {
      final result = await baseMovieDataSource.fetchMovieRecommendations(movieId);
      return Right(result);
    } on ServerException catch (serverEx) {
      return Left(
          ServerFailure(message: serverEx.serverErrorModel.statusMessage));
    }
  }
}