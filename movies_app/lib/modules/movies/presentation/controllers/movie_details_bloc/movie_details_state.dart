import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_recommendation.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsInitialState extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class GetMovieDetailsSuccessState extends MovieDetailsState {
  final MovieDetails movieDetails;

  const GetMovieDetailsSuccessState({required this.movieDetails});

  @override
  List<Object> get props => [movieDetails];
}

class GetMovieDetailsErrorState extends MovieDetailsState {
  final Failure failure;

  const GetMovieDetailsErrorState({required this.failure});

  @override
  List<Object> get props => [failure];
}

class GetMovieDetailsLoadingState extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class GetMovieRecommendationsSuccessState extends MovieDetailsState {
  final List<MovieRecommendation> movieRecommendations;

  const GetMovieRecommendationsSuccessState(
      {required this.movieRecommendations});

  @override
  List<Object> get props => [movieRecommendations];
}

class GetMovieRecommendationsErrorState extends MovieDetailsState {
  final Failure failure;

  const GetMovieRecommendationsErrorState({required this.failure});

  @override
  List<Object> get props => [failure];
}

class GetMovieRecommendationsLoadingState extends MovieDetailsState {
  @override
  List<Object> get props => [];
}