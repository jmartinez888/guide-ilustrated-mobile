import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final String imageUrl;
  final double? heightImage;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final bool fitImage;
  final void Function()? onTap;
  const CustomImageContainer({
    Key? key,
    required this.imageUrl,
    this.heightImage,
    this.width,
    this.borderRadius,
    this.fitImage = false,
    this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final borderRadius = BorderRadius.circular(16.0);
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: imageUrl.startsWith('http')
            ? SizedBox(
                height: heightImage,
                width: width,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  fit: fitImage == true ? BoxFit.none : BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                    height: heightImage,
                    width: width,
                    child: Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                  ),
                  errorWidget: (context, url, error) => SizedBox(
                    height: heightImage,
                    width: width,
                    child: const Center(
                        child: Icon(Icons.image_not_supported_outlined)),
                  ),
                ),
              )
            : SizedBox(
                child: Image.asset(
                  imageUrl,
                  height: fitImage == true ? heightImage : null,
                  width: width,
                  fit: fitImage == true ? BoxFit.cover : BoxFit.none,
                ),
              ),
      ),
    );
  }
}
