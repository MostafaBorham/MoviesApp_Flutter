import 'package:movies_app/modules/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.voteAverage,
      super.releaseData,
      required super.title,
      required super.backdropPath,
      required super.overview,
      required super.genreIds});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        voteAverage: json['vote_average'].toDouble(),
        releaseData: json['release_data'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        genreIds: List<int>.from(json['genre_ids'].map((genreId) => genreId)),
      );
}
