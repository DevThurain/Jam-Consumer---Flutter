import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jams/src/core/constants/app_color.dart';
import 'package:jams/src/core/constants/app_dimen.dart';

class CoverBook extends StatelessWidget {
  const CoverBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimen.MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(AppDimen.MARGIN_MEDIUM_3)),
            child: Image.network(
              'https://content.wepik.com/statics/8476219/preview-page0.jpg',
              // width: MediaQuery.of(context).size.width * 0.3,
              // height: MediaQuery.of(context).size.width * 0.6,
              width: AppDimen.WIDTH_COVER_BOOK_IMAGE,
              height: AppDimen.HEIGHT_COVER_BOOK_IMAGE,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: AppDimen.MARGIN_MEDIUM),
          SizedBox(
            width: AppDimen.WIDTH_COVER_BOOK_IMAGE,
            child: Text(
              'One Punch ManrOne Punch ManrOne Punch ManrOne Punch ManrOne Punch ManrOne Punch ManrOne Punch ManrOne Punch ManrOne Punch Manr',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: AppDimen.TEXT_REGULAR,
                color: AppColor.black,
              ),
            ),
          ),
          SizedBox(height: AppDimen.MARGIN_MEDIUM),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/images/svgs/chapter.svg',
                width: AppDimen.ICON_SMALL_SIZE,
                color: AppColor.grey,
              ),
              SizedBox(width: AppDimen.MARGIN_SMALL),
              Text(
              '24 chapters',
              style: TextStyle(
                fontSize: AppDimen.TEXT_SMALL,
                color: AppColor.grey,
              ),
            ),
            ],
          )
        ],
      ),
    );
  }
}
