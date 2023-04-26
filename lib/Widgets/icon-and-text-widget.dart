import 'package:flutter/material.dart';
import 'package:fooddelivery/Utils/dimensions.dart';
import 'package:fooddelivery/Widgets/small-text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  double size;
  IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      this.size = 0,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: size==0 ? Dimensions.value25 : size,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(text: text)
      ],
    );
  }
}
