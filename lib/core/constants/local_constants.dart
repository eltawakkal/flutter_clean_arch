class LocalConstants {
  static const String movieBox = 'movie_box';
  static const String favoritedMovieBox = 'favorited_movie';
  static const String nowPlayingBoxField = 'now_playing_field';
  static const String upcomingBoxField = 'upcoming_field';
  static const String movieDetalBoxField = 'detail_movie_field';
  static const String moviesFavoritedBoxField = 'favorited_field';

  static String assetImageGif(String imageName) => 'assets/images/gifs/$imageName';
}

enum ShowType {
  NETWORK,
  LOCAL
}