import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';

class CustomContainerTextField extends StatelessWidget {
  const CustomContainerTextField({super.key,required this.borderColor,required this.addressText,required this.hintText});
  final Color borderColor;
  final String addressText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 120,
        width: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderColor,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
child: Column(
  //mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
  child:   Text(addressText,style: CustomTextStyle18.h1Regular18,),
),
    Padding(padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: AppColors.orange,
        child: Icon(Icons.done,
          size: 19,
          color: Colors.black,
        ),
      ),
    ),
  ],),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15),
  child:   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

    Expanded(child: TextFormField(
      validator: (value){
        return;
      },
        style:CustomTextStyle18.h1SemiBold18,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.w400),
        suffixText: 'Edit',
        suffixStyle: TextStyle(
          color: Colors.blue,
          fontSize: 15,
        ),
        border: InputBorder.none,
      )
    ),),

  ],),
),
],),
      ),
    );
  }
}
