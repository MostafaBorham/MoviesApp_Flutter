import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_strings.dart';

class MovieRecommendationsHeaderComponent extends StatelessWidget {
   MovieRecommendationsHeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
      sliver: SliverToBoxAdapter(
        child: FadeInUp(
          from: 20,
          duration: const Duration(milliseconds: 500),
          child: Text(
            AppStrings.translate(AppStrings.moreLikeThis),
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
