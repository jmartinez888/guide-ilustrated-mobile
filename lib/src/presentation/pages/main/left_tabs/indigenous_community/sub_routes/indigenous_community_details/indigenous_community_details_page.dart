/*import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/sections/details_loading.dart';
import 'package:species/src/presentation/global/sections/indigenous_community_details_section.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/pages/providers/indigenous_community/indigenous_community_provider.dart';

class IndigenousCommunityDetailsPage extends ConsumerStatefulWidget {
  final String id;
  const IndigenousCommunityDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  ConsumerState<IndigenousCommunityDetailsPage> createState() =>
      _IndigenousCommunityDetailsPagState();
}

class _IndigenousCommunityDetailsPagState
    extends ConsumerState<IndigenousCommunityDetailsPage> {
  @override
  void initState() {
    super.initState();
    ref
        .read(indigenousCommunityDetailProvider.notifier)
        .loadCommunity(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final community = ref.watch(indigenousCommunityDetailProvider)[widget.id];
    return Scaffold(
      body: Stack(
        children: [
          community == null
              ? const DetailsLoading()
              : IndigenousCommunityDetailsSection(community: community),
          const Positioned(
            left: 56.0,
            top: 8.0,
            child: CustomBackButton(),
          ),
        ],
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/indigenous_community_details_section.dart';
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
              ? const SizedBox()
              : state.mapOfId[widget.id] == null
                  ? Center(
                      child: FilledButton(
                        onPressed: () {
                          controllerRead.getCommunity(widget.id);
                        },
                        child: const Text('Inténtalo de nuevo'),
                      ),
                    )
                  : IndigenousCommunityDetailsSection(
                      community: state.mapOfId[widget.id]!,
                    ),
          const Positioned(
            left: 56.0,
            top: 8.0,
            child: CustomBackButton(),
          ),
        ],
      ),
    );
  }
}
