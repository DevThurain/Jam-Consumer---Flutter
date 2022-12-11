import 'dart:math';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:jams/src/core/constants/app_color.dart';
import 'package:jams/src/core/constants/app_constants.dart';
import 'package:jams/src/core/constants/app_dimen.dart';
import 'package:jams/src/features/global/search_widget.dart';
import 'package:jams/src/features/home/completed_books.dart';
import 'package:jams/src/features/home/ongoing_books.dart';
import 'package:jams/src/features/home/widgets/carousel_book.dart';
import 'package:jams/src/features/home/widgets/carousel_page_view.dart';
import 'package:jams/src/persistence/daos/book_dao.dart';

class HomeScreen extends StatefulWidget {
  static const rotueName = 'home_screen.dart';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BookDao _bookDao = BookDao();
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppDimen.MARGIN_MEDIUM_2),
                    child: SearchWidget(imageUrl: '', onTap: () {}),
                  ),
                  SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
                  CarouselPageView(),
                  SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
                  TabBarSection(onTap: ((tab) => _selectedTab)),
                ],
              ))
            ];
          },
          body: TabBarView(children: [
                OngoingBooks(),
                CompletedBooks(),
              ]),
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

class TabBarSection extends StatelessWidget {
  const TabBarSection({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 0,
            right: 0,
            bottom: AppDimen.DIVIDER_HIGHT_N,
            child: Divider(
              thickness: AppDimen.MARGIN_ONE,
            )),
        Positioned(
          child: TabBar(
            labelColor: AppColor.primaryBlue,
            unselectedLabelColor: AppColor.black30,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: AppDimen.MARGIN_SMALL,
            onTap: (index) {
              onTap(index);
            },
            tabs: [
              Tab(
                text: 'Ongoing',
              ),
              Tab(
                text: 'Complete',
              )
            ],
          ),
        ),
      ],
    );
  }
}
