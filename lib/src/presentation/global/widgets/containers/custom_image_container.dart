import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final String imageUrl;
  final double? heightImage;
  final double? heightImageInAnother;
  final double? width;
  final BorderRadius? borderRadius;
  final bool fitImage;
  final Color? mainColor;
  final Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder;
  final void Function()? onTap;
  const CustomImageContainer({
    Key? key,
    required this.imageUrl,
    this.heightImage,
    this.width,
    this.borderRadius,
    this.fitImage = false,
    this.mainColor,
    this.onTap,
    this.heightImageInAnother,
    this.progressIndicatorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = BorderRadius.circular(16.0);
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius ?? defaultBorderRadius,
      child: ClipRRect(
        borderRadius: borderRadius ?? defaultBorderRadius,
        child: imageUrl.startsWith('http')
            ? SizedBox(
                height: heightImage,
                width: width,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 384.0),
                  child: CachedNetworkImage(
                    height: heightImage,
                    imageUrl: imageUrl,
                    width: double.infinity,
                    fit: fitImage ? BoxFit.cover : BoxFit.contain,
                    progressIndicatorBuilder: progressIndicatorBuilder ??
                        (context, url, downloadProgress) => SizedBox(
                      height: heightImageInAnother,
                      width: width,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => SizedBox(
                      height: heightImageInAnother ?? heightImage,
                      width: width,
                      child: const Center(
                          child: Icon(Icons.image_not_supported_outlined)),
                    ),
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
