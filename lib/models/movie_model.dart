import 'dart:convert';

import 'package:netflix/services/neftlix_api.dart';

class Movie {
  final int id;
  final String name;
  final String description;
  final String? posterPath;
  Movie({
    required this.id,
    required this.name,
    required this.description,
    this.posterPath,
  });

  Movie copyWith({
    int? id,
    String? name,
    String? description,
    String? posterPath,
  }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      posterPath: posterPath ?? this.posterPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'posterPath': posterPath,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      name: map['title'] as String,
      description: map['overview'] as String,
      posterPath: map['poster_path'],
    );
  }

  String posterUrl() {
    Api api = Api();
    return api.baseImageUrl + posterPath!;
  }
}
