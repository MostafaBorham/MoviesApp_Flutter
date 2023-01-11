import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final double voteAverage;
  final String? releaseData;
  final String title;
  final String backdropPath;
  final String overview;
  final List<int> genreIds;

  const Movie(
      {required this.id,
      required this.voteAverage,
      this.releaseData,
      required this.title,
      required this.backdropPath,
      required this.overview,
      required this.genreIds});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        voteAverage,
        releaseData,
        title,
        backdropPath,
        overview,
        genreIds,
      ];
}
