class WebtoonDetailModel {
  final String title;
  final String about;
  final String genre;
  final String age;
  final String thumb;

  WebtoonDetailModel.fromJson(Map<String, dynamic> source)
      : title = source['title'],
        about = source['about'],
        genre = source['genre'],
        age = source['age'],
        thumb = source['thumb'];
}
