import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:species/src/domain/entities/kindom/kindom.dart';

class KingdomMapIntoClass implements JsonConverter<Kingdom, dynamic> {
  const KingdomMapIntoClass();

  @override
  Kingdom fromJson(dynamic kingdom) => Kingdom.fromJson(kingdom);

  @override
  Map<String, dynamic> toJson(Kingdom kingdom) => kingdom.toJson();
}