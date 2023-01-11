part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitialState extends MovieState {
  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesState extends MovieState {
  final List<Movie> movies;

  const GetNowPlayingMoviesState({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class GetPopularMoviesState extends MovieState {
  final List<Movie> movies;

  const GetPopularMoviesState({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class GetTopRatedMoviesState extends MovieState {
  final List<Movie> movies;

  const GetTopRatedMoviesState({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class GetNowPlayingMoviesErrorState extends MovieState {
  final Failure failure;

  const GetNowPlayingMoviesErrorState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class GetPopularMoviesErrorState extends MovieState {
  final Failure failure;

  const GetPopularMoviesErrorState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class GetTopRatedMoviesErrorState extends MovieState {
  final Failure failure;

  const GetTopRatedMoviesErrorState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class GetAllMoviesLoadingState extends MovieState {
  @override
  List<Object?> get props => [];
}
