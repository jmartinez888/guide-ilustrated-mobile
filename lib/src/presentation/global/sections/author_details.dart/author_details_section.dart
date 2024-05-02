import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/pageStorage/page_storage_bucket.dart';
import 'package:species/src/presentation/global/widgets/card/simple_chip.dart';
import 'package:species/src/presentation/global/widgets/images/image_generic.dart';
import 'package:species/src/presentation/global/widgets/responsives/extend.dart';
import 'package:species/src/presentation/global/widgets/responsives/grid_two_responsive.dart';
import 'package:species/src/presentation/router/routes.dart';

class AuthorSection extends StatefulWidget {
  final Author author;
  const AuthorSection({
    super.key,
    required this.author,
  });

  @override
  State<AuthorSection> createState() => _AuthorSectionState();
}

class _AuthorSectionState extends State<AuthorSection> {
  late Author author;
  late TextStyle titleLarge;
  late TextStyle titleMedium;
  late Color mainColor;
  late Color opaqueColor;
  late TextStyle bodyLarge;

  @override
  void initState() {
    author = widget.author;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    titleLarge = textTheme.titleLarge!;
    titleMedium = textTheme.titleMedium!;
    bodyLarge = textTheme.bodyLarge!;
    mainColor = colorScheme.primary;
    opaqueColor = colorScheme.secondary;
    return Extend(
      child: GridTwoResponsive(
        leftChild: author.images != null &&
                author.images!.isNotEmpty &&
                author.images!.first.isNotEmpty
            ? InkWell(
                borderRadius: BorderRadius.circular(16.0),
                onTap: () => context.pushNamed(
                  Routes.image,
                  pathParameters: {
                    'images': jsonEncode(
                      author.images,
                    ).toString(),
                  },
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ImageGeneric(
                    borderRadius: BorderRadius.circular(16.0),
                    author.images!.first,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : const Icon(Icons.image_not_supported_rounded),
        rightChild: PageStorage(
          bucket: PersistenScrollPosition.bucketGlobal,
          child: CustomScrollView(
            key: const PageStorageKey('au'),
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: PaddingConfig.allL,
                sliver: SliverList.list(
                  children: [
                    Text(
                      '${author.name != null && author.name!.isNotEmpty && !author.name!.startsWith('NA') && !author.name!.startsWith('-') && !author.name!.startsWith('N/A') ? author.name! : 'Nombre no disponible'} ${author.lastname != null && author.lastname!.isNotEmpty && !author.lastname!.startsWith('NA') && !author.lastname!.startsWith('-') && !author.lastname!.startsWith('N/A') ? author.lastname! : '| Apellidos no disponible'}',
                      style: titleLarge.copyWith(color: mainColor),
                    ),
                    if (author.profession != null &&
                        author.profession!.isNotEmpty)
                      Padding(
                        padding: PaddingConfig.onlyTop,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SimpleChip(
                            backgroundColor: mainColor,
                            label:
                                'Profesión: ${author.profession != null && author.profession!.isNotEmpty && !author.profession!.startsWith('NA') && !author.profession!.startsWith('-') && !author.profession!.startsWith('N/A') ? author.profession! : 'Profesión no disponible'}',
                          ),
                        ),
                      ),
                    Padding(
                      padding: PaddingConfig.onlyTopL,
                      child: Text(
                        author.biography != null && author.biography!.isNotEmpty
                            ? author.biography!.replaceAll('\t', '')
                            : 'Biografía no disponible',
                        textAlign: TextAlign.start,
                        style: bodyLarge,
                      ),
                    ),
                    if (author.yearOfBirth != null &&
                        author.yearOfBirth!.isNotEmpty)
                      Padding(
                        padding: PaddingConfig.onlyTopL,
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          alignment: WrapAlignment.end,
                          children: [
                            SimpleChip(
                              label: 'Nació en: ${author.yearOfBirth}',
                              backgroundColor: Colors.green,
                            ),
                            if (author.yearOfDeath != null &&
                                author.yearOfDeath!.isNotEmpty)
                              SimpleChip(
                                label: 'Falleció en: ${author.yearOfDeath}',
                                backgroundColor: Colors.grey,
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
