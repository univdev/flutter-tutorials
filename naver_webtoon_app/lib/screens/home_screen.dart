import 'package:flutter/material.dart';
import 'package:naver_webtoon_app/models/webtoon_model.dart';
import 'package:naver_webtoon_app/services/api_service.dart';
import 'package:naver_webtoon_app/widgets/webtoon.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          '오늘의 웹툰',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data?.length ?? 0,
      itemBuilder: (context, index) {
        final item = snapshot.data![index];

        return Webtoon(
          title: item.title,
          thumb: item.thumb,
          id: item.id,
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 20,
      ),
    );
  }
}
