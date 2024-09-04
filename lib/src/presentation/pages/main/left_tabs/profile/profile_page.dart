import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:species/src/domain/entities/user/user.dart';
import 'package:species/src/domain/failures/firebase_request/firebase_request_failure.dart';
import 'package:species/src/domain/repositories/account/account_repository.dart';
import 'package:species/src/domain/repositories/auth/auth_repository.dart';
import 'package:species/src/presentation/global/controller/session_controller.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/card/custom_list_tile.dart';
import 'package:species/src/presentation/router/routes.dart';
import 'package:species/src/generated/translations.g.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountRepository accountRepository = context.read();
    final AuthRepository authRepository = context.read();
    final SessionController sessionController = context.read();

    final sessionState = context.watch<SessionController>().state;

    final textTheme = Theme.of(context).textTheme;

    if (sessionState != null) {
      accountRepository.getStreamUserData(sessionState);
    }

    return Scaffold(
      body: sessionState != null
          ? StreamBuilder<UserC>(
              stream: accountRepository.onUserDataChanged,
              builder: (_, snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: PaddingConfig.allL,
                      children: const [
                        Text('Este usuario no existe'),
                      ],
                    ),
                  );
                }
                if (snapshot.data != null) {
                  final UserC userData = snapshot.data as UserC;
                  return Column(
                    children: [
                      AppBar(
                        leading: const SizedBox(),
                        title: Text(texts.profile.title),
                        actions: [
                          IconButton(
                            tooltip: texts.profile.logout,
                            onPressed: () {
                              authRepository.signOut();
                              sessionController.signOut();
                              context.goNamed(Routes.species);
                            },
                            icon: const Icon(Icons.logout_rounded),
                          ),
                          const SizedBox(width: 8.0),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          padding: PaddingConfig.allL,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Center(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 64.0,
                                    backgroundImage:
                                        userData.profilePicture != null
                                            ? CachedNetworkImageProvider(
                                                userData.profilePicture!)
                                            : null,
                                    child: userData.profilePicture == null
                                        ? const Icon(
                                            Icons.account_circle_outlined,
                                            size: 64.0,
                                          )
                                        : null,
                                  ),
                                  CustomIconButton(
                                    tooltip: 'Editar',
                                    icon: Icons.edit_rounded,
                                    onPressed: () => context.pushNamed(
                                      Routes.editProfile,
                                      pathParameters: {'userId': userData.id},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: PaddingConfig.symetrictVertical,
                              child: Text(
                                '${userData.name ?? 'Nombre no definido'} ${userData.lastName ?? ' - Apellido no definido'}',
                                style: textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.email_outlined),
                              title: Text(userData.email),
                            ),
                            ListTile(
                              leading: const Icon(Icons.phone_outlined),
                              title: Text(userData.phone ??
                                  'No se asignó un número telefónico'),
                            ),
                            const Divider(),
                            CustomListTile(
                              onTap: () => context.pushNamed(
                                Routes.forgotPassword,
                              ),
                              leading: const Icon(
                                Icons.password_rounded,
                                color: Colors.grey,
                              ),
                              title: texts.profile.changePassword,
                              trailing: const Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.grey,
                              ),
                            ),
                            CustomListTile(
                              onTap: () {
                                Share.share(
                                    '${texts.profile.share} https://play.google.com/store/apps/details?id=com.iiap.guiailustrada');
                              },
                              leading: const Icon(
                                Icons.person_add_outlined,
                                color: Colors.grey,
                              ),
                              title: texts.profile.invite,
                              trailing: const Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.grey,
                              ),
                            ),
                            CustomListTile(
                              onTap: () => context.pushNamed(
                                Routes.deleteAccount,
                                pathParameters: {'userId': userData.id},
                              ),
                              leading: const Icon(
                                Icons.delete_forever_outlined,
                                color: Colors.grey,
                              ),
                              title: texts.profile.deleteAccount,
                              trailing: const Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            )
          : _buildFailedState(context),
    );
  }

  Widget _buildFailedState(
    BuildContext context, {
    FirebaseRequestFailure? firebaseError,
  }) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: PaddingConfig.allL,
        physics: const BouncingScrollPhysics(),
        children: [
          AppBar(
            leading: const SizedBox(),
            title: const Text('Primero Inicia sesión'),
          ),
          if (firebaseError != null) Text(firebaseError.message),
          const SizedBox(height: 8.0),
          FilledButton.icon(
            onPressed: () => context.pushNamed(Routes.signIn),
            icon: const Icon(Icons.login_rounded),
            label: const Text('Iniciar sesión'),
          ),
        ],
      ),
    );
  }
}