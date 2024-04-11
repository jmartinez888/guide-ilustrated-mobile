import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';

class ImageGeneric extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  const ImageGeneric(
    this.url, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      child: url.startsWith('http')
          ? CachedNetworkImage(
              imageUrl: url,
              height: height,
              width: width,
              fit: fit ??
                  (height != null || width != null ? BoxFit.cover : null),
              progressIndicatorBuilder: height == null && width == null
                  ? null
                  : (_, __, ___) => Center(
                        child: SkeletonConatiner(
                          height: height,
                          width: width,
                        ),
                      ),
              errorWidget: (_, __, ___) => _errorContainer(),
            )
          : Image.asset(
              url,
              height: height,
              width: width,
              fit: fit ??
                  (height != null || width != null ? BoxFit.cover : null),
              errorBuilder: (_, __, ___) => _errorContainer(),
            ),
    );
  }

  Padding _errorContainer() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(child: Icon(Icons.error_rounded)),
    );
  }
}
