import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/models/movie_detail_model.dart';
import 'package:comentito_diary/features/home/models/movie_model.dart';
import 'package:comentito_diary/features/home/models/watch_with_type.dart';
import 'package:comentito_diary/features/home/models/weather_type.dart';
import 'package:comentito_diary/features/home/view_models/upload_comentito_view_model.dart';
import 'package:comentito_diary/features/home/views/search_movie_screen.dart';
import 'package:comentito_diary/features/home/views/widgets/watch_with_list.dart';
import 'package:comentito_diary/features/home/views/widgets/weather_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WriteBottomsheet extends ConsumerStatefulWidget {
  const WriteBottomsheet({super.key});

  @override
  ConsumerState<WriteBottomsheet> createState() => _WriteBottomsheetState();
}

class _WriteBottomsheetState extends ConsumerState<WriteBottomsheet> {
  int _seletedWeatherIdx = 0;
  int _seletedWithIdx = 0;
  DateTime _selectedDate = DateTime(0);
  MovieModel _selectedMovie = MovieModel.empty();
  MovieDetailModel _selectedMovieDetail = MovieDetailModel.empty();
  final DateTime today = DateTime.now();
  final TextEditingController _textController = TextEditingController();
  final Map<String, dynamic> _formData = {};

  void _onXTap() {
    setState(() {
      _selectedMovie = MovieModel.empty();
    });
  }

  void _onWeatherTap({required int index, required String weather}) {
    setState(() {
      _seletedWeatherIdx = index;
      _formData["weather"] = weather.toString();
    });
  }

  void _onWithTap({required int index, required WatchWithType watchWith}) {
    setState(() {
      _seletedWithIdx = index;
      _formData["watchWith"] = watchWith.name;
    });
  }

  void _onSaveTap() {
    if (_selectedDate == DateTime(0) || _selectedMovie == MovieModel.empty()) {
      return;
    }

    if (_formData["weather"] == null) {
      _formData["weather"] = WeatherType.values[_seletedWeatherIdx].name;
    }
    if (_formData["watchWith"] == null) {
      _formData["watchWith"] = WatchWithType.values[_seletedWithIdx].name;
    }

    if (_textController.text.isNotEmpty) {
      _formData["text"] = _textController.text;
      _formData["movieId"] = _selectedMovie.id;
      _formData["posterPath"] = _selectedMovie.posterPath;
      _formData["title"] = _selectedMovie.title;
      _formData["genres"] = _selectedMovieDetail.genres;
      _formData["actors"] = _selectedMovieDetail.actors;
      _formData["directors"] = _selectedMovieDetail.directors;

      ref
          .read(uploadComentitoProvider.notifier)
          .uploadComentito(
            form: _formData,
          )
          .then((value) {
        _initComentito();
      });
    }
  }

  void _initComentito() {
    setState(() {
      _textController.clear();
      _selectedMovie = MovieModel.empty();
      _selectedDate = DateTime(0);
      _seletedWeatherIdx = 0;
      _seletedWithIdx = 0;
    });
    FocusScope.of(context).unfocus();
  }

  Future<void> _onDateTap() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      confirmText: "확인",
      cancelText: "취소",
      firstDate: DateTime(today.year),
      lastDate: today,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(
                ThemeColors.green,
              ),
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _formData["date"] = _selectedDate;
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "COMENTITO",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.green,
                    ),
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Gap(30),
                Row(
                  children: [
                    const Text(
                      "영화",
                      style: TextStyle(
                        color: Color(
                          ThemeColors.grey_900,
                        ),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Gap(14),
                    GestureDetector(
                      onTap: () async {
                        final result = await context
                            .pushNamed(SearchMovieScreen.routeName);

                        if (result != null && result is Map<String, dynamic>) {
                          _selectedMovie = result["movie"] as MovieModel;
                          _selectedMovieDetail =
                              result["detail"] as MovieDetailModel;
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                        ),
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color(
                            ThemeColors.white,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(
                                ThemeColors.grey_200,
                              ),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            _selectedMovie.title,
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    GestureDetector(
                      onTap: _onXTap,
                      child: SvgPicture.asset(
                        "assets/icons/x.svg",
                        width: 18,
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                Row(
                  children: [
                    const Text(
                      "날짜",
                      style: TextStyle(
                        color: Color(
                          ThemeColors.grey_900,
                        ),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Gap(14),
                    GestureDetector(
                      onTap: _onDateTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                        ),
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color(
                            ThemeColors.white,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(
                                ThemeColors.grey_200,
                              ),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Text(
                          _selectedDate == DateTime(0)
                              ? ""
                              : (DateFormat("yyyy/MM/dd"))
                                  .format(_selectedDate),
                        ),
                      ),
                    ),
                    const Gap(10),
                    SvgPicture.asset(
                      "assets/icons/calendar-check.svg",
                      width: 18,
                    ),
                  ],
                ),
                const Gap(24),
                Row(
                  children: [
                    const Text(
                      "날씨",
                      style: TextStyle(
                        color: Color(
                          ThemeColors.grey_900,
                        ),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Gap(14),
                    Expanded(
                      child: SizedBox(
                        height: 36,
                        child: WeatherList(
                          onWeatherTap: _onWeatherTap,
                          selectedIdx: _seletedWeatherIdx,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                Row(
                  children: [
                    const Text(
                      "누구랑",
                      style: TextStyle(
                        color: Color(
                          ThemeColors.grey_900,
                        ),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Gap(14),
                    Expanded(
                      child: SizedBox(
                        height: 34,
                        child: WatchWithList(
                          onWithTap: _onWithTap,
                          selectedIdx: _seletedWithIdx,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "COMENTITO",
                      style: TextStyle(
                        color: Color(
                          ThemeColors.grey_900,
                        ),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Gap(8),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _textController,
                            cursorColor: const Color(
                              ThemeColors.green,
                            ),
                            maxLines: 5,
                            maxLength: 50,
                            decoration: InputDecoration(
                              counterStyle: const TextStyle(
                                color: Color(
                                  ThemeColors.grey_500,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(
                                    ThemeColors.mintBlue,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(
                                    ThemeColors.mintBlue,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: const Color(
                                ThemeColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(80),
              ],
            ),
          ),
          bottomSheet: GestureDetector(
            onTap: _onSaveTap,
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: 54,
                minHeight: 54,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(
                  ThemeColors.green,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ref.watch(uploadComentitoProvider).isLoading
                  ? LoadingAnimationWidget.waveDots(
                      color: const Color(
                        ThemeColors.white,
                      ),
                      size: 20,
                    )
                  : const Text(
                      "저장",
                      style: TextStyle(
                        color: Color(
                          ThemeColors.white,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
