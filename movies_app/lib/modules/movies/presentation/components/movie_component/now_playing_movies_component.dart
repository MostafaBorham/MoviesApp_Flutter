import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/route/routes.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_progress_bar.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_bloc/movie_bloc.dart';

class NowPlayingMoviesComponent extends StatelessWidget {
   NowPlayingMoviesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: _buildWhen,
      builder: (context, state) {
        return _builder(context,state);
      },
    );
  }

  bool _buildWhen(previous, current) =>
      current is GetNowPlayingMoviesState ||
      current is GetNowPlayingMoviesErrorState ||
      current is GetAllMoviesLoadingState ||
      current is MovieInitialState;
  Widget _builder(context,MovieState state) {
    if (state is GetNowPlayingMoviesState) {
      return _buildMoviesList(context,state.movies);
    }
    if (state is GetNowPlayingMoviesErrorState) {
      return _buildMoviesError(state.failure.message);
    }
    if (state is GetAllMoviesLoadingState || state is MovieInitialState) {
      return _buildMoviesLoading();
    }
    return Container();
  }

  Widget _buildMoviesList(context,movies) => FadeIn(
    duration: const Duration(milliseconds: 500),
    child: CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        viewportFraction: 1.0,
        autoPlay: true,
        onPageChanged: (index, reason) {},
      ),
      items: movies.map<Widget>(
            (item) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.movieDetailsScreenRoute,arguments: {
                KeyConstants.movieId : item.id
              });
            },
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        // fromLTRB
                        Colors.transparent,
                        Colors.black,
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0, 0.3, 0.5, 1],
                    ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: CachedNetworkImage(
                    height: 560.0,
                    width: double.infinity,
                    imageUrl: NetworkConstants.getFullImageUrl(
                        item.backdropPath!),
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.redAccent,
                              size: 16.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              AppStrings.translate(AppStrings.nowPlaying),
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          item.title!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    ),
  );
  Widget _buildMoviesError(String message) => Container(
        color: Colors.redAccent,
        height: 400,
        alignment: Alignment.center,
        width: double.infinity,
        child: CustomErrorWidget(message: message),
      );
  Widget _buildMoviesLoading() => Container(
        color: Colors.black.withOpacity(0.7),
        height: 400,
        alignment: Alignment.center,
        width: double.infinity,
        child: const CustomLoadingProgressBar(color: Colors.white),
      );
}
