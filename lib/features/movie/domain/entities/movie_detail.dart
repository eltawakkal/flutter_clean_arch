import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'movie_detail.g.dart';

@HiveType(typeId: 1)
class MovieDetail extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final bool? adult;
  @HiveField(2)
  final String? backdropPath;
  @HiveField(3)
  final String? posterPath;
  @HiveField(4)
  final int? budget;
  @HiveField(5)
  final String? originalLanguage;
  @HiveField(6)
  final String? overview;
  @HiveField(7)
  final double? popularity;
  @HiveField(8)
  final String? releaseDate;
  @HiveField(9)
  final int? revenue;
  @HiveField(10)
  final String? status;
  @HiveField(11)
  final String? tagline;
  @HiveField(12)
  final String? title;
  @HiveField(13)
  final double? voteAverage;
  @HiveField(14)
  final int? voteCount;
  @HiveField(15)

  const MovieDetail({
    this.id,
    this.adult,
    this.backdropPath,
    this.posterPath,
    this.budget,
    this.originalLanguage,
    this.overview,
    this.popularity,
    this.releaseDate,
    this.revenue,
    this.status,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount,
  });
  
  @override
  List<Object?> get props => [
    id,
    adult,
    backdropPath,
    posterPath,
    budget,
    originalLanguage,
    overview,
    popularity,
    releaseDate,
    revenue,
    status,
    tagline,
    title,
    voteAverage,
    voteCount,
  ];

}