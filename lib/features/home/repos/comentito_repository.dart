import 'package:cloud_firestore/cloud_firestore.dart';
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
  }) async {
    final comentito = {
      "movieId": movieId,
      "uId": uid,
      "weather": weather,
      "watchWith": watchWith,
      "text": text,
      "date": date.toString(),
    };
    final docRef = await _db.collection("comentitos").add(comentito);
    final docId = docRef.id;

    await _db.collection("comentitos").doc(docId).update({"id": docId});
  }
}

final comentitoRepo = Provider(
  (ref) => ComentitoRepository(),
);
