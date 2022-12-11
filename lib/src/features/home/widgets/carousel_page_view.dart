import 'dart:math';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:jams/src/features/home/widgets/carousel_book.dart';



class CarouselPageView extends StatelessWidget {
 CarouselPageView({
    Key? key,
  }) : super(key: key);

  final PageController _carouselController = PageController(viewportFraction: 0.5);

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
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
    );
  }
}

