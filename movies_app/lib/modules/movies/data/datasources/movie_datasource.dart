import 'package:movies_app/core/errors/error_models.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/helpers/dio_helper.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/modules/movies/data/models/movie_details_model.dart';
import 'package:movies_app/modules/movies/data/models/movie_model.dart';
import 'package:movies_app/modules/movies/data/models/movie_recommendation_model.dart';
import 'package:movies_app/modules/movies/domain/entities/genre.dart';

abstract class BaseMovieDataSource {
  Future<List<MovieModel>> fetchNowPlayingMovies();
  Future<List<MovieModel>> fetchPopularMovies();
  Future<List<MovieModel>> fetchTopRatedMovies();
  Future<MovieDetailsModel> fetchMovieDetails(int movieId);
  Future<List<MovieRecommendationModel>> fetchMovieRecommendations(int movieId);
}

class MovieDataSourceApi extends BaseMovieDataSource {
  @override
  Future<List<MovieModel>> fetchNowPlayingMovies() async {
    final response =
        await DioHelper.get(url: NetworkConstants.nowPlayingMoviesPath);
    if (response.statusCode == NetworkConstants.successNetworkStatusCode) {
      return List<MovieModel>.from(response.data['results']
          .map((movieMap) => MovieModel.fromJson(movieMap)));
    } else {
      final serverError = ServerErrorModel.fromJson(response.data);
      throw ServerException(serverErrorModel: serverError);
    }
  }

  @override
  Future<List<MovieModel>> fetchPopularMovies() async {
    final response =
        await DioHelper.get(url: NetworkConstants.popularMoviesPath);
    if (response.statusCode == NetworkConstants.successNetworkStatusCode) {
      return List<MovieModel>.from(response.data['results']
          .map((movieMap) => MovieModel.fromJson(movieMap)));
    } else {
      final serverError = ServerErrorModel.fromJson(response.data);
      throw ServerException(serverErrorModel: serverError);
    }
  }

  @override
  Future<List<MovieModel>> fetchTopRatedMovies() async {
    final response =
        await DioHelper.get(url: NetworkConstants.topRatedMoviesPath);
    if (response.statusCode == NetworkConstants.successNetworkStatusCode) {
      return List<MovieModel>.from(response.data['results']
          .map((movieMap) => MovieModel.fromJson(movieMap)));
    } else {
      final serverError = ServerErrorModel.fromJson(response.data);
      throw ServerException(serverErrorModel: serverError);
    }
  }

  @override
  Future<MovieDetailsModel> fetchMovieDetails(int movieId) async {
    final response =
        await DioHelper.get(url: NetworkConstants.getMovieDetailsPath(movieId));
    if (response.statusCode == NetworkConstants.successNetworkStatusCode) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      final serverError = ServerErrorModel.fromJson(response.data);
      throw (ServerException(serverErrorModel: serverError));
    }
  }

  @override
  Future<List<MovieRecommendationModel>> fetchMovieRecommendations(
      int movieId) async {
    final response = await DioHelper.get(
        url: NetworkConstants.getMovieRecommendationsPath(movieId));
    if (response.statusCode == NetworkConstants.successNetworkStatusCode) {
      return List<MovieRecommendationModel>.from(response.data['results'].map<MovieRecommendationModel>(
          (movieRecommendationMap) =>
              MovieRecommendationModel.fromJson(movieRecommendationMap)));
    } else {
      final serverError = ServerErrorModel.fromJson(response.data);
      throw (ServerException(serverErrorModel: serverError));
    }
  }
}

class MovieDataSourceDummy extends BaseMovieDataSource {
  @override
  Future<List<MovieModel>> fetchNowPlayingMovies() async {
    return await Future.value([
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
    ]);
  }

  @override
  Future<List<MovieModel>> fetchPopularMovies() async {
    return await Future.value([
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
    ]);
  }

  @override
  Future<List<MovieModel>> fetchTopRatedMovies() async {
    return await Future.value([
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
      const MovieModel(
        backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
        genreIds: [
          14,
          28,
          12,
        ],
        id: 453395,
        overview:
            "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseData: '23',
        title: "Movie Title",
        voteAverage: 5.0,
      ),
    ]);
  }

  @override
  Future<MovieDetailsModel> fetchMovieDetails(int movieId) async {
    return await Future<MovieDetailsModel>.value(const MovieDetailsModel(
      backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
      genres: [
        Genre(name: 'Family', id: 10751),
      ],
      id: 438148,
      overview:
          "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
      title: "Minions: The Rise of Gru",
      voteAverage: 7.8,
      runTime: 87,
      releaseDate: "1-1-2022",
      homepage: '',
    ));
  }

  @override
  Future<List<MovieRecommendationModel>> fetchMovieRecommendations(
      int movieId) async{
    return await Future.value(
        [
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    const MovieRecommendationModel(
    backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
    ]

    );
  }
}