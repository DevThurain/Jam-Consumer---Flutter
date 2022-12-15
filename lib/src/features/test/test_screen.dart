import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jams/src/core/utils/app_utils.dart';

class TestScreen extends StatefulWidget {
  static const routeName = '/test_screen';
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    final window = WidgetsBinding.instance.window;
    window.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;
      AppUtils.autoStatusBarAndSystemNavigationBarColor();
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
