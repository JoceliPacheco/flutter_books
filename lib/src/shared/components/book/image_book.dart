import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBook extends StatelessWidget {
  final String url;
  const ImageBook(
    this.url, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.no_photography),
    );
  }
}
