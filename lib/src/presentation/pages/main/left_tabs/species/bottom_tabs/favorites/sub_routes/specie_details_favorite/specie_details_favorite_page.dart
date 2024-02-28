/* import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/presentation/global/sections/specie_details_section.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/router/routes.dart';

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
          SpecieDetailsSection(
            specie: specie,
            onTapForFullImage: () => context.pushNamed(
              Routes.specieImageFavorite,
              pathParameters: {'specie': jsonEncode(specie.toJson())},
            ),
          ),
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
 */