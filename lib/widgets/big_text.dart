// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({
    this.color = const Color(0xFF332d2d),
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: size,
        fontFamily: 'Roboto',
        color: color,
      ),
    );
  }
}
