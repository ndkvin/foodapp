import 'package:flutter/material.dart';
import 'package:foodapp/widget/small_text.dart';

class IconAndText extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color iconColor;

  IconAndText({ 
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}