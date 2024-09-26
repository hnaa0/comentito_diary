import 'dart:async';

import 'package:comentito_diary/features/home/models/api_service.dart';
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
}

final searchMovieProvider = AsyncNotifierProvider<SearchMovieViewModel, void>(
  () => SearchMovieViewModel(),
);
