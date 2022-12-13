import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
///wiget to show the information of the onboarding into images lotties
class Sliders extends StatelessWidget {
  const Sliders({
    Key? key,
    required this.sliders,
    required this.currentPage,
    required this.pageController,
  }) : super(key: key);

  final double currentPage;
  final PageController pageController;
  final List<Map<String, String>> sliders;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: List.generate(
        sliders.length,
        (index) {
          final Map<String, String> item = sliders[index];
          final double progress = (index - currentPage);
          final double scale = lerpDouble(.8, .5, progress.abs())!;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 00.1)
              ..scale(scale, scale),
            child: Lottie.asset(
              item['image']!,
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
          );
        },
      ),
    );
  }
}
