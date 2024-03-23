import 'package:species/src/data/models/classes/family_iiap/family_iiap.dart';
import 'package:species/src/domain/entities/family/family.dart';

class FamilyMapper {
  Family familyIiapToFamily(FamilyIiap family) {
    return Family(
      id: family.id,
      name: family.name,
      idOrder: family.idOrder,
      state: family.state,
    );
  }
}
