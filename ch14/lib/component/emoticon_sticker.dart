import 'package:flutter/material.dart';

class EmoticonSticker extends StatefulWidget {
  final VoidCallback onTransform;
  final String imgPath;
  final bool isSelected;

  const EmoticonSticker({
    super.key,
    required this.onTransform,
    required this.imgPath,
    required this.isSelected,
  });

  @override
  State<EmoticonSticker> createState() => _EmoticonStickerState();
}

class _EmoticonStickerState extends State<EmoticonSticker> {
  double scale = 1; // 확대/축소 배율

  double hTransform = 0; // 가로의 움직임

  double vTransform = 0; // 세로의 움직임

  double actualScale = 1; // 위젯의 초기 크기 기준 확대/축소 배율
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          hTransform,
          vTransform,
        )
        ..scale(scale, scale),
      child: Container(
        decoration: widget.isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              )
            : BoxDecoration(
                // 테두리는 투명이나 너비는 1로 설정해서 스티커가 선택 취소될 때 깜빡이는 현상 제거
                border: Border.all(
                  width: 1.0,
                  color: Colors.transparent,
                ),
              ),
        child: GestureDetector(
          onTap: () {
            // 스티커를 눌렀을 때 실행할 함수
            widget.onTransform(); // 스티커의 상태가 변경될 때마다 실행
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            // 스티커의 확대 비율이 변경됐을 때 실행
            widget.onTransform();
            setState(() {
              scale = details.scale * actualScale;
              // 최근 확대 비율 기반으로 실제 확대 비율 계산
              vTransform += details.focalPointDelta.dy;
              hTransform += details.focalPointDelta.dx;
            });
          },
          onScaleEnd: (details) {
            actualScale = scale; // 확대 비율 저장
          },
          // 스티커의 확대 비율 변경이 완료됐을 때 실행
          child: Image.asset(
            widget.imgPath,
          ),
        ),
      ),
    );
  }
}
