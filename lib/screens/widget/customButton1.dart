import 'package:flutter/material.dart';

import '../../constant/custom_textstyle.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({super.key,required this.onPressed,required this.backgroundColor,required this.text,required this.textColor});
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed,
      child: Container(
        padding: EdgeInsets.all(16.0),
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20.0),
  color: backgroundColor,
),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Text(text,
          style: CustomTextStyle18.h1SemiBold18,
        ),
        const Icon(Icons.arrow_forward),
      ],),
      ),
    );
  }
}
