import 'package:flutter/material.dart';

class BirdsTabPage extends StatefulWidget {
  const BirdsTabPage({super.key});

  @override
  State<BirdsTabPage> createState() => _BirdsTabPageState();
}

class _BirdsTabPageState extends State<BirdsTabPage>
    with AutomaticKeepAliveClientMixin<BirdsTabPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(child: Text('BirdsTabPage'));
  }
}
