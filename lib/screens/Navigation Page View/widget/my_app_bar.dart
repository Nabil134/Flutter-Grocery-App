import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';

import '../../Add To Cart Page View/add_to_cart_page.dart';
import '../../Home Page View/home_page_view.dart';
const double kToolbarHeight = 80;
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {

  const MyAppBar({super.key,required this.appBarText});
  final String appBarText;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 36,
        backgroundColor: Colors.transparent,
        toolbarHeight: kToolbarHeight,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundColor: AppDarkColors.black10,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.keyboard_arrow_left),
            ),
          ),
        ),
        title: Text(widget.appBarText,style: CustomTextStyle16.h1Regular16,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black,size: 25,),),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 15) ,
              child: IconButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddToCartPage(
                      items: cartItems,
                    ),
                  ),
                );
                setState(() {
                });
              }, icon:const Icon(Icons.shopping_bag_outlined,size: 28,color: Colors.black,),),
            ),
            Positioned(
              right: 6,
              top: 20,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.amber,
                ),
                child: Center(child: Text(cartItems.length.toString(),style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),),
              ),
            ),
          ], ),
        ],
      ),
    );
  }
}
