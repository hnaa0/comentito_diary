import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comentito_diary/features/home/models/comentito_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComentitoRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> uploadComentito({
    required int movieId,
    required String uid,
    required String weather,
    required String watchWith,
    required String text,
    required DateTime date,
    required String posterPath,
    required String title,
    required List<dynamic> genres,
    required List<dynamic> actors,
    required List<dynamic> directors,
  }) async {
    final comentito = {
      "movieId": movieId,
      "uId": uid,
      "weather": weather,
      "watchWith": watchWith,
      "text": text,
      "date": Timestamp.fromDate(date),
      "posterPath": posterPath,
      "title": title,
      "genres": genres,
      "actors": actors,
      "directors": directors,
    };
    final docRef = await _db.collection("comentitos").add(comentito);
    final docId = docRef.id;

    await _db.collection("comentitos").doc(docId).update({"id": docId});
  }

  Future<List<ComentitoModel>> fetchComentitos({
    required DateTime startDate,
    required DateTime endDate,
    required String uid,
  }) async {
    final data = await _db
        .collection("comentitos")
        .where("uId", isEqualTo: uid)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
        .where('date', isLessThanOrEqualTo: Timestamp.fromDate(endDate))
        .get();

    final comentitos = data.docs.map((doc) {
      return ComentitoModel.fromJson(json: doc.data());
    }).toList();
    return comentitos;
  }

  Future<void> deleteComentito(String id) async {
    await _db.collection("comentitos").doc(id).delete();
  }
}

final comentitoRepo = Provider(
  (ref) => ComentitoRepository(),
);
