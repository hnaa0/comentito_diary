import 'dart:async';

import 'package:comentito_diary/features/home/repos/api_service.dart';
import 'package:comentito_diary/features/home/models/movie_detail_model.dart';
import 'package:comentito_diary/features/home/models/movie_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchMovieViewModel extends AsyncNotifier<void> {
  late final TMDBService _tmdbService;

  @override
  FutureOr<void> build() {
    _tmdbService = TMDBService();
  }

  Future<List<MovieModel>> searchMovies({
    required String text,
  }) async {
    final response = await _tmdbService.searchMovies(text);
    return response.map((movie) => MovieModel.fromJson(movie)).toList();
  }

  Future<MovieDetailModel> getMovieDetail({
    required int movieId,
  }) async {
    state = const AsyncValue.loading();
    final result = await AsyncValue.guard(() async {
      final response = await _tmdbService.getMovieDetail(movieId);

      return MovieDetailModel.fromJson(response);
    });

    if (result.hasValue) {
      return result.value!;
    } else {
      throw Exception("영화 정보를 가져오는 데 실패했습니다.");
    }
  }
}

final searchMovieProvider = AsyncNotifierProvider<SearchMovieViewModel, void>(
  () => SearchMovieViewModel(),
);
