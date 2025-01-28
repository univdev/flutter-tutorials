class WebtoonEpisodeModel {
  final String thumb;
  final String id;
  final String title;
  final String rating;
  final String date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> source)
      : title = source['title'],
        thumb = source['thumb'],
        id = source['id'],
        rating = source['rating'],
        date = source['date'];
}
