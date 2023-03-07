import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static const LatLng companyLatLng = LatLng(
    37.5233273,
    126.921252,
  );

  const HomeScreen({super.key});

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    // 위치 서비스 활성화 여부 확인
    if (!isLocationEnabled) {
      return '위치 서비스를 활성화 해주세요';
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();

    // 위치 권한 확인
    if (checkedPermission == LocationPermission.denied) {
      // 거절
      // 위치 권한 요청하기
      checkedPermission = await Geolocator.requestPermission();
      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }

    // 위치 권한 거절됨 (재요청 불가)
    if (checkedPermission == LocationPermission.deniedForever) {
      return "앱의 위치가 권한을 설정에서 허가해주세요.";
    }

    return '위치 권한이 허가 되었습니다.';
  }

  AppBar renderAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        '오늘도 출첵',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder(
        future: checkPermission(),
        builder: (context, snapshot) {
          // 로딩 상태
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.data == '위치 권한이 허가 되었습니다.') {
            return Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: companyLatLng,
                      zoom: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.timelapse_outlined,
                        color: Colors.blue,
                        size: 50.0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('출근하기'),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return Center(
            child: Text(
              snapshot.data.toString(),
            ),
          );
        },
      ),
    );
  }
}
