import 'package:albums_app/album_display/bloc/album_bloc.dart';
import 'package:albums_app/album_display/bloc/album_event.dart';
import 'package:albums_app/album_display/bloc/album_state.dart';
import 'package:albums_app/album_display/model/album_model.dart';
import 'package:albums_app/constants/colors.dart';
import 'package:albums_app/widgets/album_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumBody extends StatelessWidget {
  final List<AlbumModel> _albums = [];
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.lightPink,
            AppColor.lightBlue,
          ],
        ),
      ),
      child: Center(
        child: BlocConsumer<AlbumBloc, AlbumState>(
          listener: (context, albumState) {
            if (albumState is AlbumLoadingState) {
              Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  albumState.message,
                  textScaleFactor: 1.0,
                ),
              ));
            } else if (albumState is AlbumSuccessState &&
                albumState.albums.isEmpty) {
              Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.purple.shade500,
                content: Text(
                  'End of album list!',
                  textScaleFactor: 1.0,
                ),
              ));
            } else if (albumState is AlbumErrorState) {
              Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  albumState.error,
                  textScaleFactor: 1.0,
                ),
              ));
              context.read<AlbumBloc>().isFetching = false;
            }
          },
          builder: (context, albumState) {
            if (albumState is AlbumInitialState ||
                albumState is AlbumLoadingState && _albums.isEmpty) {
              return CircularProgressIndicator();
            } else if (albumState is AlbumSuccessState) {
              _albums.addAll(albumState.albums);
              context.read<AlbumBloc>().isFetching = false;
              Scaffold.of(context).hideCurrentSnackBar();
            } else if (albumState is AlbumErrorState && _albums.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        context.read<AlbumBloc>()
                          ..isFetching = true
                          ..add(AlbumFetchEvent());
                      }),
                  const SizedBox(height: 15),
                  Text(
                    albumState.error,
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListView.builder(
                physics: ScrollPhysics(),
                controller: _scrollController
                  ..addListener(() {
                    if (_scrollController.offset ==
                            _scrollController.position.maxScrollExtent &&
                        !context.read<AlbumBloc>().isFetching) {
                      context.read<AlbumBloc>()
                        ..isFetching = true
                        ..add(AlbumFetchEvent());
                    }
                  }),
                itemBuilder: (context, index) => AlbumTile(_albums[index]),
                itemCount: _albums.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
