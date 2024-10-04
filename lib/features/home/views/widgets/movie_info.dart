import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/models/comentito_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class MovieInfo extends ConsumerStatefulWidget {
  const MovieInfo({
    super.key,
    required this.comentito,
  });

  final ComentitoModel comentito;

  @override
  ConsumerState<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends ConsumerState<MovieInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.comentito.title,
            style: const TextStyle(
              color: Color(
                ThemeColors.green,
              ),
              fontSize: 26,
            ),
          ),
          const Gap(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.48,
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${widget.comentito.posterPath}",
                        ),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(
                            ThemeColors.grey_600,
                          ),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "감독",
                          style: TextStyle(
                            color: Color(
                              ThemeColors.grey_500,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Wrap(
                            runSpacing: 2,
                            children: [
                              for (var i = 0;
                                  i < widget.comentito.directors.length;
                                  i++) ...[
                                Text(
                                  widget.comentito.directors[i]["name"],
                                  style: const TextStyle(
                                    color: Color(
                                      ThemeColors.grey_800,
                                    ),
                                  ),
                                ),
                                if (i != widget.comentito.directors.length - 1)
                                  const Text(", "),
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "장르",
                          style: TextStyle(
                            color: Color(
                              ThemeColors.grey_500,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Wrap(
                            runSpacing: 2,
                            children: [
                              for (var i = 0;
                                  i < widget.comentito.genres.length;
                                  i++) ...[
                                Text(
                                  widget.comentito.genres[i]["name"],
                                  style: const TextStyle(
                                    color: Color(
                                      ThemeColors.grey_800,
                                    ),
                                  ),
                                ),
                                if (i != widget.comentito.genres.length - 1)
                                  const Text(", "),
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "배우",
                          style: TextStyle(
                            color: Color(
                              ThemeColors.grey_500,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Wrap(
                            runSpacing: 2,
                            children: [
                              for (var i = 0;
                                  i < widget.comentito.actors.length;
                                  i++) ...[
                                Text(
                                  widget.comentito.actors[i]["name"],
                                  style: const TextStyle(
                                    color: Color(
                                      ThemeColors.grey_800,
                                    ),
                                  ),
                                ),
                                if (i != widget.comentito.actors.length - 1)
                                  const Text(", "),
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
