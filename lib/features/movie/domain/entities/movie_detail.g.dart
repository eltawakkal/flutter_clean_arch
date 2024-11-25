// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailAdapter extends TypeAdapter<MovieDetail> {
  @override
  final int typeId = 1;

  @override
  MovieDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetail(
      id: fields[0] as int?,
      adult: fields[1] as bool?,
      backdropPath: fields[2] as String?,
      posterPath: fields[3] as String?,
      budget: fields[4] as int?,
      originalLanguage: fields[5] as String?,
      overview: fields[6] as String?,
      popularity: fields[7] as double?,
      releaseDate: fields[8] as String?,
      revenue: fields[9] as int?,
      status: fields[10] as String?,
      tagline: fields[11] as String?,
      title: fields[12] as String?,
      voteAverage: fields[13] as double?,
      voteCount: fields[14] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetail obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.adult)
      ..writeByte(2)
      ..write(obj.backdropPath)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.budget)
      ..writeByte(5)
      ..write(obj.originalLanguage)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.revenue)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.tagline)
      ..writeByte(12)
      ..write(obj.title)
      ..writeByte(13)
      ..write(obj.voteAverage)
      ..writeByte(14)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
