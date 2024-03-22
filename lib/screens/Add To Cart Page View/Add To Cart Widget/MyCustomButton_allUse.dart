import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';

class MyCustomButtonAllUse extends StatelessWidget {
  const MyCustomButtonAllUse({super.key,required this.onPressed,required this.backgroundColor,required this.text});
  final Color backgroundColor;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 65,
        width: 330,
decoration: BoxDecoration(
  color: backgroundColor,
  borderRadius: BorderRadius.circular(20),
),
        child: Center(child: Text(text,style: TextStyle(
          fontSize: 17,
          color: AppDarkColors.black1,
        ),),),
      ),
    );
  }
}
