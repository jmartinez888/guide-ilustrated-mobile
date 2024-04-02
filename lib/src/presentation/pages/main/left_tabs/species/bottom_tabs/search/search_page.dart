import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:species/src/data/models/classes/taxonomy_for_search_iiap/taxonomy_for_search_iiap.dart';
import 'package:species/src/domain/entities/class/class.dart';
import 'package:species/src/domain/entities/conservation_states/conservation_states.dart';
import 'package:species/src/domain/entities/family/family.dart';
import 'package:species/src/domain/entities/order/order.dart';
import 'package:species/src/domain/entities/specie/specie.dart';
import 'package:species/src/domain/repositories/class/class_repository.dart';
import 'package:species/src/domain/repositories/family/family_repository.dart';
import 'package:species/src/domain/repositories/order/order_repository.dart';
import 'package:species/src/domain/repositories/specie/specie_repository.dart';
import 'package:species/src/domain/repositories/conservation_states/conservation_states_repository.dart';
import 'package:species/src/domain/repositories/taxonomy/taxonomy_repository.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/containers/custom_image_container.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/search/filters/filters_options.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:species/src/generated/translations.g.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final int numberOfPostsPerRequest = 16;
  final PagingController<int, Specie> _pagingController =
      PagingController(firstPageKey: 1);

  SpecieRepository get specieRepository => context.read();
  TaxonomyRepository get texonomyRepository => context.read();
  ClassRepository get classRepository => context.read();
  OrderRepository get orderRepository => context.read();
  FamilyRepository get familyRepository => context.read();
  ConservationStatesRepository get stateOfConservationRepository => context.read();
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
                        onPressed: () =>
                            _pagingController.retryLastFailedRequest(),
                        text: texts.searchPage.failedRequest);
                  },
                  animateTransitions: true,
                  transitionDuration: const Duration(milliseconds: 400),
                  itemBuilder: (context, item, index) => ListTile(
                    onTap: () => context.pushNamed(
                      Routes.specieDetails,
                      pathParameters: {'id': item.id.toString()},
                    ),
                    leading: CustomImageContainer(
                      imageUrl: item.images != null && item.images
                      !.isNotEmpty ? item.images!.first : null,
                      heightImage: 56.0,
                      width: 56.0,
                      fitImage: false,
                    ),
                    title: item.name != null && item.name!.isNotEmpty
                        ? Text(item.name!)
                        : null,
                    subtitle: item.scientificName != null &&
                            item.scientificName!.isNotEmpty
                        ? Text(
                            item.scientificName!,
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        : null,
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
                    : texts.searchPage.recentlyAdded,
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
                ? texts.searchPage.nameFilter.common
                : orderByName == 'vc_nombre_cientifico'
                    ? texts.searchPage.nameFilter.scientific
                    : texts.searchPage.nameFilter.order,
          ),

          // Add class filter
          _filterOptionButton(
              context: context,
              onPressed: () => _filterByClassDialog(context),
              filterValue: selectedClass,
              icon: Icons.class_rounded,
              filterName: texts.searchPage.taxonomyFilter),

          // Add order filter
          if (selectedClass != null)
            _filterOptionButton(
              context: context,
              onPressed: () => _filterByOrderDialog(context),
              filterValue: selectedOrder,
              icon: Icons.sort_rounded,
              filterName: texts.searchPage.orderFilter,
            ),

          // Add family filter
          if (selectedOrder != null)
            _filterOptionButton(
              context: context,
              onPressed: () => _filterByFamilyDialog(context),
              filterValue: selectedFamily,
              icon: Icons.family_restroom_rounded,
              filterName: texts.searchPage.familyFilter,
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
                ? texts.searchPage.soundFilter.withSound
                : hasSound == 0
                    ? texts.searchPage.soundFilter.withoutSound
                    : texts.searchPage.soundFilter.sound,
          ),

          // Add conservation status filter
          _filterOptionButton(
            context: context,
            onPressed: () => _filterByConservationStatusDialog(context),
            filterValue: selectedConservationStatus,
            icon: Icons.eco_rounded,
            filterName: texts.searchPage.conservationFilter,
          ),

          //Add category filter
          _filterOptionButton(
              context: context,
              onPressed: () => _filterByCategoryDialog(context),
              filterValue: taxonomyId,
              icon: Icons.category_rounded,
              filterName: taxonomyId == 1
                  ? texts.searchPage.categoryFilter.birds
                  : taxonomyId == 2
                      ? texts.searchPage.categoryFilter.mammals
                      : taxonomyId == 3
                          ? texts.searchPage.categoryFilter.reptiles
                          : taxonomyId == 4
                              ? texts.searchPage.categoryFilter.amphibians
                              : taxonomyId == 5
                                  ? texts.searchPage.categoryFilter.fish
                                  : taxonomyId == 6
                                      ? texts.searchPage.categoryFilter.insects
                                      : taxonomyId == 7
                                          ? texts
                                              .searchPage.categoryFilter.plants
                                          : taxonomyId == 8
                                              ? texts.searchPage.categoryFilter
                                                  .palms
                                              : texts.searchPage.categoryFilter
                                                  .category),
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
        tooltip: texts.searchPage.cleanFilters,
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
        hintText: texts.searchPage.searchSpecies,
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: searchController.text.isNotEmpty
            ? IconButton(
                tooltip: texts.searchPage.cleanSearch,
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
        return FutureBuilder<List<TaxonomyForSearchIiap>>(
          future: texonomyRepository.getTaxonomies(),
          builder:
              (BuildContext context, AsyncSnapshot<List<TaxonomyForSearchIiap>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return ErrorFetchingDropdown(
                title: texts.searchPage.errorFetchingTitle,
                content: texts.searchPage.errorFetchingContent,
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return ErrorFetchingDropdown(
                title: texts.searchPage.notResultsTitle,
                content: texts.searchPage.notResultsContent,
              );
            } else {
              final List<TaxonomyForSearchIiap> taxonomies = snapshot.data!;
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
        return FutureBuilder<List<ClassC>>(
          future: classRepository.getClasses(),
          builder:
              (BuildContext context, AsyncSnapshot<List<ClassC>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return ErrorFetchingDropdown(
                title: texts.searchPage.errorFetchingTitle,
                content: texts.searchPage.errorFetchingContent,
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return ErrorFetchingDropdown(
                title: texts.searchPage.notResultsTitle,
                content: texts.searchPage.notResultsContent,
              );
            } else {
              final List<ClassC> classes = snapshot.data!;
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
        return FutureBuilder<List<OrderC>>(
          future: orderRepository.getOrdersByClassId(selectedClass!),
          builder:
              (BuildContext context, AsyncSnapshot<List<OrderC>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return ErrorFetchingDropdown(
                title: texts.searchPage.errorFetchingTitle,
                content: texts.searchPage.errorFetchingContent,
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return ErrorFetchingDropdown(
                title: texts.searchPage.notResultsTitle,
                content: texts.searchPage.notResultsContent,
              );
            } else {
              final List<OrderC> orders = snapshot.data!;
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
          future: familyRepository.getFamiliesByOrden(selectedOrder!),
          builder:
              (BuildContext context, AsyncSnapshot<List<Family>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return ErrorFetchingDropdown(
                title: texts.searchPage.errorFetchingTitle,
                content: texts.searchPage.errorFetchingContent,
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return ErrorFetchingDropdown(
                title: texts.searchPage.notResultsTitle,
                content: texts.searchPage.notResultsContent,
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
        return FutureBuilder<List<ConservationStates>>(
          future: stateOfConservationRepository.getStateOfConservations(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ConservationStates>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return ErrorFetchingDropdown(
                title: texts.searchPage.errorFetchingTitle,
                content: texts.searchPage.errorFetchingContent,
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return ErrorFetchingDropdown(
                title: texts.searchPage.notResultsTitle,
                content: texts.searchPage.notResultsContent,
              );
            } else {
              final List<ConservationStates> conservationStatusList =
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
          child: Text(texts.searchPage.acceptText),
        ),
      ],
    );
  }
}

Column _errorIndicator(BuildContext context,
    {String? text, final void Function()? onPressed}) {
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
              text ?? texts.searchPage.errorFetchingSpecies,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            FilledButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(texts.searchPage.updateText),
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
