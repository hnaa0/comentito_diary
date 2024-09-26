class MovieModel {
  final String title, originalTitle, posterPath;
  final int id;

  MovieModel({
    required this.title,
    required this.originalTitle,
    required this.id,
    required this.posterPath,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        originalTitle = json["original_title"],
        id = json["id"],
        posterPath = json["poster_path"] ?? "";

  MovieModel.empty()
      : title = "",
        originalTitle = "",
        id = 0,
        posterPath = "";
}
