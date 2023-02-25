import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_tracking/features/auth/data/data_source.dart';
import 'package:train_tracking/features/auth/presentation/pages/login_screen.dart';
import 'package:train_tracking/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:train_tracking/features/home/presentation/pages/home_nav.dart';
import 'package:train_tracking/features/home/presentation/pages/home_screen.dart';

class AuthValidation extends ConsumerStatefulWidget {
  const AuthValidation({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthValidation> createState() => _AuthValidationState();
}

class _AuthValidationState extends ConsumerState<AuthValidation> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authenticationState);
    return authState.when(
      data: (data) {
        if (data != null) {
          return const HomeScreen();
        } else {
          return const OnBoardingScreen();
        }
      },
      error: (_, __) {
        return const Text('error');
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
