import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';

class ProductDetailCustomButton2 extends StatelessWidget {
  const ProductDetailCustomButton2({super.key,required this.onPressed,required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),child: InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 150,
     //   width: screenWidth * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.blueDark,

        ),
        child: Center(child: Text(text,style: TextStyle(
          fontSize: 16,fontWeight: FontWeight.w600,
          color: AppDarkColors.black10,
        ),),),
      ),
    ), );
  }
}
