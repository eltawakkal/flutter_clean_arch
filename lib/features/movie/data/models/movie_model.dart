import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    super.adult,
    super.backdropPath,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    adult: json['adult'],
    backdropPath: json['backdrop_path'],
    id: json['id'],
    originalLanguage: json['original_language'],
    originalTitle: json['original_title'],
    overview: json['overview'],
    popularity: json['popularity'],
    posterPath: json['poster_path'],
    releaseDate: json['release_date'],
    title: json['title'],
    video: json['video'],
    voteAverage: json['vote_average'],
    voteCount: json['vote_count']
  );

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount
    };
  }

  static List<MovieModel> fromJsonList(List data) {
    return data.map((movie) => MovieModel.fromJson(movie)).toList();
  }
}