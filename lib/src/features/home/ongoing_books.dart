import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jams/src/core/constants/app_dimen.dart';
import 'package:jams/src/features/home/widgets/cover_book_list.dart';

class OngoingBooks extends StatelessWidget {
  const OngoingBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
          itemCount: 10,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: AppDimen.MARGIN_MEDIUM_2),
          itemBuilder: ((context, index) => CoverBookList())),
    );
  }
}
