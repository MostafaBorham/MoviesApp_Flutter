import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/helpers/dependency_injection_helper.dart';
import 'package:movies_app/modules/movies/domain/entities/movie.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_top_rated_movies.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  /////////////////////////////Variables
  final getNowPlayingMoviesUseCase =
      DependencyInjectionHelper.dihInstance<GetNowPlayingMoviesUseCase>();
  final getPopularMoviesUseCase =
      DependencyInjectionHelper.dihInstance<GetPopularMoviesUseCase>();
  final getTopRatedMoviesUseCase =
      DependencyInjectionHelper.dihInstance<GetTopRatedMoviesUseCase>();
  /////////////////////////////Constructor & Events
  MovieBloc() : super(MovieInitialState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMoviesState);
    on<GetPopularMoviesEvent>(_getPopularMoviesState);
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesState);
    on<GetAllMoviesEvent>(_getAllMoviesState);
  }
  ////////////////////////////Methods
  Future<void> _getNowPlayingMoviesState(event, emit) async {
      await getNowPlayingMoviesUseCase().then((nowPlayingResult) {
        nowPlayingResult.fold((failure) {
          emit(GetNowPlayingMoviesErrorState(failure: failure));
        }, (nowPlayingMovies) {
          emit(GetNowPlayingMoviesState(movies: nowPlayingMovies));
        });
      });
  }

  Future<void> _getPopularMoviesState(event, emit) async {
    await getPopularMoviesUseCase().then((popularResult) {
      popularResult.fold((failure) {
        emit(GetPopularMoviesErrorState(failure: failure));
      }, (popularMovies) {
        emit(GetPopularMoviesState(movies: popularMovies));
      });
    });
  }

  Future<void> _getTopRatedMoviesState(event, emit) async {
    await getTopRatedMoviesUseCase().then((topRatedResult) {
      topRatedResult.fold((failure) {
        emit(GetTopRatedMoviesErrorState(failure: failure));
      }, (topRatedMovies) {
        emit(GetTopRatedMoviesState(movies: topRatedMovies));
      });
    });
  }

  Future<void> _getAllMoviesState(event, emit) async {
    emit(GetAllMoviesLoadingState());
    add(GetNowPlayingMoviesEvent());
    add(GetPopularMoviesEvent());
    add(GetTopRatedMoviesEvent());
  }
}