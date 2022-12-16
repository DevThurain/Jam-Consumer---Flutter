import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jams/src/core/constants/app_color.dart';
import 'package:jams/src/core/constants/app_dimen.dart';
import 'package:jams/src/core/utils/app_utils.dart';
import 'package:jams/src/features/based_screen/bloc/bottom_navigation_bloc.dart';
import 'package:jams/src/features/based_state/based_stateful_widget.dart';
import 'package:jams/src/features/home/home_screen.dart';
import 'package:jams/src/features/library/library_screen.dart';

class BasedScreen extends StatefulWidget {
  static const routeName = "/based_screen";
  const BasedScreen({Key? key}) : super(key: key);

  @override
  State<BasedScreen> createState() => _BasedScreenState();
}

class _BasedScreenState extends BasedState<BasedScreen> {
  final _screenList = [HomeScreen(), LibraryScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc(),
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return Builder(builder: (context) {
            return Scaffold(
              body: _screenList[state.position],
              bottomNavigationBar: BottomNavigationBar(
                selectedFontSize: AppDimen.TEXT_SMALL,
                unselectedFontSize: AppDimen.TEXT_SMALL,
                selectedItemColor: AppColor.primaryColor,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/svgs/home.svg',
                      width: AppDimen.ICON_MEDIUM_SIZE,
                      color: AppColor.black50,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/images/svgs/home.svg',
                      width: AppDimen.ICON_MEDIUM_SIZE,
                      color: AppColor.primaryColor,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/svgs/library.svg',
                      width: AppDimen.ICON_MEDIUM_SIZE,
                      color: AppColor.black50,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/images/svgs/library.svg',
                      width: AppDimen.ICON_MEDIUM_SIZE,
                      color: AppColor.primaryColor,
                    ),
                    label: 'Library',
                  ),
                ],
                currentIndex: state.position,
                onTap: (position) {
                  context.read<BottomNavigationBloc>().add(EventBottomNavigationChange(position));
                },
              ),
            );
          });
        },
      ),
    );
  }
}
