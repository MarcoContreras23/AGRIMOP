import 'package:flutter/material.dart';

class PaginationCarousel extends StatelessWidget {
  const PaginationCarousel({
    Key? key,
    required this.quantity,
    required this.currentPage,
    this.colorSelectIndicator,
    this.colorUnSelectIndicator,
    this.sizeSelectIndicator = 10,
    this.sizeUnSelectIndicator = 9,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final int quantity;
  final int currentPage;
  final Color? colorSelectIndicator;
  final Color? colorUnSelectIndicator;
  final double? sizeSelectIndicator;
  final double? sizeUnSelectIndicator;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment!,
      crossAxisAlignment: crossAxisAlignment!,
      children: List.generate(
        quantity,
        (index) => Container(
          margin: const EdgeInsets.only(right: 8),
          child: _indicator(
            color: _colorIndicator(context: context, index: index),
            size: currentPage == index
                ? sizeSelectIndicator!
                : sizeUnSelectIndicator!,
          ),
        ),
      ),
    );
  }

  Widget _indicator({
    required Color? color,
    required double size,
  }) =>
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      );

  Color? _colorIndicator({
    required BuildContext context,
    required int index,
  }) {
    Color? _colorSelectIndicator =
        colorSelectIndicator ?? Theme.of(context).primaryColor;
    Color? _colorUnSelectIndicator = colorUnSelectIndicator ?? Colors.grey[200];
    if (currentPage == index) {
      return _colorSelectIndicator;
    }
    return _colorUnSelectIndicator;
  }
}
