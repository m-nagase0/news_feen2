
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageFromUrl extends StatelessWidget {
  final String? imageUrl;

  ImageFromUrl({Key? key, this.imageUrl}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final isInvalidUrl = (imageUrl != null) ? imageUrl!.startsWith("http") : false;
    if (imageUrl == null || imageUrl == "" || !isInvalidUrl) {
      return const Icon(Icons.broken_image);
    } else {
      return CachedNetworkImage(imageUrl: imageUrl!,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.broken_image),
        fit: BoxFit.cover,
      );
    }
  }
}
