import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/global/sections/specie_details_section.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/pages/providers/species/specie_detail_provider.dart';
import 'package:species/src/presentation/router/routes.dart';

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
    ref.read(specieDetailsProvider.notifier).loadSpecie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final specie = ref.watch(specieDetailsProvider)[widget.id];
    return Stack(
      children: [
        specie == null
            ? const Center(child: CircularProgressIndicator())
            : SpecieDetailsSection(
                tag: 'abc',
                specie: specie,
                onTapForFullImage: () => context.pushNamed(
                  Routes.specieImage,
                  pathParameters: {'id': specie.id.toString()},
                ),
              ),
        const Positioned(
          left: 56.0,
          top: 8.0,
          child: CustomBackButton(),
        ),
      ],
    );
  }
}
