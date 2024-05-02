import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:species/src/presentation/global/sections/author_details.dart/author_details_section.dart';
import 'package:species/src/presentation/global/sections/general_loadings/author_details_loading.dart';
import 'package:species/src/presentation/global/sections/message_exception.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/pages/main/left_tabs/author/sub_routes/author_details/controller/author_details_controller.dart';

class AuthorDetailsPage extends StatefulWidget {
  final String id;

  const AuthorDetailsPage({super.key, required this.id});

  @override
  State<AuthorDetailsPage> createState() => _AuthorDetailsPageState();
}

class _AuthorDetailsPageState extends State<AuthorDetailsPage> {
  AuthorDetailsController get controllerRead => context.read();

  @override
  void initState() {
    controllerRead.getAuthor(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthorDetailsController controllerWatch = context.watch();
    final state = controllerWatch.state;
    return Scaffold(
      body: Stack(
        children: [
          state.loading
              ? const AuthorDetailsLoading()
              : state.mapOfId[widget.id] == null
                  ? MessageException(
                      onPressed: () => controllerRead.getAuthor(widget.id),
                      lottie: 'assets/lotties/error_data.json',
                    )
                  : AuthorSection(author: state.mapOfId[widget.id]!),
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
