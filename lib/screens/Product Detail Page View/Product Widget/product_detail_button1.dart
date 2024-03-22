import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';

class ProductDetailCustomButton1 extends StatelessWidget {
  const ProductDetailCustomButton1({super.key,required this.onPressed,required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),child: InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          border: Border.all(
            color: AppColors.blue,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
     child: Center(child: Text(text,style: TextStyle(
       fontSize: 16,fontWeight: FontWeight.w600,
       color: AppColors.blue,
     ),),),
      ),
    ), );
  }
}
