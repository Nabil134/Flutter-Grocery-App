import 'package:flutter/cupertino.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';

class CustomRowUsdHrs extends StatelessWidget {
  const CustomRowUsdHrs({super.key, required this.backgroundColor,required this.digitText,
    required this.usdHrsText,
    required this.description,
  });
  final Color backgroundColor;
  final String digitText;
  final String usdHrsText;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text(digitText,style:const  TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w800,
  ),),
  const SizedBox(
    width: 8,
  ),
  Text(usdHrsText,style:const  TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w800,
  ),),
],),
      const SizedBox(
        height: 5,
      ),
      Text(
        description,
        style: CustomTextFieldStyle14.h1Medium14,
      ),
    ],),
    );
  }
}
