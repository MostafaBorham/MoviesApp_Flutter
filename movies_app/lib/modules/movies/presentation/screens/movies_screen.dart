import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/controllers/app_bloc.dart';
import 'package:movies_app/core/helpers/dependency_injection_helper.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/modules/movies/presentation/components/movie_component/now_playing_movies_component.dart';
import 'package:movies_app/modules/movies/presentation/components/movie_component/popular_movies_component.dart';
import 'package:movies_app/modules/movies/presentation/components/movie_component/top_rated_movies_component.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_bloc/movie_bloc.dart';
import 'package:movies_app/modules/movies/presentation/widgets/movie_drawer.dart';
import 'package:movies_app/modules/movies/presentation/widgets/movies_header_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MovieDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          DependencyInjectionHelper.dihInstance<MovieBloc>()
              .add(GetAllMoviesEvent());
        },
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is ChangeLocalizationState) {
              context.setLocale(state.locale);
              DependencyInjectionHelper.dihInstance<MovieBloc>().add(GetAllMoviesEvent());
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NowPlayingMoviesComponent(),
                  MoviesHeaderWidget(moviesType: AppStrings.translate(AppStrings.popular)),
                  const PopularMoviesComponent(),
                  MoviesHeaderWidget(moviesType: AppStrings.translate(AppStrings.topRated)),
                  const TopRatedMoviesComponent(),
                  const SizedBox(height: 50.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
