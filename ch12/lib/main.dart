import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> _cameras;

Future<void> main(List<String> args) async {
  // Flutter 앱이 실행될 준비가 됐는지 확인인
  WidgetsFlutterBinding.ensureInitialized();

  // 핸드폰에 있는 카메라들 가져오기
  _cameras = await availableCameras();
  runApp(const CameraApp());
}

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
  }

  initializeCamera() async {
    try {
      controller = CameraController(_cameras[0], ResolutionPreset.max);

      await controller.initialize();

      setState(() {});
    } catch (e) {
      if (e is CameraException) {
        switch (e.code) {
          case "CameraAccessDenied":
            print("User denied camera access.");
            break;
          default:
            print("Handle other errors.");
            break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // 카메라 초기화 상태 확인
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: CameraPreview(controller),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
