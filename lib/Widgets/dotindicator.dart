import 'package:flutter/material.dart';
import 'package:zukarte_app/Core/colors.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int dotIndex;

  const DotIndicator({
    super.key,
    required this.currentIndex,
    required this.dotIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: dotIndex == currentIndex
              ? Color(0xff7714A1)
              : colorconstant.white,
          border: dotIndex == currentIndex
              ? null
              : Border.all(color: colorconstant.gray)),
    );
  }
}
