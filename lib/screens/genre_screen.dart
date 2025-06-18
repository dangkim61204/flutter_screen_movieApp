import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'movie_detail_screen.dart';

class GenreScreen extends StatefulWidget {
  final List<Movie>? movies;

  const GenreScreen({super.key, this.movies});

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  String? _selectedGenre;

  @override
  Widget build(BuildContext context) {
    if (widget.movies == null) {
      return  Scaffold(
        appBar: AppBar(title: Text('Thể loại')),
        body: Center(child: Text('Không có dữ liệu phim')),
      );
    }

    final uniqueGenres = <String>{'Tất cả', ...widget.movies!.map((movie) => movie.genre).toSet()};
    final filteredMovies = _selectedGenre == 'Tất cả' || _selectedGenre == null
        ? widget.movies!
        : widget.movies!.where((movie) => movie.genre == _selectedGenre).toList();


    return Scaffold(
      appBar: AppBar(title: const Text('Thể loại')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              hint: const Text('Chọn thể loại'),
              value: _selectedGenre,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGenre = newValue;
                });
              },
              items: uniqueGenres.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredMovies.length,
                itemBuilder: (context, index) {
                  final movie = filteredMovies[index];
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
                    subtitle: Text('Thể loại: ${movie.genre}'),
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
          ],
        ),
      ),
    );

  }
}