import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:species/src/presentation/global/sections/image_details_section.dart';

import 'package:species/src/presentation/pages/providers/species/specie_detail_provider.dart';

class ImageDetailsPage extends ConsumerStatefulWidget {
  final String id;
  const ImageDetailsPage({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<ImageDetailsPage> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends ConsumerState<ImageDetailsPage> {
  @override
  void initState() {
    super.initState();
    ref.read(specieDetailsProvider.notifier).loadSpecie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final specie = ref.watch(specieDetailsProvider)[widget.id];

    return specie == null
        ? const Center(child: CircularProgressIndicator())
        : ImageDetailsSection(images: specie.images);
  }
}

