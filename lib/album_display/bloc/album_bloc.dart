
import 'package:albums_app/album_display/model/album_model.dart';
import 'package:albums_app/album_display/repo/albums_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository albumRepository;
  int page  = 0;
  bool isFetching  = false;

  AlbumBloc({
@required this.albumRepository,
  }): super(AlbumInitialState());

  @override
  Stream<AlbumState> mapEventToState(AlbumEvent event) async* {
    if(event is AlbumFetchEvent) {
      yield AlbumLoadingState(message: 'Loading albums..');
      final response = await albumRepository.getAlbums(page: page);
      // if(response is http.Response) {
              if(response !=null) {
        // if(response.statusCode == 200) {
          if(response.data !=null) {
          // final albums = jsonDecode(response.body) as List;
          final albums = response.data as List;
          yield AlbumSuccessState(albums: albums.map((album) => AlbumModel.fromJson(album)).toList(),);
          page++; 
        }
        else {
          yield AlbumErrorState(error: response.body);
        }

      }
      else if(response is String) {
        yield AlbumErrorState(error: response);
      }
      else if(response == null) {
          yield AlbumErrorState(error: 'No internet!');
      }
    }
  }
  
}