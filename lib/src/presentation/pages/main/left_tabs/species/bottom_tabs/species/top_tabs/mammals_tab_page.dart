import 'package:flutter/material.dart';

class MammalsTabPage extends StatefulWidget {
  const MammalsTabPage({super.key});

  @override
  State<MammalsTabPage> createState() => _MammalsTabPageState();
}

class _MammalsTabPageState extends State<MammalsTabPage>
    with AutomaticKeepAliveClientMixin<MammalsTabPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(child: Text('MammalsTabPage'));
  }
}
