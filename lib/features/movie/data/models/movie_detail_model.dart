import '../../domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {

  const MovieDetailModel({
    super.id,
    super.adult,
    super.backdropPath,
    super.posterPath,
    super.budget,
    super.originalLanguage,
    super.overview,
    super.popularity,
    super.releaseDate,
    super.revenue,
    super.status,
    super.tagline,
    super.title,
    super.voteAverage,
    super.voteCount,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) => MovieDetailModel(
    id: json['id'],
    adult: json['adult'],
    backdropPath: json['backdrop_path'],
    posterPath: json['poster_path'],
    budget: json['budget'],
    originalLanguage: json['original_language'],
    overview: json['overview'],
    popularity: json['popularity'],
    releaseDate: json['release_date'],
    revenue: json['revenue'],
    status: json['status'],
    tagline: json['tagline'],
    title: json['title'],
    voteAverage: json['vote_average'],
    voteCount: json['vote_count'],
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adult': adult,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'budget': budget,
      'original_language': originalLanguage,
      'overview': overview,
      'popularity': popularity,
      'release_date': releaseDate,
      'revenue': revenue,
      'status': status,
      'tagline': tagline,
      'title': title,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

}