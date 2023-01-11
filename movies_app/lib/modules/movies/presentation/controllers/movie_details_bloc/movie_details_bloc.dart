import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies_app/core/helpers/dependency_injection_helper.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_details_bloc/movie_details_event.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_details_bloc/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final getMovieDetailsUseCase =
      DependencyInjectionHelper.dihInstance<GetMovieDetailsUseCase>();
  final getMovieRecommendationsUseCase =
      DependencyInjectionHelper.dihInstance<GetMovieRecommendationsUseCase>();
  MovieDetailsBloc() : super(MovieDetailsInitialState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsState);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendationsState);
    on<GetAllMovieDetailsEvent>(_getAllMovieDetailsState);
  }

  FutureOr<void> _getMovieDetailsState(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(GetMovieDetailsLoadingState());
    await getMovieDetailsUseCase(event.movieId).then((movieDetailsResult) {
      movieDetailsResult.fold(
        (failure) => emit(GetMovieDetailsErrorState(failure: failure)),
        (details) => emit(GetMovieDetailsSuccessState(movieDetails: details)),
      );
    });
  }

  FutureOr<void> _getMovieRecommendationsState(
      GetMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    emit(GetMovieRecommendationsLoadingState());
    await getMovieRecommendationsUseCase(event.movieId)
        .then((movieRecommendationsResult) {
      movieRecommendationsResult.fold(
        (failure) => emit(GetMovieRecommendationsErrorState(failure: failure)),
        (recommendations) => emit(GetMovieRecommendationsSuccessState(
            movieRecommendations: recommendations)),
      );
    });
  }

  FutureOr<void> _getAllMovieDetailsState(GetAllMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async{
    add(GetMovieDetailsEvent(movieId: event.movieId));
    add(GetMovieRecommendationsEvent(movieId: event.movieId));
  }
}
