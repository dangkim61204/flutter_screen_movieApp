class Movie {
  final String title;
  final String genre;
  final int episodes;
  final String duration;
  final String status;
  final String actors;
  final double rating;
  final String imageUrl;
  final String content;

  Movie({
    required this.title,
    required this.genre,
    required this.episodes,
    required this.duration,
    required this.status,
    required this.actors,
    required this.rating,
    required this.imageUrl,
    required this.content,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      genre: json['genre'] ?? '',
      episodes: json['episodes'] ?? 0,
      duration: json['duration'] ?? '',
      status: json['status'] ?? '',
      actors: json['actors'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
