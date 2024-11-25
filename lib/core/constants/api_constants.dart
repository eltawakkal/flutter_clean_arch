class ApiConstants {
  static const String apiKey = '94bfce2a09d5324b5368be428c013e78';
  static const String moviesBaseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static String getNowPlayingUrl(int page) => '$moviesBaseUrl/movie/now_playing?api_key=$apiKey&page=$page';
  static String getUpcomingUrl(int page) => '$moviesBaseUrl/movie/upcoming?api_key=$apiKey&page=$page';
  static String getMovieDetailsUrl(int movieId) => '$moviesBaseUrl/movie/$movieId?api_key=$apiKey';
  static String getImageUrl(String path) => '$imageBaseUrl$path';
}