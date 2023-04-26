import 'package:flutter/material.dart';
import 'package:fooddelivery/Utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  SmallText({
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.height = 1.2,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size == 0 ? Dimensions.height12 : size,
        height: height,
      ),
    );
  }
}
