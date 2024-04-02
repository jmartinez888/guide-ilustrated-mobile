import 'package:species/src/domain/entities/family/family.dart';

abstract class FamilyRepository {
  Future<List<Family>> getFamiliesByOrden(int orderId);
}
