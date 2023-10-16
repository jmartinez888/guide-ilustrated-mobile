import 'package:flutter/material.dart';

class ReptilesTabPage extends StatefulWidget {
  const ReptilesTabPage({super.key});

  @override
  State<ReptilesTabPage> createState() => _ReptilesTabPageState();
}

class _ReptilesTabPageState extends State<ReptilesTabPage>
    with AutomaticKeepAliveClientMixin<ReptilesTabPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(child: Text('ReptilesTabPage'));
  }
}
