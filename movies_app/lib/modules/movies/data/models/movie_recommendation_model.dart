import 'package:movies_app/modules/movies/domain/entities/movie_recommendation.dart';

class MovieRecommendationModel extends MovieRecommendation {
  const MovieRecommendationModel(
      {required super.id, super.backdropPath});

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
      );
}
