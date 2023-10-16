import 'package:flutter/material.dart';

class FishesTabPage extends StatefulWidget {
  const FishesTabPage({super.key});

  @override
  State<FishesTabPage> createState() => _FishesTabPageState();
}

class _FishesTabPageState extends State<FishesTabPage>
    with AutomaticKeepAliveClientMixin<FishesTabPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(child: Text('FishesTabPage'));
  }
}
