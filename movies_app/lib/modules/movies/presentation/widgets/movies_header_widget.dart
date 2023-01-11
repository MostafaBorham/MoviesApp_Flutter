import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_strings.dart';

class MoviesHeaderWidget extends StatelessWidget {
  const MoviesHeaderWidget({Key? key, required this.moviesType, this.onTap})
      : super(key: key);
  final String moviesType;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            moviesType,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(AppStrings.translate(AppStrings.seeMore)),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
