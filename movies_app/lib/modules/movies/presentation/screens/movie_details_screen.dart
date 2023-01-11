import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/controllers/app_bloc.dart';
import 'package:movies_app/core/helpers/dependency_injection_helper.dart';
import 'package:movies_app/modules/movies/presentation/components/movie_details_component/movie_details_component.dart';
import 'package:movies_app/modules/movies/presentation/components/movie_details_component/movie_recommendations_component.dart';
import 'package:movies_app/modules/movies/presentation/components/movie_details_component/movie_recommendations_header_component.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_bloc/movie_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_details_bloc/movie_details_event.dart';
import 'package:movies_app/modules/movies/presentation/widgets/movie_drawer.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;

  const MovieDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetailsBloc =
        DependencyInjectionHelper.dihInstance<MovieDetailsBloc>();
    movieDetailsBloc.add(GetMovieDetailsEvent(movieId: id));
    movieDetailsBloc.add(GetMovieRecommendationsEvent(movieId: id));
    return Scaffold(
      drawer: const MovieDrawer(),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is ChangeLocalizationState) {
            context.setLocale(state.locale);
            DependencyInjectionHelper.dihInstance<MovieDetailsBloc>().add(GetAllMovieDetailsEvent(movieId: id));
          }
          return CustomScrollView(
            slivers: [
              MovieDetailsComponent(),
              MovieRecommendationsHeaderComponent(),
              const MovieRecommendationsComponent(),
            ],
          );
        },
      ),
    );
  }
}
