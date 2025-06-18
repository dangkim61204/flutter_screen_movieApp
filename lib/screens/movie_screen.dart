import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'movie_detail_screen.dart';

class MovieScreen extends StatelessWidget {
  final List<Movie>? movies;

  const MovieScreen({super.key, this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies == null) {
      return  Scaffold(
        appBar: AppBar(title: Text('Phim lẻ')),
        body: Center(child: Text('Không có dữ liệu phim')),
      );
    }

    final movieMovies = movies!.where((movie) => movie.episodes == 1).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Phim lẻ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: movieMovies.length,
          itemBuilder: (context, index) {
            final movie = movieMovies[index];
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
              subtitle: Text('Thời lượng: ${movie.duration}'),
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