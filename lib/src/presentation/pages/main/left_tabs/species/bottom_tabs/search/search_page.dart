import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/class.dart';
import 'package:species/src/domain/entities/family.dart';
import 'package:species/src/domain/entities/order.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/router/routes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final int numberOfPostsPerRequest = 32;
  final PagingController<int, Specie> _pagingController =
      PagingController(firstPageKey: 1);

  final specieRepository = SpecieSpeciesIiapRepositoryImpl();
  final searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  int? selectedClass;
  int? selectedOrder;
  int? selectedFamily;
  int? hasSound;
  int? conservationStatus;
  int? taxonomyId;
  String? orderNameScientific;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      specieRepository.filterSpecies(
        numberOfPostsPerRequest: numberOfPostsPerRequest,
        pageKey: pageKey,
        pagingController: _pagingController,
        query: searchController.text.trim(),
        class_: selectedClass,
        order: selectedOrder,
        hasSound: hasSound,
        family: selectedFamily,
        orderNameScientific: orderNameScientific,
        conservationStatus: conservationStatus,
        taxonomyId: taxonomyId,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  _isFiltered() {
    if (selectedClass != null ||
        selectedOrder != null ||
        selectedFamily != null ||
        hasSound != null ||
        orderNameScientific != null ||
        conservationStatus != null ||
        taxonomyId != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          title: TextField(
            focusNode: _focusNode,
            onTapOutside: (event) => _focusNode.unfocus(),
            controller: searchController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Búsqueda general',
            ),
            onChanged: (value) => setState(() {
              searchController.text = value;
              _pagingController.refresh();
            }),
          ),
          actions: <Widget>[
            searchController.text.isNotEmpty
                ? IconButton(
                    tooltip: 'Limpiar',
                    onPressed: () => setState(
                          () {
                            searchController.clear();
                            _pagingController.refresh();
                          },
                        ),
                    icon: const Icon(Icons.clear_rounded))
                : IconButton(
                    tooltip: 'Buscar',
                    onPressed: () {
                      _focusNode.requestFocus();
                    },
                    icon: const Icon(Icons.search_rounded)),
            const SizedBox(width: 8.0),
            if (_isFiltered())
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                ),
                tooltip: 'Limpiar filtros',
                onPressed: () => setState(
                  () {
                    selectedClass = null;
                    selectedOrder = null;
                    selectedFamily = null;
                    hasSound = null;
                    orderNameScientific = null;
                    conservationStatus = null;
                    taxonomyId = null;
                    _pagingController.refresh();
                  },
                ),
                icon: const Icon(Icons.clear_rounded),
              ),
            // if (!_isFiltered())
            //   IconButton(
            //     tooltip: 'Filtros',
            //     onPressed: () {
            //       _focusNode.unfocus();
            //       _filterByClassDialog(context);
            //     },
            //     icon: const Icon(Icons.filter_alt_rounded),
            //   ),
            const SizedBox(width: 8.0),
          ],
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => Future.sync(() => _pagingController.refresh()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  height: 50,
                  width: double.infinity,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      // ASC/DESC filter
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: orderNameScientific != null
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.3)
                                : null),
                        onPressed: () {
                          _orderByNameScientificDialog(context);
                        },
                        child: const Text('Ordenar por nombre científico'),
                      ),

                      // Add sound filter
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: hasSound != null
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.3)
                                : null),
                        onPressed: () {
                          _filterBySoundDialog(context);
                        },
                        child: const Text('Filtrar por sonido'),
                      ),

                      // Add conservation status filter
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: conservationStatus != null
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.3)
                                : null),
                        onPressed: () {
                          _filterByConservationStatusDialog(context);
                        },
                        child: const Text('Filtrar por estado de conservación'),
                      ),

                      // Add taxonomy filter
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: taxonomyId != null
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.3)
                                : null),
                        onPressed: () {
                          _filterByTaxonomyDialog(context);
                        },
                        child: const Text('Filtrar por taxonomía'),
                      ),

                      // Add class filter
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: selectedClass != null
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.3)
                                : null),
                        onPressed: () {
                          _filterByClassDialog(context);
                        },
                        child: const Text('Filtro clase'),
                      ),

                      // Add order filter
                      if (selectedClass != null)
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: selectedOrder != null
                                  ? Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.3)
                                  : null),
                          onPressed: () {
                            _filterByOrderDialog(context);
                          },
                          child: const Text('Filtro orden'),
                        ),

                      // Add family filter
                      if (selectedOrder != null)
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: selectedFamily != null
                                  ? Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.3)
                                  : null),
                          onPressed: () {
                            _filterByFamilyDialog(context);
                          },
                          child: const Text('Filtro familia'),
                        )
                    ],
                  ),
                ),
                Expanded(
                  child: PagedListView<int, Specie>(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
                    pagingController: _pagingController,
                    builderDelegate: PagedChildBuilderDelegate<Specie>(
                      firstPageErrorIndicatorBuilder: (context) =>
                          errorIndicator(
                        error: _pagingController.error,
                        onTryAgain: () => _pagingController.refresh(),
                      ),
                      newPageProgressIndicatorBuilder: (_) =>
                          const LinearProgressIndicator(),
                      animateTransitions: true,
                      transitionDuration: const Duration(milliseconds: 400),
                      itemBuilder: (context, item, index) => ListTile(
                        onTap: () => context.pushNamed(
                          Routes.specieDetails,
                          pathParameters: {'id': item.id.toString()},
                        ),
                        leading: CustomImageContainer(
                          imageUrl: item.images.first,
                          heightImage: 56.0,
                          width: 56.0,
                          fitImage: true,
                        ),
                        title: Text(item.name),
                        subtitle: Text(item.scientificName),
                        trailing: const Icon(Icons.chevron_right_rounded),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _orderByNameScientificDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ordenar por nombre científico'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: const Text('Ascendente'),
                value: 'ASC',
                groupValue: orderNameScientific,
                onChanged: (value) {
                  setState(() {
                    orderNameScientific = value as String;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Descendente'),
                value: 'DESC',
                groupValue: orderNameScientific,
                onChanged: (value) {
                  setState(() {
                    orderNameScientific = value as String;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Ninguno'),
                value: null,
                groupValue: orderNameScientific,
                onChanged: (value) {
                  setState(() {
                    orderNameScientific = value;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _filterBySoundDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filtrar por sonido'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: const Text('Con sonido'),
                value: 1,
                groupValue: hasSound,
                onChanged: (value) {
                  setState(() {
                    hasSound = value as int;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Sin sonido'),
                value: 0,
                groupValue: hasSound,
                onChanged: (value) {
                  setState(() {
                    hasSound = value as int;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Ninguno'),
                value: null,
                groupValue: hasSound,
                onChanged: (value) {
                  setState(() {
                    hasSound = value;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _filterByConservationStatusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filtrar por estado de conservación'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: const Text('En peligro'),
                value: 1,
                groupValue: conservationStatus,
                onChanged: (value) {
                  setState(() {
                    conservationStatus = value as int;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Vulnerable'),
                value: 2,
                groupValue: conservationStatus,
                onChanged: (value) {
                  setState(() {
                    conservationStatus = value as int;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Casi amenazado'),
                value: 3,
                groupValue: conservationStatus,
                onChanged: (value) {
                  setState(() {
                    conservationStatus = value as int;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Preocupación menor'),
                value: 4,
                groupValue: conservationStatus,
                onChanged: (value) {
                  setState(() {
                    conservationStatus = value as int;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Ninguno'),
                value: null,
                groupValue: conservationStatus,
                onChanged: (value) {
                  setState(() {
                    conservationStatus = value;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _filterByTaxonomyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filtrar por taxonomía'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: const Text('Taxonomía 1'),
                value: 1,
                groupValue: taxonomyId,
                onChanged: (value) {
                  setState(() {
                    taxonomyId = value as int;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Taxonomía 2'),
                value: 2,
                groupValue: taxonomyId,
                onChanged: (value) {
                  setState(() {
                    taxonomyId = value as int;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Taxonomía 3'),
                value: 3,
                groupValue: taxonomyId,
                onChanged: (value) {
                  setState(() {
                    taxonomyId = value as int;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Taxonomía 4'),
                value: 4,
                groupValue: taxonomyId,
                onChanged: (value) {
                  setState(() {
                    taxonomyId = value as int;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: const Text('Ninguno'),
                value: null,
                groupValue: taxonomyId,
                onChanged: (value) {
                  setState(() {
                    taxonomyId = value;
                    _pagingController.refresh();
                  });
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _filterByClassDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filtro personalizado'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder<List<Class>>(
                future: specieRepository.getClasses(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Class>> snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error al cargar las clases');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No se encontraron clases');
                  } else {
                    final List<Class> classes = snapshot.data!;
                    return CustomDropdown<String>(
                      headerBuilder: (context, selectedItem) {
                        return selectedClass == null
                            ? const Text('Selecciona una clase',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16.0))
                            : Text(selectedItem,
                                style: const TextStyle(fontSize: 16.0));
                      },
                      searchHintText: 'Buscar clase',
                      hintText: 'Selecciona una clase',
                      excludeSelected: false,
                      noResultFoundText: 'No se encontraron resultados',
                      items: classes.map((item) => item.name).toList(),
                      onChanged: (value) {
                        final selectedClassId =
                            classes.firstWhere((item) => item.name == value).id;
                        setState(() {
                          selectedClass = selectedClassId;
                          selectedOrder = null;
                          selectedFamily = null;
                          _pagingController.refresh();
                        });
                      },
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _filterByOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filtro orden'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder<List<OrderClass>>(
                future: specieRepository.getOrdersByClassId(selectedClass!),
                builder: (BuildContext context,
                    AsyncSnapshot<List<OrderClass>> snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error al cargar las clases');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No se encontraron clases');
                  } else {
                    final List<OrderClass> orders = snapshot.data!;
                    return CustomDropdown<String>(
                      headerBuilder: (context, selectedItem) {
                        return selectedOrder == null
                            ? const Text('Selecciona una clase',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16.0))
                            : Text(selectedItem,
                                style: const TextStyle(fontSize: 16.0));
                      },
                      searchHintText: 'Buscar clase',
                      hintText: 'Selecciona una clase',
                      excludeSelected: false,
                      noResultFoundText: 'No se encontraron resultados',
                      items: orders.map((item) => item.name).toList(),
                      onChanged: (value) {
                        final selectedOrderId =
                            orders.firstWhere((item) => item.name == value).id;
                        setState(() {
                          selectedOrder = selectedOrderId;
                          selectedFamily = null;
                          _pagingController.refresh();
                        });
                      },
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _filterByFamilyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filtro familia'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder<List<Family>>(
                future: specieRepository.getFamilies(selectedOrder!),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Family>> snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error al cargar las clases');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No se encontraron clases');
                  } else {
                    final List<Family> families = snapshot.data!;
                    return CustomDropdown<String>(
                      headerBuilder: (context, selectedItem) {
                        return selectedFamily == null
                            ? const Text('Selecciona una clase',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16.0))
                            : Text(selectedItem,
                                style: const TextStyle(fontSize: 16.0));
                      },
                      searchHintText: 'Buscar clase',
                      hintText: 'Selecciona una clase',
                      excludeSelected: false,
                      noResultFoundText: 'No se encontraron resultados',
                      items: families.map((item) => item.name).toList(),
                      onChanged: (value) {
                        final selectedFamilyId = families
                            .firstWhere((item) => item.name == value)
                            .id;
                        setState(() {
                          selectedFamily = selectedFamilyId;
                          _pagingController.refresh();
                        });
                      },
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget errorIndicator({
  required Object? error,
  required VoidCallback onTryAgain,
}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 150.0,
          width: 150.0,
        ),
        const Text('No se econtraron familias'),
        const SizedBox(height: 8.0),
        FilledButton.icon(
          onPressed: onTryAgain,
          icon: const Icon(Icons.refresh_rounded),
          label: const Text('Reintentar'),
        )
      ],
    ),
  );
}
