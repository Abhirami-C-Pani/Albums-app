import 'package:albums_app/album_display/model/album_model.dart';
import 'package:flutter/foundation.dart';

abstract class AlbumState {
  const AlbumState();
}

class AlbumInitialState extends AlbumState {
const AlbumInitialState();
}

class AlbumLoadingState extends AlbumState {
  final String message;

  const AlbumLoadingState({
    @required this.message,
  });
}

class AlbumSuccessState extends AlbumState {
  final List<AlbumModel> albums;
  const AlbumSuccessState({
    @required this.albums,
  }); 
}

class AlbumErrorState extends AlbumState {
  final String error;
  const AlbumErrorState({
    @required this.error,
  });
}