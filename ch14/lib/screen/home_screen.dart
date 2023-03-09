import 'dart:io';

import 'package:ch14/component/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          renderBody(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MainAppBar(
              onPickImage: onPickImage,
              onSaveImage: onSaveImage,
              onDeleteItem: onDeleteItem,
            ),
          ),
        ],
      ),
    );
  }

  Widget renderBody() {
    if (image != null) {
      // Stack 크기의 최대 크기만큼 차지하기
      return Positioned.fill(
        // 위젯 확대 및 좌우 이동을 가능하게 하는 위젯
        child: InteractiveViewer(
          child: Image.file(
            File(image!.path),

            // 이미지가 부모 위젯 크기 최대를 차지하도록 하기
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Center(
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey,
          ),
          onPressed: onPickImage,
          child: const Text('이미지 선택하기'),
        ),
      );
    }
  }

  void onPickImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      this.image = image;
    });
  }

  void onSaveImage() {}

  void onDeleteItem() {}
}
