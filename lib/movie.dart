class MovieModel {
  final bool adult, video;
  final List<dynamic> genre_ids;
  final int id, vote_count;
  final double popularity;
  final num vote_average;
  final String backdrop_path,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date,
      title;

  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdrop_path = json['backdrop_path'],
        genre_ids = json['genre_ids'],
        id = json['id'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        poster_path = json['poster_path'],
        title = json['title'],
        video = json['video'],
        release_date = json['release_date'],
        vote_average = json['vote_average'],
        vote_count = json['vote_count'];
}
