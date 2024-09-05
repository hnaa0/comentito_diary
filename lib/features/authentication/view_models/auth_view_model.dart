import 'dart:async';

import 'package:comentito_diary/features/authentication/repos/auth_repository.dart';
import 'package:comentito_diary/features/home/views/home_screen.dart';
import 'package:comentito_diary/features/user/view_models/user_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthViewModel extends AsyncNotifier<void> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepo);
  }

  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await _authRepository.signInWithEmail(
        email: email,
        password: password,
      );
    });

    if (state.hasError) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              (state.error as FirebaseException).message ?? "잠시 후 다시 시도해주세요."),
        ),
      );
    } else {
      if (!context.mounted) return;
      context.go(HomeScreen.routeUrl);
    }
  }

  Future<void> signUp(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    state = const AsyncValue.loading();

    final user = ref.read(userProvider.notifier);

    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepository.signUpWithEmail(
        email: email,
        password: password,
      );

      await user.createProfile(
        userCredential: userCredential,
        name: name,
        email: email,
        password: password,
      );
    });

    if (state.hasError) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              (state.error as FirebaseException).message ?? "잠시 후 다시 시도하세요."),
        ),
      );
    } else {
      if (!context.mounted) return;
      context.go(HomeScreen.routeUrl);
    }
  }

  Future<void> signOut() async {
    state = await AsyncValue.guard(() async {
      await _authRepository.signOut();
    });
  }
}

final authProvider =
    AsyncNotifierProvider<AuthViewModel, void>(() => AuthViewModel());
