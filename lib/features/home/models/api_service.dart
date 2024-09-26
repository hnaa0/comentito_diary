import "dart:convert";
import "package:http/http.dart" as http;

class TMDBService {
  static const apiKey = "6fe4d29c99947ab60450f09f130c26a0";

  Future<List<dynamic>> searchMovies(String query) async {
    final res = await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query"),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> jsonRes = json.decode(res.body);
      return jsonRes["results"];
    } else {
      throw Exception("검색에 실패했습니다.");
    }
  }
}
