import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';

class ImageDetailsPage extends StatefulWidget {
  final String images;

  const ImageDetailsPage({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<ImageDetailsPage> createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  late List<String> images;
  @override
  void initState() {
    final replace = widget.images
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll('\'', '')
        .replaceAll('"', '')
        ;
    images = replace.split(', ');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                maxScale: PhotoViewComputedScale.covered * 8,
                minScale: PhotoViewComputedScale.contained,
                imageProvider:
                    CachedNetworkImageProvider(images[index]),
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
      ),
    );
  }
}
