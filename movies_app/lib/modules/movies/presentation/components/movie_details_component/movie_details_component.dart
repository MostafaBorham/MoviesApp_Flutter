import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_progress_bar.dart';
import 'package:movies_app/modules/movies/domain/entities/genre.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_details_bloc/movie_details_state.dart';
import 'package:sliver_tools/sliver_tools.dart';

class MovieDetailsComponent extends StatelessWidget {
  MovieDetailsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: _buildWhen,
      builder: _builder,
    );
  }

  Widget _showDetails(context, details) => MultiSliver(pushPinnedChildren: false,children: [
    SliverAppBar(
      pinned: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeIn(
          duration: const Duration(milliseconds: 500),
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0.0, 0.5, 1.0, 1.0],
              ).createShader(
                Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              imageUrl:
              NetworkConstants.getFullImageUrl(details.backdropPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
    SliverToBoxAdapter(
      child: FadeInUp(
        from: 20,
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(details.title,
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  )),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                      horizontal: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      details.releaseDate!.split(AppConstants.dash)[0],
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        (details.voteAverage / 2).toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '(${details.voteAverage})',
                        style: const TextStyle(
                          fontSize: 1.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    _showDuration(details.runTime),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                details.overview,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '${AppStrings.translate(AppStrings.genresColon)} ${_showGenres(details.genres)}',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ]);

  String _showGenres(List<Genre> genres) {
    String result = DefaultConstants.emptyString;
    for (var genre in genres) {
      result += '${genre.name},${AppConstants.space}';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '$hours${AppConstants.hourSign} $minutes${AppConstants.minuteSign}';
    } else {
      return '$minutes${AppConstants.minuteSign}';
    }
  }

  Widget _builder(BuildContext context, MovieDetailsState state) =>
      (state is GetMovieDetailsLoadingState || state is MovieDetailsInitialState)
          ? const SliverToBoxAdapter(child: CustomLoadingProgressBar(color: Colors.redAccent))
          : state is GetMovieDetailsErrorState
              ? SliverToBoxAdapter(child: CustomErrorWidget(message: state.failure.message))
              : state is GetMovieDetailsSuccessState
                  ? _showDetails(context, state.movieDetails)
                  : const SliverToBoxAdapter();

  bool _buildWhen(MovieDetailsState previous, MovieDetailsState current) =>
      current is MovieDetailsInitialState ||
      current is GetMovieDetailsLoadingState ||
      current is GetMovieDetailsErrorState ||
      current is GetMovieDetailsSuccessState;
}
