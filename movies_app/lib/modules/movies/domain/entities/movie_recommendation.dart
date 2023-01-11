import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/app_constants.dart';

class MovieRecommendation extends Equatable {
  final int id;
  final String? backdropPath;

  const MovieRecommendation({required this.id, this.backdropPath});

  @override
  List<Object> get props => [id, backdropPath?? DefaultConstants.emptyString];
}