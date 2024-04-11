import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/presentation/global/widgets/card/custom_expansion_tile.dart';
import 'package:species/src/presentation/global/widgets/card/simple_chip.dart';
import 'package:species/src/presentation/global/widgets/images/image_generic.dart';
import 'package:species/src/presentation/router/routes.dart';

class AuthorToSpecieSection extends StatelessWidget {
  final List<Author> authors;

  const AuthorToSpecieSection({
    super.key,
    required this.authors,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final mainColor = colorScheme.primary;
    return SliverToBoxAdapter(
      child: CustomExpansionTile(
        border: mainColor,
        title: authors.length > 1 ? 'Autores' : 'Autor',
        content: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          itemCount: authors.length,
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
            final author = authors[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (author.image != null && author.image!.isNotEmpty)
                  InkWell(
                    onTap: () => context.pushNamed(
                      Routes.specieImage,
                      pathParameters: {
                        'images': jsonEncode(
                          author.image!,
                        ).toString(),
                      },
                    ),
                    child: ImageGeneric(
                      author.image!,
                      width: 256.0,
                      height: 320.0,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    author.name ?? 'Nombre no disponible',
                    style: textTheme.titleLarge?.copyWith(color: mainColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SimpleChip(
                        label:
                            'Profesión: ${author.profession ?? 'No disponible'}'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    author.biography ?? 'Biografía no disponible',
                    style: textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      alignment: WrapAlignment.end,
                      children: [
                        SimpleChip(
                          label:
                              'Nació en: ${author.yearOfBirth ?? 'No disponible'}',
                          backgroundColor: Colors.green,
                        ),
                        SimpleChip(
                          label:
                              'Falleció en: ${author.yearOfDeath ?? 'No disponible'}',
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
