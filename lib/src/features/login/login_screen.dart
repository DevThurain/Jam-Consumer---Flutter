import 'dart:collection';
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
import 'package:jams/src/features/based_state/based_stateful_widget.dart';
import 'package:jams/src/features/global/FilledPasswordTextField.dart';
import 'package:jams/src/features/global/FilledTextField.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BasedState<LoginScreen> {
  late RiveAnimationController _btnAnimationController;
  @override
  void initState() {
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
                          _openCustomDialog(context);
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

  void _openCustomDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: AppColor.contentColorLightTheme.withOpacity(0.4),
        pageBuilder: (context, a1, a2) {
          return Dialog(
            insetAnimationCurve: Curves.decelerate,
            insetPadding: EdgeInsets.symmetric(horizontal: AppDimen.MARGIN_MEDIUM_2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimen.MARGIN_MEDIUM_2)),
            child: LoginDialogSection(),
          );
        },
        transitionDuration: Duration(milliseconds: 600),
        transitionBuilder: (context, a1, a2, child) {
          return SlideTransition(
            position: Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: child,
            ),
          );
        });
  }
}

class LoginDialogSection extends StatelessWidget {
  const LoginDialogSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimen.MARGIN_MEDIUM_3,
        vertical: AppDimen.MARGIN_MEDIUM_3,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimen.MARGIN_MEDIUM_2)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline1?.color),
            ),
          ),
          SizedBox(height: AppDimen.MARGIN_MEDIUM),
          Text(
            'Access 200+ of books. Customize your own shelf and save data on cloud.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
          FilledTextField(
            filledColor: Theme.of(context).colorScheme.tertiary,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: AppDimen.MARGIN_MEDIUM),
            icon: Icon(Icons.alternate_email, color: Theme.of(context).textTheme.bodyText1?.color),
            radius: AppDimen.MARGIN_MEDIUM,
            onChanged: (text) {},
            onImeAction: () {},
            hintText: 'Email',
          ),
          SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
          FilledPasswordTextField(
            filledColor: Theme.of(context).colorScheme.tertiary,
            icon: Icon(Icons.password, color: Theme.of(context).textTheme.bodyText1?.color),
            onChanged: (text) {},
            onImeAction: () {},
            radius: AppDimen.MARGIN_MEDIUM,
            hintText: 'Password',
          ),
          SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel', style: TextStyle(color: AppColor.primaryColor))),
              SizedBox(width: AppDimen.MARGIN_MEDIUM_2),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, BasedScreen.routeName);
                },
                child: Text('Sign in'),
              ),
            ],
          )
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
