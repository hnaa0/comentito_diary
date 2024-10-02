import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/repos/api_service.dart';
import 'package:comentito_diary/features/home/models/movie_model.dart';
import 'package:comentito_diary/features/home/view_models/search_movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SearchMovieScreen extends ConsumerStatefulWidget {
  static const routeUrl = "search";
  static const routeName = "search";

  const SearchMovieScreen({super.key});

  @override
  ConsumerState<SearchMovieScreen> createState() => _SearchMovieScreenState();
}

class _SearchMovieScreenState extends ConsumerState<SearchMovieScreen> {
  final TextEditingController _textController = TextEditingController();
  List<MovieModel> _movieList = [];
  void _onXTap() {
    _textController.clear();
  }

  Future<void> _onSearchTap() async {
    final result = await ref
        .read(searchMovieProvider.notifier)
        .searchMovies(text: _textController.text);

    if (result.isNotEmpty) {
      setState(() {
        _movieList = result;
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TMDBService().searchMovies("비긴");

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(
          ThemeColors.white,
        ),
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: const Text(
            "검색",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          leading: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              context.pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                "assets/icons/angle-left.svg",
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
          ),
          child: Column(
            children: [
              const Gap(10),
              TextField(
                controller: _textController,
                cursorColor: const Color(
                  ThemeColors.green,
                ),
                decoration: InputDecoration(
                  hintText: "영화 제목을 입력하세요.",
                  hintStyle: const TextStyle(
                    color: Color(
                      ThemeColors.grey_500,
                    ),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(
                        ThemeColors.green,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(
                        ThemeColors.green,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onSearchTap,
                        child: SvgPicture.asset(
                          "assets/icons/search.svg",
                          width: 22,
                        ),
                      ),
                      const Gap(16),
                      GestureDetector(
                        onTap: _onXTap,
                        child: SvgPicture.asset(
                          "assets/icons/x.svg",
                          width: 18,
                        ),
                      ),
                      const Gap(12),
                    ],
                  ),
                ),
                onSubmitted: (value) {
                  _onSearchTap();
                },
              ),
              const Gap(18),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: _movieList.length,
                  itemBuilder: (context, index) {
                    final movie = _movieList[index];

                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        final detail = await ref
                            .read(searchMovieProvider.notifier)
                            .getMovieDetail(movieId: movie.id);

                        if (mounted) {
                          context.pop({
                            "movie": movie,
                            "detail": detail,
                          });
                        }
                      },
                      child: SizedBox(
                        height: 160,
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 3 / 4,
                              child: movie.posterPath != ""
                                  ? Image.network(
                                      "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                                      height: 160,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      color: const Color(
                                        ThemeColors.mintCream,
                                      ),
                                    ),
                            ),
                            const Gap(8),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(
                                      ThemeColors.grey_900,
                                    ),
                                  ),
                                ),
                                const Gap(2),
                                Text(
                                  movie.originalTitle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(
                                      ThemeColors.grey_700,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: Color(
                      ThemeColors.grey_200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
