import 'dart:math';

import 'package:ch10/screen/home_screen.dart';
import 'package:ch10/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;
  double threshold = 2.7;
  int number = 1;
  ShakeDetector? shakeDetector;

  void tabListener() {
    setState(() {});
  }

  void onPhoneShake() {
    final rand = Random();

    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);

    shakeDetector = ShakeDetector.autoStart(
      shakeSlopTimeMS: 100,
      shakeThresholdGravity: threshold,
      onPhoneShake: onPhoneShake,
    );
  }

  void onThresholdChange(double val) {
    print('민감도: $val');
    setState(() {
      threshold = val;
    });
  }

  @override
  void dispose() {
    controller!.removeListener(tabListener);
    shakeDetector!.stopListening();
    super.dispose();
  }

  List<Widget> renderChildren() {
    return [
      Container(
        child: Center(
          child: HomeScreen(
            number: number,
          ),
        ),
      ),
      Container(
        child: Center(
          child: SettingsScreen(
            threshold: 10.0,
            onThresholdChange: onThresholdChange,
          ),
        ),
      ),
    ];
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: controller!.index,
      onTap: (int index) {
        setState(() {
          controller!.animateTo(index);
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.edgesensor_high_outlined,
          ),
          label: '주사위',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: '설정',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }
}
