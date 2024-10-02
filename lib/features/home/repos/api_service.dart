import "dart:convert";
import "package:http/http.dart" as http;

class TMDBService {
  static const apiKey = "6fe4d29c99947ab60450f09f130c26a0";
  static const baseUrl = "https://api.themoviedb.org/3";

  Future<List<dynamic>> searchMovies(String query) async {
    final res = await http.get(
      Uri.parse(
          "$baseUrl/search/movie?api_key=$apiKey&query=$query&language=ko"),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> jsonRes = json.decode(res.body);
      return jsonRes["results"];
    } else {
      throw Exception("검색에 실패했습니다.");
    }
  }

  Future<Map<String, dynamic>> getMovieDetail(int id) async {
    Map<String, dynamic> result = {};

    // 영화 상세 정보
    final detailRes = await http
        .get(Uri.parse("$baseUrl/movie/$id?api_key=$apiKey&language=ko"));

    // 크레딧 상세 정보
    final creditsRes = await http.get(
        Uri.parse("$baseUrl/movie/$id/credits?api_key=$apiKey&language=ko"));

    if (detailRes.statusCode == 200 && creditsRes.statusCode == 200) {
      Map<String, dynamic> detail = json.decode(detailRes.body);
      Map<String, dynamic> credits = json.decode(creditsRes.body);

      // 상위 3명 배우 정보
      final List<dynamic> castList = credits["cast"];
      final top3Cast = castList.take(3).toList();

      // 감독 정보
      final List<dynamic> crewList = credits["crew"];
      final directors =
          crewList.where((member) => member["job"] == "Director").toList();

      result = {
        "title": detail["title"],
        "id": detail["id"],
        "genres": detail["genres"],
        "actors": top3Cast,
        "directors": directors,
      };
      return result;
    } else {
      throw Exception("정보를 가져올 수 없습니다.");
    }
  }
}
