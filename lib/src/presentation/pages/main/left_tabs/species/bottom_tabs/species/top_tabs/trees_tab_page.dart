import 'package:flutter/material.dart';

class TreesTabPage extends StatefulWidget {
  const TreesTabPage({super.key});

  @override
  State<TreesTabPage> createState() => _TreesTabPageState();
}

class _TreesTabPageState extends State<TreesTabPage>
    with AutomaticKeepAliveClientMixin<TreesTabPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(child: Text('TreesTabPage'));
  }
}
