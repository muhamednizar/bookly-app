import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class CustomBookImage extends StatelessWidget {
  final String image;

  const CustomBookImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: (image.isEmpty)
              ? Container(color: Colors.grey.shade300)
              : CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey.shade300,
                  ),
                ),
        ),
      ),
    );
  }
}
