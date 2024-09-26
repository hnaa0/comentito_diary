class ComentitoModel {
  final String id;
  final int movieId;
  final String uid;
  final String weather;
  final String watchWith;
  final String text;
  final DateTime date;

  ComentitoModel({
    this.id = "",
    required this.movieId,
    required this.uid,
    required this.weather,
    required this.watchWith,
    required this.text,
    required this.date,
  });
}
