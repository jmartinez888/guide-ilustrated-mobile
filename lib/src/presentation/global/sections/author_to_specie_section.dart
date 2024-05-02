import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/presentation/global/widgets/card/custom_expansion_tile.dart';
import 'package:species/src/presentation/global/widgets/card/simple_chip.dart';
import 'package:species/src/presentation/global/widgets/images/image_generic.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/sub_routes/species_details/controller/species_details_controller.dart';
import 'package:species/src/presentation/router/routes.dart';

class AuthorToSpecieSection extends StatefulWidget {
  final List<Author> authors;

  const AuthorToSpecieSection({
    super.key,
    required this.authors,
  });

  @override
  State<AuthorToSpecieSection> createState() => _AuthorToSpecieSectionState();
}

class _AuthorToSpecieSectionState extends State<AuthorToSpecieSection> {
  SpeciesDetailsController get specieReadController => context.read();

  @override
  Widget build(BuildContext context) {
    final SpeciesDetailsController controllerWatch = context.watch();
    final state = controllerWatch.state;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final mainColor = colorScheme.primary;
    return SliverToBoxAdapter(
      child: CustomExpansionTile(
        titleBackgroundColor: mainColor,
        sideColor: mainColor,
        elevation: 0.0,
        initialElevation: 0.0,
        initiallyExpanded: state.expanded,
        onExpansionChanged: (value) => specieReadController.changeToggle(value),
        title: Text(widget.authors.length > 1 ? 'Autores' : 'Autor'),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          itemCount: widget.authors.length,
          separatorBuilder: (_, __) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              height: 1.5,
              thickness: 1.5,
              color: mainColor,
              indent: 8.0,
              endIndent: 8.0,
            ),
          ),
          itemBuilder: (_, index) {
            final author = widget.authors[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (author.images != null &&
                    author.images!.isNotEmpty &&
                    author.images!.first.isNotEmpty)
                  InkWell(
                    onTap: () => context.pushNamed(
                      Routes.image,
                      pathParameters: {
                        'images': jsonEncode(
                          author.images,
                        ).toString(),
                      },
                    ),
                    child: ImageGeneric(
                      author.images!.first,
                      width: 192.0,
                      height: 256.0,
                      borderRadius: BorderRadius.circular(16.0),
                      backgroundColor: colorScheme.outline,
                      fit: BoxFit.cover,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '${author.name != null && author.name!.isNotEmpty && !author.name!.startsWith('NA') && !author.name!.startsWith('-') && !author.name!.startsWith('N/A') ? author.name! : 'Nombre no disponible'} ${author.lastname != null && author.lastname!.isNotEmpty && !author.lastname!.startsWith('NA') && !author.lastname!.startsWith('-') && !author.lastname!.startsWith('N/A') ? author.lastname! : '| Apellidos no disponible'}',
                    style: textTheme.titleLarge?.copyWith(color: mainColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SimpleChip(
                        label:
                            'Profesión: ${author.profession != null && author.profession!.isNotEmpty ? author.profession! : 'No disponible'}'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    author.biography != null && author.biography!.isNotEmpty
                        ? author.biography!
                        : 'Biografía no disponible',
                    style: textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      alignment: WrapAlignment.end,
                      children: [
                        SimpleChip(
                          label:
                              'Nació en: ${author.yearOfBirth != null && author.yearOfBirth!.isNotEmpty ? author.yearOfBirth : 'No disponible'}',
                          backgroundColor: Colors.green,
                        ),
                        SimpleChip(
                          label:
                              'Falleció en: ${author.yearOfDeath != null && author.yearOfDeath!.isNotEmpty ? author.yearOfDeath! : 'No disponible'}',
                          backgroundColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
