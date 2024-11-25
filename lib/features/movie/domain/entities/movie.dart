import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie extends Equatable {
  @HiveField(0)
  final bool? adult;
  @HiveField(1)
  final String? backdropPath;
  @HiveField(2)
  final int? id;
  @HiveField(3)
  final String? originalLanguage;
  @HiveField(4)
  final String? originalTitle;
  @HiveField(5)
  final String? overview;
  @HiveField(6)
  final double? popularity;
  @HiveField(7)
  final String? posterPath;
  @HiveField(8)
  final String? releaseDate;
  @HiveField(9)
  final String? title;
  @HiveField(10)
  final bool? video;
  @HiveField(11)
  final double? voteAverage;
  @HiveField(12)
  final int? voteCount;

  const Movie({
    this.adult,
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount
  });

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    id,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount
  ];
}