import 'package:flutter/material.dart';
import 'package:naver_webtoon_app/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
    this.showTitle = true,
  });

  final String title;
  final String thumb;
  final String id;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
              webtoonTitle: title,
              thumbnail: thumb,
            ),
            fullscreenDialog: true,
          )),
      child: Hero(
        tag: id,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                        color: Colors.black.withOpacity(.4),
                      ),
                    ],
                  ),
                  child: Image.network(
                    headers: {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                    thumb,
                    scale: 2,
                  ),
                ),
              ),
              showTitle
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 22),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
