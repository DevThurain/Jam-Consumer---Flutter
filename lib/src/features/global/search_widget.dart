import 'package:flutter/material.dart';
import 'package:jams/src/core/constants/app_color.dart';
import 'package:jams/src/core/constants/app_dimen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);
  final String imageUrl;
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
