import 'dart:async';

import 'package:comentito_diary/features/authentication/repos/auth_repository.dart';
import 'package:comentito_diary/features/home/repos/comentito_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadComentitoViewModel extends AsyncNotifier<void> {
  late final ComentitoRepository _comentitoRepository;
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _comentitoRepository = ref.read(comentitoRepo);
    _authRepository = ref.read(authRepo);
  }

  Future<void> uploadComentito({
    required Map<String, dynamic> form,
  }) async {
    state = const AsyncValue.loading();

    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    final user = _authRepository.user!;

    state = await AsyncValue.guard(() async {
      await _comentitoRepository.uploadComentito(
        movieId: form["movieId"],
        uid: user.uid,
        weather: form["weather"],
        watchWith: form["watchWith"],
        text: form["text"],
        date: form["date"],
      );
    });

    // if (state.hasError) {
    //   print("Upload failed with error: ${state.error}");
    // }
  }
}

final uploadComentitoProvider =
    AsyncNotifierProvider<UploadComentitoViewModel, void>(
  () => UploadComentitoViewModel(),
);
