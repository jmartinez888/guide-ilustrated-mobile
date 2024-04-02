/* import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/presentation/global/sections/image_details_section.dart';

class ImageDetailsFavoritePage extends StatefulWidget {
  final String specie;

  const ImageDetailsFavoritePage({
    Key? key,
    required this.specie,
  }) : super(key: key);

  @override
  State<ImageDetailsFavoritePage> createState() =>
      _ImageDetailsFavoritePageState();
}

class _ImageDetailsFavoritePageState extends State<ImageDetailsFavoritePage> {
  late Specie specie;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> specieMap = jsonDecode(widget.specie);
    specie = Specie.fromJson(specieMap);
  }

  @override
  Widget build(BuildContext context) => ImageDetailsSection(
        tag: '123',
        specie: specie,
      );
}
 */