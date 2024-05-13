class GenerateSearch {

  GenerateSearch._();
  
  static List<String> generarBusquedas(List<String> querys) {
    List<String> searchGeneartes = [];

    for (String termino in querys) {
      // Agregamos cada término como una búsqueda
      searchGeneartes.add(termino);

      // Generamos subcadenas para cada término
      for (int i = 1; i < termino.length; i++) {
        String subQuery = termino.substring(0, i + 1);
        searchGeneartes.add(subQuery);
      }
    }

    return searchGeneartes;
  }
}
