import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'fe5e09c9a76f462fe428aace88bc4a2a';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';
  int _popularPage = 0;

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    log(name: 'MoviesProvider', 'Provider de peliculas inicializado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    var response = await _getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(response);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
    log(name: 'GetOnDisplayMovies', '$nowPlayingResponse');
  }

  getPopularMovies() async {
    _popularPage++;
    var response = await _getJsonData('3/movie/popular', _popularPage);
    final popularMoviesResponse = PopularResponse.fromJson(response);
    popularMovies = [...popularMovies, ...popularMoviesResponse.results];
    notifyListeners();
    log(name: 'getPopularMovies', '$popularMoviesResponse');
  }
}
