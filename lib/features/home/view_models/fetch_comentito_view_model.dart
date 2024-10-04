import 'dart:async';

import 'package:comentito_diary/features/authentication/repos/auth_repository.dart';
import 'package:comentito_diary/features/home/models/comentito_model.dart';
import 'package:comentito_diary/features/home/repos/comentito_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FetchComentitoViewModel extends AsyncNotifier<List<ComentitoModel>> {
  late final ComentitoRepository _comentitoRepository;
  late final AuthRepository _authRepository;

  @override
  FutureOr<List<ComentitoModel>> build() async {
    _comentitoRepository = ref.read(comentitoRepo);
    _authRepository = ref.read(authRepo);

    final today = DateTime.now();
    final startDate = DateTime(today.year, today.month, 1);
    final endDate = DateTime(today.year, today.month + 1, 0);
    return await fetchComentitos(startDate: startDate, endDate: endDate);
  }

  Future<List<ComentitoModel>> fetchComentitos(
      {required DateTime startDate, required DateTime endDate}) async {
    final user = _authRepository.user!;
    final result = await _comentitoRepository.fetchComentitos(
        startDate: startDate, endDate: endDate, uid: user.uid);

    state = AsyncValue.data(result);
    return result;
  }

  Future<void> deleteComentito({required String id}) async {
    await ref.read(comentitoRepo).deleteComentito(id);
  }

  Future<List<ComentitoModel>> refresh({required DateTime selectedDate}) async {
    final startDate = DateTime(selectedDate.year, selectedDate.month, 1);
    final endDate = DateTime(selectedDate.year, selectedDate.month + 1, 0);

    final result =
        await fetchComentitos(startDate: startDate, endDate: endDate);

    return result;
  }
}

final fetchComentitoProvider =
    AsyncNotifierProvider<FetchComentitoViewModel, List<ComentitoModel>>(
  () => FetchComentitoViewModel(),
);
