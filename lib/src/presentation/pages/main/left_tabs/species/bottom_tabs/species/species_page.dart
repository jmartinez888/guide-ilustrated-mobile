import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/colors.dart';
import 'package:species/src/presentation/global/icons/custom_icons.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/amphibians_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/birs_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/fishes_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/insects_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/mammals_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/palms_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/reptiles_tab_page.dart';
import 'package:species/src/presentation/pages/main/left_tabs/species/bottom_tabs/species/top_tabs/trees_tab_page.dart';

class SpeciesPage extends StatefulWidget {
  const SpeciesPage({super.key});

  @override
  State<SpeciesPage> createState() => _SpeciesPageState();
}

class _SpeciesPageState extends State<SpeciesPage>
    with SingleTickerProviderStateMixin {
  static const List<Map<String, dynamic>> _pageData = [
    {
      'page': BirdsTabPage(),
      'color': CustomColors.bird,
      'icon': CustomIcons.bird,
      'label': 'Aves',
    },
    {
      'page': MammalsTabPage(),
      'color': CustomColors.mammal,
      'icon': CustomIcons.mammal,
      'label': 'Mamíferos',
    },
    {
      'page': ReptilesTabPage(),
      'color': CustomColors.reptile,
      'icon': CustomIcons.reptile,
      'label': 'Reptiles',
    },
    {
      'page': AmphibiansTabPage(),
      'color': CustomColors.reptile,
      'icon': CustomIcons.amphibian,
      'label': 'Anfibios',
    },
    {
      'page': FishesTabPage(),
      'color': CustomColors.fish,
      'icon': CustomIcons.fish,
      'label': 'Peces',
    },
    {
      'page': InsectsTabPage(),
      'color': CustomColors.insect,
      'icon': CustomIcons.insect,
      'label': 'Insectos',
    },
    {
      'page': TreesTabPage(),
      'color': CustomColors.tree,
      'icon': CustomIcons.tree,
      'label': 'Árboles',
    },
    {
      'page': PalmsTabPage(),
      'color': CustomColors.palm,
      'icon': CustomIcons.palm,
      'label': 'Palmeras',
    },
  ];

  final List<Widget> _pages =
      _pageData.map((page) => page['page'] as Widget).toList();

  final List<Color> _tabIndicatorColor =
      _pageData.map((color) => color['color'] as Color).toList();

  final List<Tab> _tabs = _pageData.map((tab) {
    return Tab(
      icon: Icon(tab['icon']),
      text: tab['label'],
    );
  }).toList();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _pageData.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 56.0,
              padding: const EdgeInsets.only(left: 56.0),
              child: Text('Especies',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            TabBar(
              controller: _tabController,
              splashBorderRadius: BorderRadius.circular(16.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              indicatorColor: _tabIndicatorColor[_tabController.index],
              labelColor: _tabIndicatorColor[_tabController.index],
              isScrollable: true,
              onTap: (index) => setState(() => _tabController.index = index),
              tabs: _tabs,
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: _pages,
              ),
            ),
          ],
        ));
  }
}
