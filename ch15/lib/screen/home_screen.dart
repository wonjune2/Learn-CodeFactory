import 'package:ch15/component/custom_youtube_player.dart';
import 'package:ch15/model/video_model.dart';
import 'package:ch15/repository/youtube_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('코팩튜브'),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<VideoModel>>(
        future: YoutubeRepository.getVideos(), // 유튜브 영상 가져오기
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // 에러가 있을 경우 에러 화면에 표시하기
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          if (!snapshot.hasData) {
            // 로딩 중일 때 로딩위젯 보여주기
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            // ➊ 새로고침 기능이 있는 위젯
            onRefresh: () async {
              setState(() {});
            },
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: snapshot.data!
                  .map((e) => CustomYoutubePlayer(videoModel: e))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
