
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable()
class AlbumModel {
  int id;

  int userId;

  String title;

  // String description;

  // @JsonKey(name: 'image_url')
  // String imageUrl;

  AlbumModel({
    @required this.id,
    @required this.userId,
      @required this.title,
 
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);
}