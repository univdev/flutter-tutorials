import 'package:flutter/material.dart';

class WebtoonPoster extends StatelessWidget {
  const WebtoonPoster({
    super.key,
    required this.thumbnail,
  });

  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        thumbnail,
        scale: 2,
      ),
    );
  }
}
