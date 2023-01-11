import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/controllers/app_bloc.dart';
import 'package:movies_app/core/helpers/dependency_injection_helper.dart';
import 'package:movies_app/core/utils/app_localization.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/modules/movies/presentation/widgets/movie_drawer.dart';
import 'package:movies_app/modules/movies/presentation/widgets/movies_header_widget.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc,AppState>(
      builder: (context,state)=> Scaffold(
        appBar: AppBar(),
        drawer: MovieDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("appName"),
                Text(' : '),
                Text("seeMore")
              ],
            ),
            SizedBox(
              height: 10,
            ),
            MoviesHeaderWidget(moviesType: "popular"),
            ElevatedButton(
                onPressed: () {
                  EasyLocalization.of(context)?.setLocale(AppLocalization.englishLocale);
                },
                child: Text('Select English')),
            ElevatedButton(
                onPressed: () {
                  EasyLocalization.of(context)?.setLocale(AppLocalization.arabicLocale);
                },
                child: Text('Select Arabic')),
          ],
        ),
      ),
    );
  }
}
