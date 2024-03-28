import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/utils/images_assets/images_assets.dart';

class PlaceholderImage extends StatelessWidget {
  final double width;
  final double height;

  const PlaceholderImage({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image.asset(
          ImagesAssets.logoWithName,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
