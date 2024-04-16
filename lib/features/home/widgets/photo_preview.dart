import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';

import '../models/image_model.dart';

class PhotoPreview extends StatelessWidget {
  const PhotoPreview({
    super.key,
    required this.item,
    required this.tag,
    this.onTap,
    required this.size,
  });

  final ImageModel item;
  final VoidCallback? onTap;
  final Object tag;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: tag,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                placeholder: (context, url) => const CupertinoActivityIndicator(),
                imageUrl: item.largeImageURL ?? '',
                height: size,
                width: size,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}