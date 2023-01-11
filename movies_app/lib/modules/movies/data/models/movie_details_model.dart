import 'package:movies_app/modules/movies/data/models/genre_model.dart';
import 'package:movies_app/modules/movies/domain/entities/genre.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
        required super.releaseDate,
      required super.voteAverage,
        required super.runTime,
      required super.title,
      required super.backdropPath,
      required super.overview,
      required super.homepage,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        voteAverage: json['vote_average'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        homepage: json['homepage'],
        genres: List<Genre>.from(json['genres']
            .map<GenreModel>((genre) => GenreModel.fromJson(genre))),
      );
}
