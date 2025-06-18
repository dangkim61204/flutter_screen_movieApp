// lib/service/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.1.4:8000/api/movies'; // Android

  static Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> movieList = jsonResponse['data'];

      return movieList.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
