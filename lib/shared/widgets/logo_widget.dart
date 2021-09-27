import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LogoWidget extends StatelessWidget {
  final Color accentColor;
  final double size;
  const LogoWidget({
    Key? key,
    this.accentColor = Colors.red,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.shopping_cart,
          size: size * 2.w,
          color: accentColor,
        ),
        Text.rich(
          TextSpan(text: 'Conceitual ', children: [
            TextSpan(text: 'S', style: TextStyle(color: accentColor)),
            const TextSpan(text: 'hop'),
          ]),
          style: TextStyle(fontSize: size.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
