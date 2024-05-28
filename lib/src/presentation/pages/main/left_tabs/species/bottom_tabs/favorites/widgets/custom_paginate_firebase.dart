import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/sections/favorite/favorites_section_loaging.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/global/widgets/skeleton/skeleton_container.dart';

class CustomPaginateFirestore extends StatelessWidget {
  final Query query;
  final Widget Function(BuildContext, List<DocumentSnapshot<Object?>>, int)
      itemBuilder;
  final Widget Function(Exception)? onError;
  final Widget onErrorWidget;

  const CustomPaginateFirestore({
    super.key,
    required this.query,
    required this.itemBuilder,
    required this.onError,
    required this.onErrorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return PaginateFirestore(
      query: query,
      itemBuilder: (context, snapshot, index) {
        try {
          return itemBuilder(context, snapshot, index);
        } catch (e) {
          return onErrorWidget;
        }
      },
      physics: const BouncingScrollPhysics(),
      itemBuilderType: PaginateBuilderType.listView,
      itemsPerPage: 4,
      isLive: true,
      separator: const SizedBox(height: 8.0),
      bottomLoader: const SkeletonConatiner(height: 256.0),
      padding: PaddingConfig.allBottomSafeL,
      initialLoader: const FavoritesLoaging(),
      onError: onError,
      onEmpty: MessageException(
        text: texts.favorites.withoutSpecies,
        lottie: 'assets/lotties/without_data.json',
      ),
    );
  }
}
