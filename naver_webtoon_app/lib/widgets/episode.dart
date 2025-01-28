import 'package:flutter/material.dart';
import 'package:naver_webtoon_app/models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.item,
  });

  final WebtoonEpisodeModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          item.thumb,
          width: 100,
          height: 60,
          headers: {
            "User-Agent":
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 12,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(item.rating),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
