import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jams/src/core/constants/app_color.dart';
import 'package:jams/src/core/constants/app_dimen.dart';
import 'package:jams/src/features/home/widgets/cover_book.dart';

class CoverBookList extends StatelessWidget {
  const CoverBookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimen.HEIGHT_COVER_BOOK_LIST,
      child: Column(
        children: [
          SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimen.MARGIN_MEDIUM_2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hardcover Manga',
                  style: TextStyle(
                      fontSize: AppDimen.TEXT_REGULAR_2X,
                      color: AppColor.black50,
                      fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset(
                  'assets/images/svgs/arrow_next.svg',
                  width: AppDimen.ICON_MEDIUM_SIZE,
                  color: AppColor.primaryColor,
                )
              ],
            ),
          ),
          SizedBox(height: AppDimen.MARGIN_MEDIUM_2),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(right: AppDimen.MARGIN_MEDIUM_2),
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => CoverBook()),
            ),
          ),

          // CustomScrollView(
          //  slivers: [],
          // )
        ],
      ),
    );
  }
}
