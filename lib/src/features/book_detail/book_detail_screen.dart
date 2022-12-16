import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:jams/src/core/constants/app_color.dart';
import 'package:jams/src/core/constants/app_dimen.dart';
import 'package:jams/src/core/utils/app_utils.dart';
import 'package:jams/src/features/based_state/based_stateful_widget.dart';

class BookDetailScren extends StatefulWidget {
  static const routeName = '/book_detail_screen';
  const BookDetailScren({Key? key}) : super(key: key);

  @override
  State<BookDetailScren> createState() => _BookDetailScrenState();
}

class _BookDetailScrenState extends State<BookDetailScren> with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  bool isTop = true;

  @override
  void initState() {
    super.initState();
    _setupScrollController();
  }

  void _setupScrollController() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset == 0.0) {
        setState(() {
          isTop = true;
        });
      } else {
        if (isTop) {
          setState(() {
            isTop = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // SliverPersistentHeader(
              //   delegate: CustomPersistentHeader(),
              //   pinned: true,
              // ),
              // SliverAppBar(
              //   backgroundColor: Colors.transparent,
              //   pinned: true,
              //   expandedHeight: 100,
              //   collapsedHeight: 80,
              //   toolbarHeight: 80,
              //   flexibleSpace: FlexibleSpaceBar(
              //     background: Expanded(
              //         child: Container(
              //       color: AppColor.white,
              //     )),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: Container(
                  height: 1000,
                  child: Column(
                    children: [
                      DimImage(
                        imageUrl:
                            'https://attackofthefanboy.com/wp-content/uploads/2022/07/Naruto-Watch-Order-1.jpg',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  color: isTop ? Colors.transparent : Theme.of(context).colorScheme.tertiary),
              duration: Duration(milliseconds: 800),
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  height: kToolbarHeight,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/svgs/arrow_back.svg',
                          color: Theme.of(context).textTheme.headline2?.color,
                          width: AppDimen.ICON_MEDIUM_SIZE,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.download_outlined,
                          color: Theme.of(context).textTheme.headline2?.color,
                          size: AppDimen.ICON_MEDIUM_SIZE,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.sort_outlined,
                          color: Theme.of(context).textTheme.headline2?.color,
                          size: AppDimen.ICON_MEDIUM_SIZE,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert_sharp,
                          color: Theme.of(context).textTheme.headline2?.color,
                          size: AppDimen.ICON_MEDIUM_SIZE,
                        ),
                      ),
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

class DimImage extends StatelessWidget {
  const DimImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(1.0)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/svgs/arrow_back.svg',
                  width: 25,
                ),
              )
            ],
          )
        ],
      )),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 90;

  @override
  // TODO: implement minExtent
  double get minExtent => 90;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return this != oldDelegate;
  }
}
