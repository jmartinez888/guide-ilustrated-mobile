import 'package:species/src/data/models/classes/type_iiap/type_iiap.dart';
import 'package:species/src/domain/entities/type/type.dart';

class TypeMapper {
   TypeC typeIiapToType(TypeIiap type) {
    return TypeC(
      id: type.id,
      name: type.name,
      image: type.image,
      primaryColor: type.primaryColor,
      secondaryColor: type.secondaryColor,
      state: type.state,
    );
  }
}
