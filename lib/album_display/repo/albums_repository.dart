import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class AlbumRepository {
  static final AlbumRepository _albumRepository = AlbumRepository._();
  static const int _perPage = 10;
  var dio = Dio();

  AlbumRepository._();

  factory AlbumRepository() {
    return _albumRepository;
  }

  Future<dynamic> getAlbums({
    @required int page,
  }) async {
    try {
      print('Start position');
      int start;
      start = page*_perPage;
      print(start);
      var response = await dio.get(
          'https://jsonplaceholder.typicode.com/albums?_start=$start&_limit=$_perPage');
      return response;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
