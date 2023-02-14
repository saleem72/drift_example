//

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UrlImage extends StatelessWidget {
  const UrlImage({
    super.key,
    required this.url,
  });
  final String? url;
  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return CachedNetworkImage(
        imageUrl: url!,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) {
          log(error.toString());
          return const Icon(Icons.error);
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
