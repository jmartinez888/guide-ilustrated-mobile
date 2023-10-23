import "package:flutter/material.dart";

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onDestinationSelected;
  final List<NavigationDestination> destinations;
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.destinations,
    this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.circular(100.0),
      clipBehavior: Clip.antiAlias,
      elevation: 6.0,
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          width: 284.0,
          child: NavigationBar(
            destinations: destinations,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
          ),
        ),
      ),
    );
  }
}
