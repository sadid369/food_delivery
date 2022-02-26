// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  SmallText({
    this.height = 1.2,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 12,
    this.overflow = TextOverflow.ellipsis,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Roboto',
        color: color,
        height: height,
      ),
    );
  }
}
