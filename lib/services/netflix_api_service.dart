import 'package:dio/dio.dart';
import 'package:netflix/models/movie_model.dart';
import 'package:netflix/services/neftlix_api.dart';

class ApiService {
  final Api api = Api();
  final Dio dio = Dio();

  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
    String _url = api.baseUrl + path;

    Map<String, dynamic> query = {
      'api_key': api.apiKey,
      'language': 'pt_BR',
    };
    if (params != null) {
      query.addAll(params);
    }

    final response = await dio.get(_url, queryParameters: query);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getPopularMovies({required int pageNumber}) async {
    Response response = await getData('/movie/popular', params: {
      'page': pageNumber,
    });
    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data['results'];
      List<Movie> movies = [];
      for (Map<String, dynamic> json in results) {
        Movie movie = Movie.fromMap(json);
        movies.add(movie);
      }
      return movies;
    } else {
      throw response;
    }
  }
}
