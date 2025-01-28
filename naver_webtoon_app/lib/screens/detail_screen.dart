import 'package:flutter/material.dart';
import 'package:naver_webtoon_app/models/webtoon_detail_model.dart';
import 'package:naver_webtoon_app/models/webtoon_episode_model.dart';
import 'package:naver_webtoon_app/services/api_service.dart';
import 'package:naver_webtoon_app/services/storage_service.dart';
import 'package:naver_webtoon_app/widgets/episode.dart';
import 'package:naver_webtoon_app/widgets/webtoon_poster.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.webtoonTitle,
    required this.thumbnail,
    required this.id,
  });

  final String id;
  final String webtoonTitle;
  final String thumbnail;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> _detail;
  late Future<List<WebtoonEpisodeModel>> _episodes;
  late bool _isLike = false;

  void fetch() async {
    _detail = ApiService.getDetailToon(widget.id);
    _episodes = ApiService.getEpisodesOfToon(widget.id);
    _isLike = await StorageService.getLikeToon(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void onTapEpisode(String url) {
    final uri = Uri.parse(url);
    launchUrl(uri);
  }

  void onTapLike(bool isLike) async {
    _isLike = isLike;
    StorageService.setLikeToon(widget.id, isLike);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () => onTapLike(!_isLike),
              icon: _isLike
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_outline_outlined))
        ],
        title: Text(
          widget.webtoonTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.id,
                  child: WebtoonPoster(thumbnail: widget.thumbnail),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: FutureBuilder(
                future: _detail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.about);
                  }

                  return Text('...');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24, left: 16, right: 16),
              child: FutureBuilder(
                future: _episodes,
                builder: (ctx, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (ctx, index) {
                        final item = snapshot.data![index];

                        return GestureDetector(
                          onTap: () => onTapEpisode(
                              'https://comic.naver.com/webtoon/detail?titleId=${widget.id}&no=${item.id}'),
                          child: Episode(item: item),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return SizedBox(
                          height: 4,
                        );
                      },
                      itemCount: snapshot.data?.length ?? 0,
                    );
                  }

                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
