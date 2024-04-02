import 'package:species/src/data/services/remote/family_api.dart';
import 'package:species/src/domain/entities/family/family.dart';
import 'package:species/src/domain/repositories/family/family_repository.dart';

class FamilyRepositoryImpl implements FamilyRepository {
  final FamilyApi _familyApi;

  FamilyRepositoryImpl({required FamilyApi familyApi}) : _familyApi = familyApi;

  @override
  Future<List<Family>> getFamiliesByOrden(int orderId) {
    return _familyApi.getFamiliesByOrden(orderId);
  }
}
