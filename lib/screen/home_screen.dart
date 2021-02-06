import 'package:albums_app/album_display/bloc/album_bloc.dart';
import 'package:albums_app/album_display/bloc/album_event.dart';
import 'package:albums_app/album_display/repo/albums_repository.dart';
import 'package:albums_app/constants/colors.dart';
import 'package:albums_app/widgets/album_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumBloc(
        albumRepository: AlbumRepository(),
      )..add(AlbumFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Albums',
            textScaleFactor: 1.0,
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffFBF4F2),
                  Color(0xffE1F0FD),
                ],
              ),
            ),
          ),
        ),
        body: AlbumBody(),
      ),
    );
  }
}
