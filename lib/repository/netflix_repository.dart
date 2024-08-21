import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix/models/movie_model.dart';
import 'package:netflix/services/netflix_api_service.dart';

class NetflixRepository with ChangeNotifier {
  final ApiService apiService = ApiService();
  final List<Movie> _popularMovieList = [];
  int _popularMoviePageIndex = 1;

  List<Movie> get popularMovieList => _popularMovieList;

  Future<void> getPopularMovies() async {
    try {
      List<Movie> movies = await apiService.getPopularMovies(pageNumber: _popularMoviePageIndex);
      _popularMovieList.addAll(movies);
      _popularMoviePageIndex++;
      notifyListeners();
    } on Response catch (response) {
      throw ("ERROR: ${response.statusCode}");
    }
  }
}
