import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comentito_diary/features/home/models/watch_with_type.dart';
import 'package:comentito_diary/features/home/models/weather_type.dart';

class ComentitoModel {
  final String id;
  final int movieId;
  final String uid;
  final String title;
  final WeatherType weather;
  final WatchWithType watchWith;
  final String text;
  final DateTime date;
  final String posterPath;

  ComentitoModel({
    this.id = "",
    required this.movieId,
    required this.uid,
    required this.title,
    required this.weather,
    required this.watchWith,
    required this.text,
    required this.date,
    required this.posterPath,
  });

  ComentitoModel.fromJson({required Map<String, dynamic> json})
      : id = json["id"],
        movieId = json["movieId"],
        uid = json["uId"],
        title = json["title"],
        weather = WeatherTypeExtension.fromString(json["weather"]),
        watchWith = WatchWithTypeExtension.fromString(json["watchWith"]),
        text = json["text"],
        date = (json["date"] as Timestamp).toDate(),
        posterPath = json["posterPath"];
}
