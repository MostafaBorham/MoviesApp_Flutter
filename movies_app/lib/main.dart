import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/controllers/app_bloc.dart';
import 'package:movies_app/core/helpers/dependency_injection_helper.dart';
import 'package:movies_app/core/helpers/shared_pref_helper.dart';
import 'package:movies_app/core/route/router.dart';
import 'package:movies_app/core/route/routes.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_localization.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/core/utils/app_themes.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_bloc/movie_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjectionHelper.init();///DPI install
  await SharedPrefHelper.init();
  await EasyLocalization.ensureInitialized();///Localization install
  runApp(const MyLocalizationConfiguration());
}

class MyLocalizationConfiguration extends StatelessWidget {
  const MyLocalizationConfiguration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.translationPath,
      fallbackLocale: AppLocalization.defaultLocale,
      saveLocale: true,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalization.setApiLocalCode(context.locale.languageCode);
    AppBloc.isDark=SharedPrefHelper.getBool(key: KeyConstants.modeKey, defaultValue: DefaultConstants.defaultMode);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => DependencyInjectionHelper.dihInstance<MovieBloc>()
              ..add(GetNowPlayingMoviesEvent())
              ..add(GetPopularMoviesEvent())
              ..add(GetTopRatedMoviesEvent())),
        BlocProvider(
            create: (_) =>
                DependencyInjectionHelper.dihInstance<MovieDetailsBloc>()),
        BlocProvider(
            create: (_) => DependencyInjectionHelper.dihInstance<AppBloc>()),
      ],
      child: BlocBuilder<AppBloc,AppState>(
        builder: (context,state)=> MaterialApp(
          title: AppStrings.translate(AppStrings.appName),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.themeLight(),
          darkTheme: AppTheme.darkTheme(),
          themeMode:AppBloc.isDark? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: onGenerateRoute,
          initialRoute: AppRoutes.moviesScreenRoute,
        ),
      ),
    );
  }
}