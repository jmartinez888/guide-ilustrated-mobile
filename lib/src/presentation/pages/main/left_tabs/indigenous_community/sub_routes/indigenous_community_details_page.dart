/* import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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