// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fooddelivery/Utils/dimensions.dart';

class CustomTextWidget extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  CustomTextWidget({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          letterSpacing: 1,
          fontSize: size == 0 ? Dimensions.height20 : size,
          fontFamily: "Poppins"),
    );
  }
}
