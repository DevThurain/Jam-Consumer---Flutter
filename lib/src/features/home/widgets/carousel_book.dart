import 'package:flutter/material.dart';
import 'package:jams/src/core/constants/app_dimen.dart';

class CarouselBook extends StatelessWidget {
  const CarouselBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(AppDimen.MARGIN_MEDIUM_3)),
      child: Image.network(
        'https://content.wepik.com/statics/8476219/preview-page0.jpg',
        // width: MediaQuery.of(context).size.width * 0.3,
        // height: MediaQuery.of(context).size.width * 0.6,
        width: 180.0,
        height: 250.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
