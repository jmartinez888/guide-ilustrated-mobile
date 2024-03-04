import 'package:species/src/domain/repositories/auth/auth_repository.dart';
import 'package:species/src/presentation/global/state_notifier.dart';

class SessionController extends StateNotifier<String?> {
  final AuthRepository authRepository;
  SessionController(
    this.authRepository,
  ) : super(null);

  void setUser(String user) {
    state = user;
  }

  Future<void> signOut(async) async{
    await authRepository.signOut();
    onlyUpdate(null);
  }
}
