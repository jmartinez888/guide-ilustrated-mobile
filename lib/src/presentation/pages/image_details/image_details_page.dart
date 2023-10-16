import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2022%2F04%2Fsam-raimi-spider-man-4-tobey-maguire-possibility-marvel-studio-info-1.jpg?cbr=1&q=90',
      'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2022%2F04%2Fsam-raimi-spider-man-4-tobey-maguire-possibility-marvel-studio-info-1.jpg?cbr=1&q=90'
    ];
    return Stack(
      children: [
        PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              maxScale: PhotoViewComputedScale.covered * 8,
              minScale: PhotoViewComputedScale.contained,
              imageProvider: CachedNetworkImageProvider(images[index]),
            );
          },
          itemCount: images.length,
          loadingBuilder: (context, event) => Center(
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded /
                      event.expectedTotalBytes!.toDouble(),
            ),
          ),
        ),
        const Positioned(
          top: 8.0,
          left: 8.0,
          child: SafeArea(
            child: CustomBackButton(),
          ),
        ),
      ],
    );
  }
}
