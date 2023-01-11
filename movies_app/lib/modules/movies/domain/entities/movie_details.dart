import 'package:equatable/equatable.dart';
import 'package:movies_app/modules/movies/domain/entities/genre.dart';

class MovieDetails extends Equatable {
  final int id;
  final double voteAverage;
  final String releaseDate;
  final String title;
  final String backdropPath;
  final int runTime;
  final String overview;
  final String homepage;
  final List<Genre> genres;

  const MovieDetails(
      {required this.id,
       required this.runTime,
      required this.voteAverage,
      required this.releaseDate,
      required this.title,
      required this.backdropPath,
      required this.overview,
      required this.homepage,
      required this.genres});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        voteAverage,
        releaseDate,
        title,
        backdropPath,
        overview,
        homepage,
        genres,
      ];
}
