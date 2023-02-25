import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:train_tracking/features/auth/data/data_source.dart';

abstract class AuthImplementation {
  Future<void> login({required String email, required String password});

  Future<void> signUp(
      {required String email, required String password, required String name});
}

class AuthDataManager extends AuthImplementation {
  final AuthService authService;

  AuthDataManager({required this.authService});

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await authService.signIn(email: email, password: password);
    } catch (error) {
      throw Exception();
    }
  }

  @override
  Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await authService.signUp(
          email: email, password: password, name: name, userName: name);
    } catch (error) {
      throw Exception();
    }
  }
}

final authDMProvider = Provider(
  (ref) => AuthDataManager(
    authService: ref.read(authServiceProvider),
  ),
);
