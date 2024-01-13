import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/class.dart';
import 'package:species/src/domain/entities/conservation_status.dart';
import 'package:species/src/domain/entities/family.dart';
import 'package:species/src/domain/entities/order.dart';
import 'package:species/src/domain/entities/specie.dart';
import 'package:species/src/domain/entities/taxonomy.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/search/filters/filters_options.dart';
import 'package:species/src/presentation/router/routes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final int numberOfPostsPerRequest = 16;
  final PagingController<int, Specie> _pagingController =
      PagingController(firstPageKey: 1);

  final specieRepository = SpecieSpeciesIiapRepositoryImpl();
  final searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  int? selectedClass;
  int? selectedOrder;
  int? selectedFamily;
  int? hasSound;
  int? selectedConservationStatus;
  int? taxonomyId;
  String? orderByType;
  String? orderByName;

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
        orderType: orderByType,
        conservationStatus: selectedConservationStatus,
        taxonomyId: taxonomyId,
        orderByName: orderByName,
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
        orderByType != null ||
        selectedConservationStatus != null ||
        taxonomyId != null ||
        orderByName != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isMobile) _appBar(context),
        if (isMobile) _listFilterOptions(context),
        if (!isMobile)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 56),
                width: MediaQuery.of(context).size.width * 0.5,
                child: _searchTextField(),
              ),
              const SizedBox(width: 8.0),
              if (_isFiltered()) _removeFilters(context),
              Expanded(child: _listFilterOptions(context)),
            ],
          ),
        _filterContent(context),
      ],
    );
  }

  Expanded _filterContent(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => Future.sync(() => _pagingController.refresh()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PagedListView<int, Specie>(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Specie>(
                  firstPageErrorIndicatorBuilder: (context) {
                    return _errorIndicator(context, onPressed: () {
                      _pagingController.refresh();
                    });
                  },
                  noItemsFoundIndicatorBuilder: (context) {
                    return _errorIndicator(context, onPressed: () {
                      _pagingController.refresh();
                    });
                  },
                  newPageErrorIndicatorBuilder: (context) {
                    return _errorIndicator(context,
                        onPressed: () => _pagingController.retryLastFailedRequest(),
                        text: 'Algo salió mal. Inténtalo de nuevo');
                  },
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
                      fitImage: false,
                    ),
                    title: Text(item.name),
                    subtitle: Text(item.scientificName,
                        style: const TextStyle(fontStyle: FontStyle.italic)),
                    trailing: const Icon(Icons.chevron_right_rounded),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _listFilterOptions(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: EdgeInsets.only(top: isMobile ? 0 : 10),
      height: 56,
      width: double.infinity,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          // ASC/DESC filter
          _filterOptionButton(
            context: context,
            onPressed: () => _listByAlphabeticOrderDialog(context),
            icon: Icons.view_list_rounded,
            filterValue: orderByType == 'ASC'
                ? 1
                : orderByType == 'DESC'
                    ? 2
                    : null,
            filterName: orderByType == 'ASC'
                ? 'A-Z'
                : orderByType == 'DESC'
                    ? 'Z-A'
                    : 'Listar',
          ),

          // Order by name filter
          _filterOptionButton(
            context: context,
            onPressed: () => _listByNameOrderDialog(context),
            filterValue: orderByName == 'vc_nombre'
                ? 1
                : orderByName == 'vc_nombre_cientifico'
                    ? 2
                    : null,
            icon: Icons.sort_by_alpha_rounded,
            filterName: orderByName == 'vc_nombre'
                ? 'Común'
                : orderByName == 'vc_nombre_cientifico'
                    ? 'Científico'
                    : 'Ordenar',
          ),

          // Add class filter
          _filterOptionButton(
            context: context,
            onPressed: () => _filterByClassDialog(context),
            filterValue: selectedClass,
            icon: Icons.class_rounded,
            filterName: 'Taxonomía',
          ),

          // Add order filter
          if (selectedClass != null)
            _filterOptionButton(
              context: context,
              onPressed: () => _filterByOrderDialog(context),
              filterValue: selectedOrder,
              icon: Icons.sort_rounded,
              filterName: 'Orden',
            ),

          // Add family filter
          if (selectedOrder != null)
            _filterOptionButton(
              context: context,
              onPressed: () => _filterByFamilyDialog(context),
              filterValue: selectedFamily,
              icon: Icons.family_restroom_rounded,
              filterName: 'Familia',
            ),

          // Add sound filter
          _filterOptionButton(
            context: context,
            onPressed: () => _filterBySoundDialog(context),
            filterValue: hasSound,
            icon: hasSound == 1
                ? Icons.volume_up_rounded
                : hasSound == 0
                    ? Icons.volume_off_rounded
                    : Icons.volume_up_rounded,
            filterName: hasSound == 1
                ? 'Con sonido'
                : hasSound == 0
                    ? 'Sin sonido'
                    : 'Sonido',
          ),

          // Add conservation status filter
          _filterOptionButton(
            context: context,
            onPressed: () => _filterByConservationStatusDialog(context),
            filterValue: selectedConservationStatus,
            icon: Icons.eco_rounded,
            filterName: 'Conservación',
          ),

          //Add category filter
          _filterOptionButton(
            context: context,
            onPressed: () => _filterByCategoryDialog(context),
            filterValue: taxonomyId,
            icon: Icons.category_rounded,
            filterName: taxonomyId == 1
                ? 'Aves'
                : taxonomyId == 2
                    ? 'Mamiferos'
                    : taxonomyId == 3
                        ? 'Reptiles'
                        : taxonomyId == 4
                            ? 'Anfibios'
                            : taxonomyId == 5
                                ? 'Peces'
                                : taxonomyId == 6
                                    ? 'Insectos'
                                    : taxonomyId == 7
                                        ? 'Arboles'
                                        : taxonomyId == 8
                                            ? 'Palmeras'
                                            : 'Categoria',
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _searchTextField(),
      actions: <Widget>[
        if (_isFiltered()) _removeFilters(context),
        const SizedBox(width: 16.0),
      ],
    );
  }

  Widget _removeFilters(BuildContext context) {
    return CustomIconButton(
        backgroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        tooltip: 'Limpiar filtros',
        onPressed: () => setState(
              () {
                selectedClass = null;
                selectedOrder = null;
                selectedFamily = null;
                hasSound = null;
                orderByType = null;
                selectedConservationStatus = null;
                taxonomyId = null;
                orderByName = null;
                _pagingController.refresh();
              },
            ),
        icon: Icons.filter_list_off_rounded);
  }

  TextFormField _searchTextField() {
    return TextFormField(
      focusNode: _focusNode,
      onTapOutside: (event) => _focusNode.unfocus(),
      controller: searchController,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        fillColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
        hintText: 'Buscar especie',
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: searchController.text.isNotEmpty
            ? IconButton(
                tooltip: 'Limpiar',
                onPressed: () => setState(
                      () {
                        searchController.clear();
                        _pagingController.refresh();
                      },
                    ),
                icon: const Icon(Icons.clear_rounded))
            : null,
      ),
      onChanged: (value) => setState(() {
        searchController.text = value;
        _pagingController.refresh();
      }),
    );
  }

  void _listByAlphabeticOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ListAlphabeticOrder(
          orderAscDesc: orderByType,
          onValueChanged: (value) {
            setState(() {
              orderByType = value;
              _pagingController.refresh();
            });
          },
          onDialogClosed: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  _listByNameOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ListByNameOrder(
          orderName: orderByName,
          onValueChanged: (value) {
            setState(() {
              orderByName = value;
              _pagingController.refresh();
            });
          },
          onDialogClosed: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _filterBySoundDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return FilterBySoundDialog(
          hasSound: hasSound,
          onValueChanged: (value) {
            setState(() {
              hasSound = value;
              _pagingController.refresh();
            });
          },
          onDialogClosed: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _filterByCategoryDialog(BuildContext context) {
    showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return FutureBuilder<List<Taxonomy>>(
          future: specieRepository.getTaxonomies(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Taxonomy>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const ErrorFetchingDropdown(
                title: 'Error al cargar categorías',
                content: 'Inténtalo de nuevo',
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const ErrorFetchingDropdown(
                title: 'No se encontraron categorías',
                content: 'No se encontraron categorías. Inténtalo nuevamente.',
              );
            } else {
              final List<Taxonomy> taxonomies = snapshot.data!;
              return FilterByCategoryDialog(
                taxonomyId: taxonomyId,
                onValueChanged: (value) {
                  setState(() {
                    taxonomyId = value;
                    _pagingController.refresh();
                  });
                },
                onDialogClosed: () {
                  Navigator.pop(context);
                },
                taxonomyList: taxonomies,
              );
            }
          },
        );
      },
    );
  }

  void _filterByClassDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return FutureBuilder<List<Class>>(
          future: specieRepository.getClasses(),
          builder: (BuildContext context, AsyncSnapshot<List<Class>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const ErrorFetchingDropdown(
                title: 'Error al cargar clases',
                content: 'Inténtalo de nuevo',
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const ErrorFetchingDropdown(
                title: 'No se encontraron clases',
                content: 'No se encontraron clases. Inténtalo nuevamente.',
              );
            } else {
              final List<Class> classes = snapshot.data!;
              return FilterByClassDialog(
                selectedClass: selectedClass,
                onClassValueChanged: (value) {
                  setState(() {
                    selectedClass = value;
                    selectedOrder = null;
                    selectedFamily = null;
                    _pagingController.refresh();
                  });
                },
                onDialogClosed: () {
                  Navigator.pop(context);
                },
                classes: classes,
              );
            }
          },
        );
      },
    );
  }

  void _filterByOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return FutureBuilder<List<OrderClass>>(
          future: specieRepository.getOrdersByClassId(selectedClass!),
          builder:
              (BuildContext context, AsyncSnapshot<List<OrderClass>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const ErrorFetchingDropdown(
                title: 'Error al cargar ordenes',
                content: 'Inténtalo nuevamente.',
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const ErrorFetchingDropdown(
                title: 'No se encontraron ordenes',
                content:
                    'No se encontraron ordenes en esta clase. Inténtalo con otra clase.',
              );
            } else {
              final List<OrderClass> orders = snapshot.data!;
              return FilterByOrderDialog(
                selectedOrder: selectedOrder,
                onOrderValueChanged: (value) {
                  setState(() {
                    selectedOrder = value;
                    selectedFamily = null;
                    _pagingController.refresh();
                  });
                },
                onDialogClosed: () {
                  Navigator.pop(context);
                },
                orders: orders,
              );
            }
          },
        );
      },
    );
  }

  void _filterByFamilyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return FutureBuilder<List<Family>>(
          future: specieRepository.getFamilies(selectedOrder!),
          builder:
              (BuildContext context, AsyncSnapshot<List<Family>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const ErrorFetchingDropdown(
                title: 'Error al cargar familias',
                content: 'Inténtalo nuevamente.',
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const ErrorFetchingDropdown(
                title: 'No se encontraron familias',
                content:
                    'No se encontraron familias en esta orden. Inténtalo con otra orden.',
              );
            } else {
              final List<Family> families = snapshot.data!;
              return FilterByFamilyDialog(
                selectedFamily: selectedFamily,
                onFamilyValueChanged: (value) {
                  setState(() {
                    selectedFamily = value;
                    _pagingController.refresh();
                  });
                },
                onDialogClosed: () {
                  Navigator.pop(context);
                },
                families: families,
              );
            }
          },
        );
      },
    );
  }

  void _filterByConservationStatusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return FutureBuilder<List<ConservationStatus>>(
          future: specieRepository.getConservationStatus(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ConservationStatus>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const ErrorFetchingDropdown(
                title: 'Error al cargar estados de conservación',
                content: 'Inténtalo nuevamente.',
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const ErrorFetchingDropdown(
                title: 'No se encontraron estados de conservación',
                content:
                    'No se encontraron estados de conservación. Inténtalo nuevamente.',
              );
            } else {
              final List<ConservationStatus> conservationStatusList =
                  snapshot.data!;
              return FilterByConservationStatusDialog(
                selectedConservationStatus: selectedConservationStatus,
                onValueChanged: (value) {
                  setState(() {
                    selectedConservationStatus = value;
                    _pagingController.refresh();
                  });
                },
                onDialogClosed: () {
                  Navigator.pop(context);
                },
                conservationStatusesList: conservationStatusList,
              );
            }
          },
        );
      },
    );
  }
}

class ErrorFetchingDropdown extends StatelessWidget {
  final String title;
  final String content;

  const ErrorFetchingDropdown({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: Text(content),
      titlePadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}

Column _errorIndicator(BuildContext context, {String? text,  final void Function()? onPressed}) {
  return Column(
    children: [
      Lottie.asset(
        'assets/lotties/without_data.json',
        width: 256.0,
        height: 256.0,
      ),
      const SizedBox(height: 16.0),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            Text(
              text ??
                  'No se encontraron especies relacionadas a tu búsqueda. Inténtalo de nuevo con otra clase, orden o familia.',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            FilledButton.icon(
                  onPressed: onPressed,
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Actualizar'),
                ),
          ],
        ),
      ),
    ],
  );
}

Container _filterOptionButton({
  required BuildContext context,
  required void Function()? onPressed,
  int? filterValue,
  required IconData icon,
  required String filterName,
}) {
  return Container(
    margin: const EdgeInsets.only(right: 4.0),
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: filterValue != null
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            size: 20.0,
          ),
          Text(filterName),
        ],
      ),
    ),
  );
}
