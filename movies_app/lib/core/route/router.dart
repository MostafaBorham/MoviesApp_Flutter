import 'package:flutter/material.dart';
import 'package:movies_app/core/route/routes.dart';
import 'package:movies_app/modules/movies/presentation/screens/movie_details_screen.dart';
import 'package:movies_app/modules/movies/presentation/screens/movies_screen.dart';
import 'package:movies_app/modules/movies/presentation/screens/test_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.testScreenRoute:
      return MaterialPageRoute(builder: (_) => const TestScreen());
    case AppRoutes.moviesScreenRoute:
      return MaterialPageRoute(builder: (_) => const MoviesScreen());
    case AppRoutes.movieDetailsScreenRoute:
      Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
          builder: (_) => MovieDetailsScreen(id: args['movieId']));
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
