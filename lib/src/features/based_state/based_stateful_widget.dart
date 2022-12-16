import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jams/src/core/utils/app_utils.dart';

abstract class BasedState<T extends StatefulWidget> extends State<T> {
  @mustCallSuper
  @protected
  @override
  void initState() {
    super.initState();
       final window = WidgetsBinding.instance.window;
    window.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;
      AppUtils.autoStatusBarAndSystemNavigationBarColor();
    };
  }
}
