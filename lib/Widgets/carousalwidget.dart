import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarousalWidget extends StatelessWidget {
  const CarousalWidget({
    super.key,
    required ValueNotifier<int> currentIndex,
    required this.screenWidth,
  }) : _currentIndex = currentIndex;

  final ValueNotifier<int> _currentIndex;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 174.0,
          autoPlay: false,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            _currentIndex.value = index;
          },
        ),
        items: [
          'assets/images/image 43.png',
          'assets/images/image 43.png',
          'assets/images/image 43.png',
        ]
            .map((item) => ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    item,
                    width: screenWidth,
                    fit: BoxFit.cover,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
