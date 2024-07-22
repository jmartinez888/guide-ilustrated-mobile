/* import 'package:species/src/domain/repositories/account/account_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/controller/state/profile_state.dart';

class ProfileController extends StateNotifier<ProfileState> {
  final AccountRepository _accountRepository;
  ProfileController(
    super.state, {
    required AccountRepository accountRepository,
  }) : _accountRepository = accountRepository;

  Future<void> getUserData(String userId) async {
    state = ProfileState.loading();
    final userData = await _accountRepository.getUserData(userId);
    state = userData.when(
      (firebaseRequestFailure) => ProfileState.failed(firebaseRequestFailure),
      (userResult) => ProfileState.loaded(userResult),
    );
  }
}
 */