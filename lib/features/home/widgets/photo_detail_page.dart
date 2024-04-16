import 'package:cached_network_image/cached_network_image.dart' show CachedNetworkImageProvider;
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoDetailPage extends StatelessWidget {
  final String photo;

  const PhotoDetailPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Hero(
            tag: photo,
            child: PhotoView(
              backgroundDecoration: const BoxDecoration(color: Colors.white),
              loadingBuilder: (context, event) =>
                  const CupertinoActivityIndicator(),
              imageProvider: CachedNetworkImageProvider(photo),
            )),
      ),
    );
  }
}
