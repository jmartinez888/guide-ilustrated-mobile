import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';

class InputImagePicker extends StatelessWidget {
  final String? imageUrl;
  final Uint8List? image;
  final void Function()? onSelectedImage;

  const InputImagePicker(
      {super.key, this.imageUrl, this.image, this.onSelectedImage});

  Future<bool> doesImageExist(String imageUrl) async {
    final storage = FirebaseStorage.instance;
    try {
      final ref = storage.refFromURL(imageUrl);
      await ref.getMetadata();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          image != null
              ? CircleAvatar(
                  backgroundImage: MemoryImage(image!),
                  radius: 100,
                )
              : imageUrl != null
                  ? FutureBuilder<bool>(
                      future: doesImageExist(imageUrl!),
                      builder: (context, imageSnapshot) {
                        final imageExists = imageSnapshot.data ?? false;
                        return imageExists
                            ? Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(imageUrl!),
                                    radius: 100,
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: CustomIconButton(
                                      onPressed: onSelectedImage,
                                      icon: Icons.add_a_photo,
                                    ),
                                  ),
                                ],
                              )
                            : Stack(
                                children: [
                                  const Icon(
                                    Icons.account_circle_rounded,
                                    color: Colors.grey,
                                    size: 200,
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: CustomIconButton(
                                      onPressed: onSelectedImage,
                                      icon: Icons.add_a_photo,
                                    ),
                                  ),
                                ],
                              );
                      },
                    )
                  : Column(
                      children: [
                        Stack(
                          children: [
                            const Icon(
                              Icons.account_circle_rounded,
                              color: Colors.grey,
                              size: 200,
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: CustomIconButton(
                                onPressed: onSelectedImage,
                                icon: Icons.add_a_photo,
                              ),
                            ),
                          ],
                        ),
                        const Text('Seleccione una imagen de perfil'),
                      ],
                    ),
        ],
      ),
    );
  }
}
