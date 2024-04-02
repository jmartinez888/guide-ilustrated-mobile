import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/images/image_generic.dart';
import 'package:species/src/presentation/global/widgets/multimedia/custom_audio_bar.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';
import 'package:species/src/presentation/pages/main/left_tabs/author/sub_routes/controller/author_details_controller.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/controller/species_details_controller.dart';

class SpecieDetailsPage extends StatefulWidget {
  final String id;

  const SpecieDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SpecieDetailsPage> createState() => _SpecieDetailsPageState();
}

class _SpecieDetailsPageState extends State<SpecieDetailsPage> {
  SpeciesDetailsController get specieReadController => context.read();

  @override
  void initState() {
    specieReadController.getSpecie(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final SpeciesDetailsController specieControllerWatch = context.watch();
    final specieState = specieControllerWatch.state;
    return Scaffold(
      body: Stack(
        children: [
          GridTwoResponsive(
            leftChild: specieState.loading
                ? const SkeletonConatiner(
                    height: double.infinity,
                    width: double.infinity,
                  )
                : specieState.mapOfId[widget.id] == null
                    ? const Icon(Icons.image_not_supported_rounded)
                    : specieState.mapOfId[widget.id]!.images != null &&
                            specieState.mapOfId[widget.id]!.images!.isNotEmpty
                        ? ImageGeneric(
                            specieState.mapOfId[widget.id]!.images!.first,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          )
                        : const Icon(Icons.image_not_supported_rounded),
            rightChildren: [
              specieState.loading
                  ? _loadingSpecieData()
                  : specieState.mapOfId[widget.id] == null
                      ? const Text(
                          'Aquí debe ir el botón para volver a consultar el método')
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (specieState.mapOfId[widget.id]!.name != null &&
                                specieState
                                    .mapOfId[widget.id]!.images!.isNotEmpty)
                              Text(
                                specieState.mapOfId[widget.id]!.name!,
                                style: textTheme.titleLarge
                                    ?.copyWith(color: Colors.red),
                              ),
                            if (specieState
                                        .mapOfId[widget.id]!.scientificName !=
                                    null &&
                                specieState.mapOfId[widget.id]!.scientificName!
                                    .isNotEmpty)
                              Text(
                                specieState.mapOfId[widget.id]!.scientificName!,
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onBackground,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            if (specieState.mapOfId[widget.id]!.sound != null &&
                                specieState
                                    .mapOfId[widget.id]!.sound!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: CustomAudioBar(
                                  audioUrl:
                                      specieState.mapOfId[widget.id]!.sound!,
                                  backgroundColor: Colors.red,
                                  progressBarColor: Colors.orange,
                                ),
                              ),
                            if (specieState.mapOfId[widget.id]!.authors !=
                                    null &&
                                specieState
                                    .mapOfId[widget.id]!.authors!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Autores',
                                    style: textTheme.titleLarge,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                            if (specieState.mapOfId[widget.id]!.authors !=
                                    null &&
                                specieState
                                    .mapOfId[widget.id]!.authors!.isNotEmpty)
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  specieState.mapOfId[widget.id]!.authors!
                                      .where((author) => author.name != null)
                                      .map((author) => author.name!)
                                      .join(', '),
                                  style: textTheme.titleMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            if (specieState.mapOfId[widget.id]!.description !=
                                    null &&
                                specieState.mapOfId[widget.id]!.description!
                                    .isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                  specieState.mapOfId[widget.id]!.description!,
                                  textAlign: TextAlign.start,
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            if (specieState.mapOfId[widget.id]!.authors != null)
                              _authorsCarrousel(
                                  specieState.mapOfId[widget.id]!.authors!),
                          ],
                        ),
            ],
          ),
          const Positioned(
            left: 56.0,
            top: 8.0,
            child: SafeArea(child: CustomBackButton()),
          ),
        ],
      ),
    );
  }

  Widget _authorsCarrousel(
    List<Author> authors,
  ) {
    return SizedBox(
      height: 320.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemCount: authors.length,
        itemBuilder: (context, index) {
          final author = authors[index];
          return Card(
            child: Column(
              children: [
                if (author.name != null && author.name!.isNotEmpty)
                  Text(author.name!),
                if (author.biography != null && author.biography!.isNotEmpty)
                  Text(author.biography!)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _doubleListTile({
    String? firstText,
    String? secondText,
    Color? divideColor,
    Color? backgroundColor,
    TextStyle? style,
  }) {
    const padding = EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0);
    return Material(
      color: backgroundColor ?? Colors.transparent,
      child: Row(
        children: [
          if (firstText != null)
            Expanded(
              child: Container(
                padding: padding,
                child: Text(
                  firstText,
                  style: style,
                ),
              ),
            ),
          if (divideColor != null)
            Container(
              height: 24.0,
              width: 1.5,
              color: divideColor,
            ),
          if (secondText != null)
            Expanded(
              child: Container(
                padding: padding,
                child: Text(
                  secondText,
                  style: style,
                ),
              ),
            ),
        ],
      ),
    );
  }

  /*  Widget _table({
  required Color mainColor,
  required Color opaqueColor,
  required BuildContext context,
  required Taxonomy taxonomy,
}) {
  final textTheme = Theme.of(context).textTheme;
  final customDivider = Divider(
    height: 1.5,
    thickness: 1.5,
    color: mainColor,
    indent: 8.0,
    endIndent: 8.0,
  );
  return Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24.0),
      border: Border.all(
        width: 2,
        color: mainColor,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _doubleListTile(
          firstText: 'Información Taxonómica',
          backgroundColor: opaqueColor,
          style: textTheme.titleLarge,
        ),
        Divider(
          height: 2.0,
          thickness: 2.0,
          color: mainColor,
        ),
        _doubleListTile(
          firstText: 'Reino',
          secondText: taxonomy.kingdom?.name ?? '-',
          divideColor: mainColor,
          style: textTheme.labelLarge,
        ),
        customDivider,
        _doubleListTile(
          firstText: 'Filo',
          secondText: taxonomy.phylum?.name ?? '-',
          divideColor: mainColor,
          style: textTheme.labelLarge,
        ),
        customDivider,
        _doubleListTile(
          firstText: 'Clase',
          secondText: taxonomy.classC?.name ?? '-',
          divideColor: mainColor,
          style: textTheme.labelLarge,
        ),
        customDivider,
        _doubleListTile(
          firstText: 'Orden',
          secondText: taxonomy.order?.name ?? '-',
          divideColor: mainColor,
          style: textTheme.labelLarge,
        ),
        customDivider,
        _doubleListTile(
          firstText: 'Familia',
          secondText: taxonomy.family?.name ?? '-',
          divideColor: mainColor,
          style: textTheme.labelLarge,
        ),
      ],
    ),
  );
}
 */
  Widget _loadingSpecieData() {
    return const Column(
      children: [
        SkeletonConatiner(
          height: 56.0,
          width: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: SkeletonConatiner(
              height: 56.0,
              width: 256.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: SkeletonConatiner(
            height: 256.0,
            width: 256.0,
          ),
        ),
      ],
    );
  }
}



/* specieState.loading
                  ? const Center(child: CircularProgressIndicator())
                  : specieState.mapOfId[widget.id] == null
                      ? ElevatedButton(
                          onPressed: () {
                            specieReadController.getSpecie(widget.id);
                          },
                          child: const Text('Inténtalo de nuevo'),
                        )
                       : Text(specieState.mapOfId[widget.id]!.toString()),  */

/* Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: specieState.loading
                    ? const Center(child: CircularProgressIndicator())
                    : authorState.mapOfId[widget.id] == null
                        ? ElevatedButton(
                            onPressed: () {
                              authorReadController.getAuthor(widget.id);
                            },
                            child: const Text('Inténtalo de nuevo'),
                          )
                        : Text(authorState.mapOfId[widget.id]!.toString()),
              ), */
