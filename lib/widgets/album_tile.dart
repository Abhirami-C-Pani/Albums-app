import 'package:albums_app/album_display/model/album_model.dart';
import 'package:flutter/material.dart';

class AlbumTile extends StatelessWidget {
  final AlbumModel album;

  const AlbumTile(this.album);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade50,
              blurRadius: 1.0,
            ),
          ],
        ),
        height: 83,
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: (album.id % 2 == 0)
                      ? Colors.blue.shade100
                      : (album.id % 3 == 0)
                          ? Colors.teal.shade100
                          : Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    album.id.toString(),
                    textScaleFactor: 1.0,
                  ),
                ),
              ),
            ],
          ),
          title: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    album.title,
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          trailing: Container(
            height: 23,
            width: 74,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Center(
              child: Text(
                'user id: ' + album.userId.toString(),
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
