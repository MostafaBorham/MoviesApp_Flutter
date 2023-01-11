import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/route/routes.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_progress_bar.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_bloc/movie_bloc.dart';
import 'package:shimmer/shimmer.dart';

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc,MovieState>(
        buildWhen: _buildWhen,
        builder: (context, state) {
          return _builder(state);
        });
  }

  bool _buildWhen(previous, current) =>
      current is GetPopularMoviesState ||
      current is GetPopularMoviesErrorState ||
      current is GetAllMoviesLoadingState ||
          current is MovieInitialState;

  Widget _builder(state) {
    if (state is GetPopularMoviesState) {
      return _buildMoviesList(state.movies);
    }
    if (state is GetPopularMoviesErrorState) {
      return _buildMoviesError(state.failure.message);
    }
    if (state is GetAllMoviesLoadingState || state is MovieInitialState) {
      return _buildMoviesLoading();
    }
    return Container();
  }

  Widget _buildMoviesList(movies) => FadeIn(
        duration: const Duration(milliseconds: 500),
        child: SizedBox(
          height: 170.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Container(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.movieDetailsScreenRoute,arguments: {
                      KeyConstants.movieId : movie.id
                    });
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: CachedNetworkImage(
                      width: 120.0,
                      fit: BoxFit.cover,
                      imageUrl:
                          NetworkConstants.getFullImageUrl(movie.backdropPath!),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 170.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
  Widget _buildMoviesError(String message) => Container(
        color: Colors.redAccent,
        height: 170,
        alignment: Alignment.center,
        width: double.infinity,
        child: CustomErrorWidget(message: message),
      );
  Widget _buildMoviesLoading() => Container(
        color: Colors.black.withOpacity(0.7),
        height: 170,
        alignment: Alignment.center,
        width: double.infinity,
        child: const CustomLoadingProgressBar(color: Colors.white),
      );
}
