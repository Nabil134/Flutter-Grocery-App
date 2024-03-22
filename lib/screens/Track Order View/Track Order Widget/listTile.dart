import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';

class ListTileDelivery extends StatelessWidget {
  const ListTileDelivery({super.key,required this.iconDeliver,required this.title,required this.subtitle});
   final Icon iconDeliver;
   final String title;
   final String subtitle;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: iconDeliver,
      ),
   title: Text(title,style: TextStyle(fontSize: 14,
     fontWeight: FontWeight.w400,
     color: Color(0xff616A7D),
   ),),
   subtitle: Text(subtitle,style: CustomTextStyle18.h1SemiBold18,),
    );
  }
}
