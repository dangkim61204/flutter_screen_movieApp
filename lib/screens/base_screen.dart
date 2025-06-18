import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'movie_detail_screen.dart';

class BaseScreen extends StatefulWidget {
  final List<Movie>? movies;
  final String title;
  final String filterType; // Xác định loại lọc: 'home', 'genres', 'series', 'movies'
  final List<Movie>? filteredMovies; // Dữ liệu đã lọc (nếu có)

  const BaseScreen({
    super.key,
    this.movies,
    required this.title,
    required this.filterType,
    this.filteredMovies,
  });

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  late List<Movie> _displayMovies;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _displayMovies = widget.filteredMovies ?? widget.movies ?? [];
    _filterMovies();
  }

  void _filterMovies() {
    setState(() {
      _displayMovies = (widget.filteredMovies ?? widget.movies ?? []).where((movie) {
        final query = _searchQuery.toLowerCase();
        return movie.title.toLowerCase().contains(query);
      }).toList();

      if (widget.filterType == 'series') {
        _displayMovies = _displayMovies.where((movie) => movie.episodes > 1).toList();
      } else if (widget.filterType == 'movies') {
        _displayMovies = _displayMovies.where((movie) => movie.episodes == 1).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies == null) {
      return  Scaffold(
        appBar: AppBar(title: Text('Lỗi')),
        body: Center(child: Text('Không có dữ liệu phim')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm phim...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                  _filterMovies();
                });
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _displayMovies.length,
          itemBuilder: (context, index) {
            final movie = _displayMovies[index];
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
              subtitle: Text(
                '${movie.genre} - ${widget.filterType == 'series' ? 'Số tập: ${movie.episodes}' : 'Thời lượng: ${movie.duration}'}',
              ),
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