import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_tracking/core/controllers/request_view_model.dart';
import 'package:train_tracking/features/auth/domain/auth_dm/auth_data_manager.dart';

class SignUpViewModel extends RequestStateNotifier {
  final AuthDataManager authDataManager;

  SignUpViewModel({required this.authDataManager});

  Future <void> signUp(
      {required String email, required String password, required String name}) async {
    makeRequest(
      () =>
          authDataManager.signUp(email: email, password: password, name: name),
    );
  }
}

final signUpVMProvider = StateNotifierProvider<SignUpViewModel, RequestState>(
  (ref) => SignUpViewModel(
    authDataManager: ref.read(authDMProvider),
  ),
);
