import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_progress_bar.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_details_bloc/movie_details_state.dart';
import 'package:shimmer/shimmer.dart';

class MovieRecommendationsComponent extends StatelessWidget {
  const MovieRecommendationsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: _buildWhen,
      builder: _builder,
    );
  }

  Widget _showRecommendations(recommendations) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final MovieRecommendation recommendation = recommendations[index];
            return FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: CachedNetworkImage(
                  imageUrl: recommendation.backdropPath!=null? NetworkConstants.getFullImageUrl(
                      recommendation.backdropPath!) : DefaultConstants.noMoviePoster,
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          childCount: recommendations.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
          crossAxisCount: 3,
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, MovieDetailsState state) =>
      (state is GetMovieRecommendationsLoadingState || state is MovieDetailsInitialState)
          ? const SliverToBoxAdapter(child: CustomLoadingProgressBar(color: Colors.redAccent))
          : state is GetMovieRecommendationsErrorState
              ? SliverToBoxAdapter(child: CustomErrorWidget(message: state.failure.message))
              : state is GetMovieRecommendationsSuccessState
                  ? _showRecommendations(state.movieRecommendations)
                  : const SliverToBoxAdapter();

  bool _buildWhen(MovieDetailsState previous, MovieDetailsState current) =>
      current is MovieDetailsInitialState ||
      current is GetMovieRecommendationsSuccessState ||
      current is GetMovieRecommendationsErrorState ||
      current is GetMovieRecommendationsLoadingState;
}
