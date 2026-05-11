import 'dart:convert';
import 'dart:io';

import 'package:species/src/data/models/classes/specie_iiap/specie_iiap.dart';
import 'package:species/src/data/mappers/specie_mapper.dart';
import 'package:species/src/data/mappers/type_mapper.dart';
import 'package:species/src/data/mappers/conservation_state_mapper.dart';
import 'package:species/src/data/mappers/author_mapper.dart';
import 'package:species/src/data/mappers/kindom_mapper.dart';
import 'package:species/src/data/mappers/phylum_mapper.dart';
import 'package:species/src/data/mappers/class_mapper.dart';
import 'package:species/src/data/mappers/order_mapper.dart';
import 'package:species/src/data/mappers/family_mapper.dart';
import 'package:species/src/data/mappers/specie_for_author_mapper.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  
  final mapper = SpecieMapper(
    typeMapper: TypeMapper(),
    conservationStateMapper: ConservationStateMapper(),
    authorMapper: AuthorMapper(specieForAuthorMapper: SpecieForAuthorMapper()),
    kingdomMapper: KingdomMapper(),
    phylumMapper: PhylumMapper(),
    classMapper: ClassMapper(),
    orderMapper: OrderMapper(),
    familyMapper: FamilyMapper()
  );
  
  // Checking trees (type 7) like the first page load!
  final urlstr = 'https://api-amazonia.iiap.gob.pe/api/v1/species/search/type/7/1/16/vc_nombre/ASC';
  try {
    final httpClient = HttpClient();
    final request = await httpClient.getUrl(Uri.parse(urlstr));
    final response = await request.close();
    final body = await response.transform(utf8.decoder).join();
    
    final Map<String, dynamic> data = jsonDecode(body);
    final List species = data['species'];
    print('Found ${species.length} species fields.');
    
    for (int i=0; i<species.length; i++) {
        try {
            final s = SpecieIiap.fromJson(species[i]);
            mapper.specieIiapToSpecie(s);
        } catch(e, st) {
            print('FAILED on index $i: $e');
        }
    }
    print('Finished checking.');
    
  } catch (e) {
    print('Error: $e');
  }
}
