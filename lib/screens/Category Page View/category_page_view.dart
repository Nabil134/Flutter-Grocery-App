import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';
import 'package:flutter_grocery_app/screens/Category%20Page%20View/Category%20Page%20Widget/category_page_grid_items.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home_page_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Add To Cart Page View/add_to_cart_page.dart';

class CategoriesPageView extends StatefulWidget {
  const CategoriesPageView({super.key});

  @override
  State<CategoriesPageView> createState() => _CategoriesPageViewState();
}

class _CategoriesPageViewState extends State<CategoriesPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkColors.black1,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.blue,
        elevation: 0,
        title: Text('Hi Nabil',style: CustomTextStyle22.h1SemiBold22),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 28,),),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
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
              }, icon: Icon(Icons.shopping_bag_outlined,size: 28,),),
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
             ),),
          ],),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          /*first portion start here*/
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.blue,
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Shop",
                style: GoogleFonts.lato(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: AppDarkColors.black1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "By Category",
                style: GoogleFonts.lato(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: AppDarkColors.black1,
                ),
              ),
            ),
          ],),
          ),
          /*first portion end here*/
          /*last portion start here*/
         CategoryPageGridItem(),
          /*last portion end here*/

    ],),
      ),);
  }
}
