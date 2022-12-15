import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
    // AppUtils.autoStatusBarAndSystemNavigationBarColor();
    _btnAnimationController = OneShotAnimation('active', autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Spacer(),
                      Text(
                        'Read\nbooks\n& collect',
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
                      SizedBox(
                        width: 240.0,
                        child: Text(
                          AppConstants.book_quote_1,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
                      Spacer(
                        flex: 3,
                      ),
                      AnimatedButton(
                        btnAnimationController: _btnAnimationController,
                        onTap: () async {
                          _btnAnimationController.isActive = true;
                          await Future.delayed(Duration(milliseconds: 1000));

                          if (!mounted) return;
                          Navigator.pushNamed(context, BasedScreen.routeName);
                        },
                      ),
                      SizedBox(height: AppDimen.MARGIN_MEDIUM_3),
                      Text(
                        AppConstants.book_quote_1,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Spacer()
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

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    Key? key,
    required RiveAnimationController btnAnimationController,
    required this.onTap,
  })  : _btnAnimationController = btnAnimationController,
        super(key: key);

  final RiveAnimationController _btnAnimationController;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            Positioned.fill(
              right: AppDimen.MARGIN_LARGE,
              child: RiveAnimation.asset(
                'assets/rive_assets/button.riv',
                controllers: [_btnAnimationController],
              ),
            ),
            Positioned.fill(
              top: AppDimen.MARGIN_SMALL,
              right: AppDimen.MARGIN_LARGE,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chevron_right,
                    color: AppColor.contentColorLightTheme,
                  ),
                  SizedBox(width: AppDimen.MARGIN_MEDIUM),
                  Text(
                    'Login to account',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColor.contentColorLightTheme),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
