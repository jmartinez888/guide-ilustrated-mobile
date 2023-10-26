import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/domain/entities/class.dart';
import 'package:species/src/domain/entities/family.dart';
import 'package:species/src/domain/entities/order.dart';
import 'package:species/src/domain/entities/specie.dart';

abstract class SpecieRepository {
  Future<void> getSpecies({
    required int pageKey,
    required int type,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
  });

  Future<Specie> getSpecieId(String id);

  Stream<List<Specie>> getFavoriteSpecies();

  Future<void> saveSpecieFavorite({
    required String userId,
    required Specie specie,
  });

  Future<void> deleteSpecieFavorite({
    required String userId,
    required int idSpecie,
  });

  Future<Uint8List> makePdf({
    required Specie specie,
    required String pathIcon,
    required Color mainColor,
  });

  Future<void> filterSpecies({
    String query = '',
    int? family,
    int? order,
    int? class_,
    required int pageKey,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
  });

  Future< List<Class>> getClasses();
  Future<List<OrderClass>> getOrders(); 
  Future<List<Family>> getFamilies();
}
