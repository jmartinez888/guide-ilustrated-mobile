import 'package:flutter/material.dart';

class AmphibiansTabPage extends StatefulWidget {
  const AmphibiansTabPage({super.key});

  @override
  State<AmphibiansTabPage> createState() => _AmphibiansTabPageState();
}

class _AmphibiansTabPageState extends State<AmphibiansTabPage>
    with AutomaticKeepAliveClientMixin<AmphibiansTabPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(child: Text('AmphibiansTabPage'));
  }
}
