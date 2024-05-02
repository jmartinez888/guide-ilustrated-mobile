import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/presentation/global/sections/species_details_section.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';

class SpecieDetailsFavoritePage extends StatefulWidget {
  final String specie;
  const SpecieDetailsFavoritePage({
    Key? key,
    required this.specie,
  }) : super(key: key);

  @override
  State<SpecieDetailsFavoritePage> createState() =>
      _SpecieDetailsFavoritePageState();
}

class _SpecieDetailsFavoritePageState extends State<SpecieDetailsFavoritePage> {
  late Specie specie;
  @override
  void initState() {
    super.initState();
    Map<String, dynamic> specieMap = jsonDecode(widget.specie);
    specie = Specie.fromJson(specieMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SpecieDetailSection(specie: specie),
          const Positioned(
            top: 8.0,
            left: 56.0,
            child: SafeArea(
              child: CustomBackButton(),
            ),
          ),
        ],
      ),
    );
  }
}
