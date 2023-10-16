import 'package:flutter/material.dart';

class InsectsTabPage extends StatefulWidget {
  const InsectsTabPage({super.key});

  @override
  State<InsectsTabPage> createState() => _InsectsTabPageState();
}

class _InsectsTabPageState extends State<InsectsTabPage>
    with AutomaticKeepAliveClientMixin<InsectsTabPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(child: Text('InsectsTabPage'));
  }
}
