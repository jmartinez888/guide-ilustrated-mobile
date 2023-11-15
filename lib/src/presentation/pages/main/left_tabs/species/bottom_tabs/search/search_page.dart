import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:species/src/data/repositories_implementation/species_iiap/specie_species_iiap_repository_impl.dart';
import 'package:species/src/domain/entities/class.dart';
import 'package:species/src/domain/entities/family.dart';
import 'package:species/src/domain/entities/order.dart';
import 'package:species/src/domain/entities/specie.dart';
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
                    return _errorIndicator(context);
                  },
                  noItemsFoundIndicatorBuilder: (context) {
                    return _errorIndicator(context);
                  },
                  newPageErrorIndicatorBuilder: (context) {
                    return _errorIndicator(context,
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
    );
  }

  Column _errorIndicator(BuildContext context, {String? text}) {
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
          child: Text(
            text ?? 'Parece que no hay especies aquí',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Container _listFilterOptions(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: EdgeInsets.only(left: isMobile ? 16 : 8),
      height: 56,
      width: double.infinity,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          // ASC/DESC filter
          Container(
            margin: const EdgeInsets.only(right: 4.0),
            child: TextButton(
              style: TextButton.styleFrom(
                // backgroundColor: orderNameScientific != null
                //     ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                //     : null,
                foregroundColor: orderNameScientific != null
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                _orderByNameScientificDialog(context);
              },
              child: Column(
                children: [
                  const Icon(
                    Icons.sort_by_alpha_rounded,
                    size: 20.0,
                  ),
                  Text(
                    orderNameScientific == 'ASC'
                        ? 'Ascendente'
                        : orderNameScientific == 'DESC'
                            ? 'Descendente'
                            : 'Ordenar',
                  ),
                ],
              ),
            ),
          ),

          // Add sound filter
          _filterOptionButton(
            context: context,
            onPressed: () => _filterBySoundDialog(context),
            filterValue: hasSound,
            icon: Icons.volume_up_rounded,
            filterName: hasSound == 1
                ? 'Con sonido'
                : hasSound == 0
                    ? 'Sin sonido'
                    : 'Sonido',
          ),

          // Add conservation status filter
          _filterOptionButton(
            context: context,
            onPressed: () => _filterByConservationStatusDialog(
              context,
            ),
            filterValue: conservationStatus,
            icon: Icons.eco_rounded,
            filterName: conservationStatus == 1
                ? 'En peligro'
                : conservationStatus == 2
                    ? 'Vulnerable'
                    : conservationStatus == 3
                        ? 'Casi amenazado'
                        : conservationStatus == 4
                            ? 'Preocupación menor'
                            : 'Estado',
          ),

          // Add taxonomy filter
          _filterOptionButton(
            context: context,
            onPressed: () => _filterByTaxonomyDialog(context),
            filterValue: taxonomyId,
            icon: Icons.category_rounded,
            filterName: taxonomyId == 1
                ? 'Taxonomía 1'
                : taxonomyId == 2
                    ? 'Taxonomía 2'
                    : taxonomyId == 3
                        ? 'Taxonomía 3'
                        : taxonomyId == 4
                            ? 'Taxonomía 4'
                            : 'Taxonomía',
          ),

          // Add class filter
          _filterOptionButton(
            context: context,
            onPressed: () => _filterByClassDialog(context),
            filterValue: selectedClass,
            icon: Icons.class_rounded,
            filterName: 'Clase',
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
                orderNameScientific = null;
                conservationStatus = null;
                taxonomyId = null;
                _pagingController.refresh();
              },
            ),
        icon: Icons.clear_all_rounded);
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
        hintStyle: const TextStyle(color: Colors.black26, fontSize: 16.0),
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

  void _orderByNameScientificDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return OrderByNameScientificDialog(
          orderNameScientific: orderNameScientific,
          onValueChanged: (value) {
            setState(() {
              orderNameScientific = value;
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

  void _filterByConservationStatusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return FilterByConservationStatusDialog(
          conservationStatus: conservationStatus,
          onValueChanged: (value) {
            setState(() {
              conservationStatus = value;
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

  void _filterByTaxonomyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return FilterByTaxonomyDialog(
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
              return const Text('Error al cargar las clases');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No se encontraron clases');
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
              return const Text('Error al cargar las clases');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No se encontraron clases');
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
              return const Text('Error al cargar las clases');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No se encontraron clases');
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
}

Container _filterOptionButton({
  required BuildContext context,
  required void Function()? onPressed,
  required int? filterValue,
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
        // backgroundColor: filterValue != null
        //     ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
        //     : null,
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
