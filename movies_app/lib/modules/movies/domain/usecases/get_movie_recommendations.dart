import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movie_repository.dart';

class GetMovieRecommendationsUseCase{
  final BaseMovieRepository baseMovieRepository;

  GetMovieRecommendationsUseCase({required this.baseMovieRepository});

  Future<Either<Failure,List<MovieRecommendation>>> call(int movieId)async{
    return await baseMovieRepository.getMovieRecommendations(movieId);
  }
 }