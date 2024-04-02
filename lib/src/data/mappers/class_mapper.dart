import 'package:species/src/data/models/classes/class_iiap/class_iiap.dart';
import 'package:species/src/domain/entities/class/class.dart';

class ClassMapper {
  ClassC classIiapToClass(ClassIiap classC) {
    return ClassC(
      id: classC.id,
      name: classC.name,
      idPhylum: classC.idPhylum,
      state: classC.state,
    );
  }
}
