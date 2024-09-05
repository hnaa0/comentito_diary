import 'dart:async';

import 'package:comentito_diary/features/authentication/repos/auth_repository.dart';
import 'package:comentito_diary/features/user/models/user_model.dart';
import 'package:comentito_diary/features/user/repos/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserViewModel extends AsyncNotifier<UserModel> {
  late final UserRepository _userRepository;
  late final AuthRepository _authRepository;

  @override
  FutureOr<UserModel> build() async {
    _userRepository = ref.read(userRepo);
    _authRepository = ref.read(authRepo);

    if (_authRepository.isLoggedIn) {
      final profile =
          await _userRepository.getProfile(_authRepository.user!.uid);

      if (profile != null) {
        return UserModel.fromJson(profile);
      }
    }

    return UserModel.empty();
  }

  Future<void> createProfile(
      {required UserCredential userCredential,
      required String name,
      required String email,
      required String password}) async {
    state = const AsyncValue.loading();

    final profile = UserModel(
      uid: userCredential.user!.uid,
      name: name,
      email: email,
    );

    await _userRepository.createProfile(profile);
  }
}

final userProvider = AsyncNotifierProvider<UserViewModel, UserModel>(
  () => UserViewModel(),
);
