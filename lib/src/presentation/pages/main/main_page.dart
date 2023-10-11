// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainPage({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Este es un AppBar'),
      ),
      body: navigationShell,
    );
  }
}
