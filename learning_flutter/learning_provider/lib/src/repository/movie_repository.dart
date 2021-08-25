import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learning_provider/src/model/movie.dart';

class MovieRepository {
  //var queryPram = {'api_key': '6fd7cd51ba62529705cb2d12ff5affde'};

  Future<List<Movie>?> loadMovies() async {
    //var uri = Uri.http('api.themoviedb.or', '/3/movie/popular', queryPram);
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=6fd7cd51ba62529705cb2d12ff5affde');
    var response = await http.get(uri);

    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);
      if (body['results'] != null) {
        List<dynamic> list = body['results'];
        return list.map<Movie>((item) => Movie.fromJson(item)).toList();
      }
    } else {
      throw FormatException('not access api');
    }
  }
}
