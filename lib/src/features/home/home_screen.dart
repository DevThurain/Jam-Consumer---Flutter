import 'dart:math';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jams/src/core/constants/app_color.dart';
import 'package:jams/src/core/constants/app_dimen.dart';
import 'package:jams/src/data/vos/book_vo.dart';
import 'package:jams/src/features/home/widgets/carousel_book.dart';
import 'package:jams/src/persistence/daos/book_dao.dart';

class HomeScreen extends StatefulWidget {
  static const rotueName = 'home_screen.dart';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BookDao _bookDao = BookDao();
  final PageController _carouselController = PageController(viewportFraction: 0.5);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimen.MARGIN_MEDIUM_2),
              child: SearchWidget(
                imageUrl: '',
                onTap: () {},
              ),
            ),
            SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
            ExpandablePageView.builder(
              controller: _carouselController,
              // allows our shadow to be displayed outside of widget bounds
              clipBehavior: Clip.none,
              itemCount: 6,
              itemBuilder: (_, index) => AnimatedBuilder(
                animation: _carouselController,
                builder: (context, widget) {
                  if (!_carouselController.position.haveDimensions) {
                    return const SizedBox();
                  }

                  return Transform.scale(
                    scale: max(0.8, 1 - (_carouselController.page! - index).abs() / 3),
                    child: CarouselBook(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(actions: [
  //       IconButton(
  //           onPressed: () {
  //             _bookDao.deleteAllBooks();
  //           },
  //           icon: Icon(Icons.delete))
  //     ]),
  //     floatingActionButton: FloatingActionButton(
  //       child: Icon(Icons.add),
  //       onPressed: () {
  //         _bookDao.addBook(
  //           BookVO(
  //             name: DateTime.now().microsecond.toString(),
  //             chapterCount: 5,
  //           ),
  //         );
  //       },
  //     ),
  //     body: StreamBuilder<List<BookVO>>(
  //       stream: _bookDao.getLiveBookList(),
  //       builder: (context, snapShot) {
  //         var data = snapShot.data ?? [];
  //         return ListView.builder(
  //             itemCount: data.length,
  //             itemBuilder: (context, index) {
  //               return Text(data[index].name);
  //             });
  //       },
  //     ),
  //   );
  // }

}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);
  final imageUrl;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        width: double.infinity,
        height: 45.0,
        decoration: BoxDecoration(
            color: AppColor.primaryBlue,
            borderRadius: BorderRadius.circular(AppDimen.MARGIN_MEDIUM_2)),
      ),
    );
  }
}
