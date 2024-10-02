import 'dart:async';

import 'package:comentito_diary/features/authentication/repos/auth_repository.dart';
import 'package:comentito_diary/features/home/models/comentito_model.dart';
import 'package:comentito_diary/features/home/repos/comentito_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FetchComentitoViewModel extends AsyncNotifier<void> {
  late final ComentitoRepository _comentitoRepository;
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _comentitoRepository = ref.read(comentitoRepo);
    _authRepository = ref.read(authRepo);
  }

  Future<List<ComentitoModel>> fetchComentitos(
      {required DateTime startDate, required DateTime endDate}) async {
    final user = _authRepository.user!;
    final result = await _comentitoRepository.fetchComentitos(
        startDate: startDate, endDate: endDate, uid: user.uid);

    return result;
  }

  Future<void> deleteComentito({required String id}) async {
    await ref.read(comentitoRepo).deleteComentito(id);
  }
}

final fetchComentitoProvider =
    AsyncNotifierProvider<FetchComentitoViewModel, void>(
  () => FetchComentitoViewModel(),
);
