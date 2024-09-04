import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import necesario
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/colors.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/icons/custom_icons.dart';
import 'package:species/src/presentation/global/pageStorage/page_storage_bucket.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/amphibians_tab/amphibians_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/birds_tab/birds_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/fishes_tab/fishes_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/insects_tab/insects_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/mammals_tab/mammals_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/palms_tab/palms_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/reptiles_tab/reptiles_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/trees_tab/trees_tab_page.dart';

class SpeciesPage extends StatefulWidget {
  const SpeciesPage({super.key});

  @override
  State<SpeciesPage> createState() => _SpeciesPageState();
}

class _SpeciesPageState extends State<SpeciesPage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> _pageData = [
    {
      'page': const BirdsTabPage(),
      'color': CustomColors.bird,
      'icon': CustomIcons.bird,
      'label': texts.species.birds,
    },
    {
      'page': const MammalsTabPage(),
      'color': CustomColors.mammal,
      'icon': CustomIcons.mammal,
      'label': texts.species.mammals,
    },
    {
      'page': const ReptilesTabPage(),
      'color': CustomColors.reptile,
      'icon': CustomIcons.reptile,
      'label': texts.species.reptiles,
    },
    {
      'page': const AmphibiansTabPage(),
      'color': CustomColors.reptile,
      'icon': CustomIcons.amphibian,
      'label': texts.species.amphibians,
    },
    {
      'page': const FishesTabPage(),
      'color': CustomColors.fish,
      'icon': CustomIcons.fish,
      'label': texts.species.fishes,
    },
    {
      'page': const InsectsTabPage(),
      'color': CustomColors.insect,
      'icon': CustomIcons.insect,
      'label': texts.species.insects,
    },
    {
      'page': const TreesTabPage(),
      'color': CustomColors.tree,
      'icon': CustomIcons.tree,
      'label': texts.species.trees,
    },
    {
      'page': const PalmsTabPage(),
      'color': CustomColors.palm,
      'icon': CustomIcons.palm,
      'label': texts.species.palms,
    },
  ];

  late List<Widget> _pages;

  late List<Color> _tabIndicatorColor;

  late List<Tab> _tabs;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pages = _pageData.map((page) => page['page'] as Widget).toList();
    _tabIndicatorColor =
        _pageData.map((color) => color['color'] as Color).toList();
    _tabs = _pageData.map((tab) {
      return Tab(
        icon: Icon(tab['icon']),
        text: tab['label'],
      );
    }).toList();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {
      _tabController.index;
    });
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Salir de la app?'),
        content: const Text('¿Estás seguro que quieres salir?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // No salir
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(), // Salir de la app
            child: const Text('Sí'),
          ),
        ],
      ),
    );
    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tabBar = ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: TabBar(
        padding: PaddingConfig.symetrictHorizontalL,
        physics: const BouncingScrollPhysics(),
        controller: _tabController,
        splashBorderRadius: BorderRadius.circular(16.0),
        indicatorColor: _tabIndicatorColor[_tabController.index],
        labelColor: _tabIndicatorColor[_tabController.index],
        isScrollable: true,
        onTap: (index) => setState(() => _tabController.index = index),
        tabs: _tabs,
      ),
    );
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: DefaultTabController(
        length: _pageData.length,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: size.height < size.width + 32.0 ? 96.0 : null,
            leading: const SizedBox(),
            title: Row(
              children: [
                Text(texts.species.title),
                if (size.height < size.width + 32.0)
                  Expanded(
                    child: Padding(
                      padding: PaddingConfig.onlyLeft,
                      child: tabBar,
                    ),
                  ),
              ],
            ),
            bottom: size.height < size.width + 32.0
                ? null
                : PreferredSize(
                    preferredSize: const Size(double.infinity, 56.0),
                    child: tabBar,
                  ),
          ),
          body: PageStorage(
            bucket: PersistenScrollPosition.bucketGlobal,
            child: TabBarView(
              key: const PageStorageKey('specieTabs'),
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              children: _pages,
            ),
          ),
        ),
      ),
    );
  }
}
