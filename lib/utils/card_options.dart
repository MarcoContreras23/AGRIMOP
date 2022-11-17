import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CardOptions extends StatelessWidget {
  const CardOptions({
    Key? key,
    this.onTap,
     required this.icon,
     this.title,
     this.description,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onTap;
  final String? title, description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
        color: Colors.blue,
      ),
      title: _titleCard(),
      trailing: const Icon(
        Feather.arrow_right,
        size: 25,
        color: Colors.blue,
      ),
      onTap: onTap,
    );
  }

  Widget _titleCard() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _textTitle(
            text: title!,
            fontWeight: FontWeight.w600,
            size: 18,
            color: Colors.black,
          ),
          const SizedBox(height: 6),
          _textTitle(
            text: description!,
            fontWeight: FontWeight.w400,
            size: 14,
            color: Colors.black,
          ),
        ],
      );

  Widget _textTitle({
    required String text,
    required FontWeight fontWeight,
    required double size,
    required Color color,
  }) =>
      Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
        ),
      );
}
