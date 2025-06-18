import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'movie_detail_screen.dart';

class SeriesScreen extends StatelessWidget {
  final List<Movie>? movies;

  const SeriesScreen({super.key, this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies == null) {
      return  Scaffold(
        appBar: AppBar(title: Text('Phim bộ')),
        body: Center(child: Text('Không có dữ liệu phim')),
      );
    }

    final seriesMovies = movies!.where((movie) => movie.episodes > 1).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Phim bộ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: seriesMovies.length,
          itemBuilder: (context, index) {
            final movie = seriesMovies[index];
            return ListTile(
              leading: Image.asset(
                movie.imageUrl ?? 'assets/images/lieu_chu_ky.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey[300],
                  child: const Center(child: Text('Poster')),
                ),
              ),
              title: Text(movie.title),
              subtitle: Text('Số tập: ${movie.episodes}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}