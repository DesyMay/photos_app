import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:photos_app/config/app_icon.dart';
import 'package:photos_app/features/home/widgets/state_banner.dart';

import '../models/image_model.dart';

class PhotoPreview extends StatelessWidget {
  const PhotoPreview({
    super.key,
    required this.item,
    required this.tag,
    this.onTap,
  });

  final ImageModel item;
  final VoidCallback? onTap;
  final Object tag;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
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
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CupertinoActivityIndicator(),
                    imageUrl: item.largeImageURL ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StateBanner(
                      icon: AppIcons.like, title: item.likes.toString()),
                  StateBanner(
                      icon: AppIcons.view, title: item.views.toString()),
                ],
              ),
            ))
      ],
    );
  }
}
