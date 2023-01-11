import 'package:get_it/get_it.dart';
import 'package:movies_app/core/controllers/app_bloc.dart';
import 'package:movies_app/modules/movies/data/datasources/movie_datasource.dart';
import 'package:movies_app/modules/movies/data/repository/movie_repository.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_bloc/movie_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';

abstract class DependencyInjectionHelper{
  static final dihInstance=GetIt.instance;

  static void init(){
    ///DataSources
    dihInstance.registerLazySingleton<BaseMovieDataSource>(() => MovieDataSourceApi());

    ///Repositories
    dihInstance.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(baseMovieDataSource: dihInstance()));

    ///UseCases
    dihInstance.registerLazySingleton<GetNowPlayingMoviesUseCase>(() => GetNowPlayingMoviesUseCase(baseMovieRepository: dihInstance()));
    dihInstance.registerLazySingleton<GetPopularMoviesUseCase>(() => GetPopularMoviesUseCase(baseMovieRepository: dihInstance()));
    dihInstance.registerLazySingleton<GetTopRatedMoviesUseCase>(() => GetTopRatedMoviesUseCase(baseMovieRepository: dihInstance()));
    dihInstance.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(baseMovieRepository: dihInstance()));
    dihInstance.registerLazySingleton<GetMovieRecommendationsUseCase>(() => GetMovieRecommendationsUseCase(baseMovieRepository: dihInstance()));

    ///Blocs
    dihInstance.registerLazySingleton<MovieBloc>(() => MovieBloc());
    dihInstance.registerLazySingleton<MovieDetailsBloc>(() => MovieDetailsBloc());
    dihInstance.registerLazySingleton<AppBloc>(() => AppBloc());
  }
}