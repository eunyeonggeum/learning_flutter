import 'package:flutter/material.dart';
import 'package:learning_provider/src/model/movie.dart';
import 'package:learning_provider/src/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  MovieRepository _movieRepository = MovieRepository();
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  loadMovies() async {
    List<Movie>? listMovies = await _movieRepository.loadMovies();
    // if (listMovies == null) {
    //   throw Exception();
    // } //listmoviex 예외 처리 해주고
    // 추가적인 가공 절차 필요하기 때문에 listMovies에 넣고 나서 _movies
    _movies = listMovies!;
    notifyListeners();
  }
}
