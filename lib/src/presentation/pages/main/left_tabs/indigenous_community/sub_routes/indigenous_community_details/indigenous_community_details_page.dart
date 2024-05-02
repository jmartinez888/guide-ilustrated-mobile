import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/general_loadings/community_details_loading.dart';
import 'package:species/src/presentation/global/sections/community/community_details_section.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/pages/main/left_tabs/indigenous_community/sub_routes/indigenous_community_details/controller/community_details_controller.dart';

class IndigenousCommunityDetailsPage extends StatefulWidget {
  final String id;

  const IndigenousCommunityDetailsPage({super.key, required this.id});

  @override
  State<IndigenousCommunityDetailsPage> createState() =>
      _IndigenousCommunityDetailsPageState();
}

class _IndigenousCommunityDetailsPageState
    extends State<IndigenousCommunityDetailsPage> {
  CommunityDetailsController get controllerRead => context.read();

  @override
  void initState() {
    controllerRead.getCommunity(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CommunityDetailsController controllerWatch = context.watch();
    final state = controllerWatch.state;
    return Scaffold(
      body: Stack(
        children: [
          state.loading
              ? const CommunityDetailsLoading()
              : state.mapOfId[widget.id] == null
                  ? MessageException(
                      onPressed: () => controllerRead.getCommunity(widget.id),
                      lottie: 'assets/lotties/error_data.json',
                    )
                  : CommunitySection(
                      community: state.mapOfId[widget.id]!,
                    ),
          const Positioned(
            top: 8.0,
            left: 56.0,
            child: SafeArea(
              child: CustomBackButton(),
            ),
          ),
        ],
      ),
    );
  }
}

