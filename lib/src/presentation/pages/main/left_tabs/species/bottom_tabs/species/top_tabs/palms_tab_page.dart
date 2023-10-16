import 'package:flutter/material.dart';

class PalmsTabPage extends StatefulWidget {
  const PalmsTabPage({super.key});

  @override
  State<PalmsTabPage> createState() => _PalmsTabPageState();
}

class _PalmsTabPageState extends State<PalmsTabPage>
    with AutomaticKeepAliveClientMixin<PalmsTabPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(child: Text('PalmsTabPage'));
  }
}
