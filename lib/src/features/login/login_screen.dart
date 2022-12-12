import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jams/src/core/constants/app_color.dart';
import 'package:jams/src/core/constants/app_constants.dart';
import 'package:jams/src/core/constants/app_dimen.dart';
import 'package:jams/src/core/utils/app_utils.dart';
import 'package:jams/src/features/based_screen/based_screen.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late RiveAnimationController _btnAnimationController;
  @override
  void initState() {
    AppUtils.setAppBarAndSystemNavigationBarColor(color: AppColor.loginBackground);
    _btnAnimationController = OneShotAnimation('active', autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.loginBackground,
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 100,
            left: 200,
            child: Image.asset('assets/images/pngs/spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: SizedBox(),
            ),
          ),
          RiveAnimation.asset(
            'assets/rive_assets/shapes.riv',
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimen.MARGIN_MEDIUM_2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image.asset('assets/images/pngs/jam.png',width: 50)
                      Text(
                        'Read\nbooks\n& collect',
                        style: TextStyle(
                            fontSize: AppDimen.TEXT_BIG_2X,
                            fontWeight: FontWeight.bold,
                            height: 1.3),
                      ),
                      SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
                      SizedBox(
                        width: 200.0,
                        child: Text(
                          AppConstants.book_quote_1,
                          style: TextStyle(
                              fontSize: AppDimen.TEXT_SMALL, height: 1.4, color: AppColor.grey),
                        ),
                      ),
                      SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
                      GestureDetector(
                        onTap: () async {
                          _btnAnimationController.isActive = true;
                          await Future.delayed(Duration(milliseconds: 1000));
                          Navigator.pushNamed(context, BasedScreen.routeName);
                        },
                        child: SizedBox(
                          height: 64,
                          width: 260,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  child: RiveAnimation.asset(
                                'assets/rive_assets/button.riv',
                                controllers: [_btnAnimationController],
                              ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
