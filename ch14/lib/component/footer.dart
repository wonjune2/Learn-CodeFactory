import 'package:flutter/material.dart';

// 스티커를  선택할 때마다 실행할 함수의 시그니처
typedef OnEmotioconTap = void Function(int id);

class Footer extends StatelessWidget {
  final OnEmotioconTap onEmotioconTap;

  const Footer({
    super.key,
    required this.onEmotioconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.9),
      height: 150,
      child: SingleChildScrollView(
        // 가로로 스크롤 가능하게 스티커 구현
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            7,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  onEmotioconTap(index + 1);
                },
                child: Image.asset(
                  'asset/img/emoticon_${index + 1}.png',
                  height: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
