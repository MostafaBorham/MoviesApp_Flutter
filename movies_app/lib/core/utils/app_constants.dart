abstract class NetworkConstants {
  static const int successNetworkStatusCode = 200;
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '4c0ddfabfead16cb06567bd6fe03fa35';
  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500/';
  static String getFullImageUrl(String path) => '$baseImageUrl$path';
  static String getMovieDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';
  static String getMovieRecommendationsPath(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';
}

abstract class DefaultConstants{
  static const String noMoviePoster='https://www.prokerala.com/movies/assets/img/no-poster-available.jpg';
  static const String emptyString='';
  static const bool defaultMode=false;
}

abstract class AppConstants{
  static const String dash='-';
  static const String space=' ';
  static const String hourSign='h';
  static const String minuteSign='m';
  static const String englishCode='en';
  static const String englishCountry='US';
  static const String arabicCode='ar';
  static const String arabicCountry='EG';
}

abstract class KeyConstants{
  static const String movieId='movieId';
  static const String languageKey='language';
  static const String modeKey='App Mode';
}