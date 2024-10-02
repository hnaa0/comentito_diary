class MovieDetailModel {
  final String title;
  final int id;
  final List<dynamic> genres;
  final List<dynamic> actors, directors;

  MovieDetailModel({
    required this.title,
    required this.id,
    required this.genres,
    required this.actors,
    required this.directors,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        id = json["id"],
        genres = json["genres"],
        actors = json["actors"],
        directors = json["directors"];

  MovieDetailModel.empty()
      : title = "",
        id = 0,
        genres = [],
        actors = [],
        directors = [];
}
