import 'package:demo/models/movie.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/genre_screen.dart';
import 'screens/series_screen.dart';
import 'screens/movie_screen.dart';
import 'screens/watch_screen.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) =>  HomeScreen(),
        '/genres': (context) => GenreScreen(movies: ModalRoute.of(context)?.settings.arguments as List<Movie>),
        '/series': (context) => SeriesScreen(movies: ModalRoute.of(context)?.settings.arguments as List<Movie>),
        '/movies': (context) => MovieScreen(movies: ModalRoute.of(context)?.settings.arguments as List<Movie>),
        '/watch': (context) => WatchScreen(movie: ModalRoute.of(context)?.settings.arguments as Movie),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),

      },
    );
  }
}