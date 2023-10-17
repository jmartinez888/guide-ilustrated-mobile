import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:species/src/presentation/global/sections/body_specie_details_section.dart';
import 'package:species/src/presentation/pages/providers/species/specie_detail_provider.dart';

class SpecieDetailsPage extends ConsumerStatefulWidget {
  final String id;
  const SpecieDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  ConsumerState<SpecieDetailsPage> createState() => _SpecieDetailsPageState();
}

class _SpecieDetailsPageState extends ConsumerState<SpecieDetailsPage> {
  @override
  void initState() {
    super.initState();
    ref.read(specieDetailProvider.notifier).loadSpecie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final specie = ref.watch(specieDetailProvider)[widget.id];
    return BodySpecieDetailsSection(specie: specie);
  }
}
