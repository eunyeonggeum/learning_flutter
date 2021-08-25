class Movie {
  late String overview;
  late String posterPath;
  late String title;
  Movie(
      {required this.overview, required this.posterPath, required this.title});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      title: json['title'] as String,
    );
  }
}
