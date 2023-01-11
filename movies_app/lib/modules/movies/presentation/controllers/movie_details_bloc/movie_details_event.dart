import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class GetMovieRecommendationsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieRecommendationsEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class GetAllMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetAllMovieDetailsEvent({required this.movieId});
  @override
  List<Object> get props => [movieId];
}