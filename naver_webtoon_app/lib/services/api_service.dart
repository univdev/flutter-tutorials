import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:naver_webtoon_app/models/webtoon_detail_model.dart';
import 'package:naver_webtoon_app/models/webtoon_episode_model.dart';
import 'package:naver_webtoon_app/models/webtoon_model.dart';

class ApiService {
  static final String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';

  static final paths = {
    'today': '/today',
    'detail': '/:id',
    'episodes': '/:id/episodes',
  };

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse(baseUrl + paths['today']!);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> toons = jsonDecode(response.body);
      final List<WebtoonModel> webtoons = [];
      for (final toon in toons) {
        final item = WebtoonModel.fromJson(toon);
        webtoons.add(item);
      }

      return webtoons;
    } else {
      throw Error();
    }
  }

  static Future<WebtoonDetailModel> getDetailToon(String webtoonId) async {
    final url =
        Uri.parse(baseUrl + paths['detail']!.replaceFirst(':id', webtoonId));
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final item = WebtoonDetailModel.fromJson(json);

      return item;
    } else {
      throw Error();
    }
  }

  static Future<List<WebtoonEpisodeModel>> getEpisodesOfToon(
      String webtoonId) async {
    final url =
        Uri.parse(baseUrl + paths['episodes']!.replaceFirst(':id', webtoonId));
    final response = await http.get(url);
    final List<WebtoonEpisodeModel> episodes = [];

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      for (final episode in json) {
        final item = WebtoonEpisodeModel.fromJson(episode);
        episodes.add(item);
      }

      return episodes;
    }

    throw Error();
  }
}
