part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class GetNowPlayingMoviesEvent extends MovieEvent{
  @override
  List<Object?> get props => [];
}

class GetPopularMoviesEvent extends MovieEvent{
  @override
  List<Object?> get props => [];
}

class GetTopRatedMoviesEvent extends MovieEvent{
  @override
  List<Object?> get props => [];
}

class GetAllMoviesEvent extends MovieEvent{
  @override
  List<Object?> get props => [];
}