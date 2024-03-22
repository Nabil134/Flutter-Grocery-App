import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home%20page%20widget/home_page_product_data.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home_page_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/custom_textstyle.dart';

class FavouritePageView extends StatefulWidget {
  final List favoriteItems;
  const FavouritePageView({super.key,required this.favoriteItems});

  @override
  State<FavouritePageView> createState() => _FavouritePageViewState();
}

class _FavouritePageViewState extends State<FavouritePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkColors.black1,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.blue,
        elevation: 0,
        title: Text(
          "Hey, Nabil",
          style: CustomTextStyle22.h1SemiBold22,
        ),
     actions: [
       Stack(children: [
         Padding(
           padding: const EdgeInsets.only(top: 15) ,
           child: IconButton(onPressed: (){
             setState(() {
             });
           }, icon:const Icon(Icons.shopping_bag_outlined,size: 28,),),
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
             child: Center(child: Text(cartItems.length.toString(),style: TextStyle(color: Colors.white,
               fontWeight: FontWeight.bold,
             ),),),
           ),
         ),
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
             padding: const EdgeInsets.only(left: 16),
             child: Text(
               "Favourite",
               style:GoogleFonts.lato(
                 fontSize: 50,
                 fontWeight: FontWeight.w800,
                 color: AppDarkColors.black1,
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 16),
             child: Text(
               "Items",
               style:GoogleFonts.lato(
                 fontSize: 50,
                 fontWeight: FontWeight.w300,
                 color: AppDarkColors.black1,
               ),
             ),
           ),
         ],),
          ),
          /*first portion end here*/
          /*second portion start here*/
          widget.favoriteItems.isEmpty?Column(children: [
            Image.network(
              "https://media0.giphy.com/media/0HhDnlH89djZtRqYoO/giphy.gif?cid=6c09b952v2qplzygq5871ii8uf74a6geqdm2zq40zo4jsnm8&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=s",
              height: 290,
            ),
            Text(
              "Your Favourite List is empty",
              style: CustomTextStyle20.h1SemiBold20,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Explore more and shortlist some items",
              style:CustomTextFieldStyle14.h1Medium14,
              textAlign: TextAlign.center,
            ),
          ],):
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.favoriteItems.length,
              itemBuilder: (context,index){
              bool isFavorite=homePageProductData[index]['isFav'];
              Color itemColor=isFavorite==true?Colors.red:AppDarkColors.black10;
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                child: Image.network("${widget.favoriteItems[index]['images']}"),),
              title: Text('${widget.favoriteItems[index]['description']}', style: CustomTextFieldStyle14.h1Medium14),
              subtitle: Text('${widget.favoriteItems[index]['price']}', style: CustomTextFieldStyle14.h1Medium14),
           trailing: InkWell(
             onTap: (){
               setState(() {
                 if (homePageProductData[index]["isFav"]) {
                   // If it's already a favorite, remove it from favorites
                   homePageProductData[index]["isFav"] = false;
                   widget.favoriteItems
                       .remove(homePageProductData[index]);
                 } else {
                   // If it's not a favorite, add it to favorites
                   homePageProductData[index]["isFav"] = true;
                   widget.favoriteItems
                       .add(homePageProductData[index]);
                 }

               });
             },
             splashColor: Colors.greenAccent,
             child: Container(
             height: 40,
             width: 40 ,
             decoration: BoxDecoration(
               color: AppColors.blue,
               borderRadius: BorderRadius.circular(20),
             ),
          child: Icon(Icons.favorite,size: 25,
            color: itemColor,
          ),
           ),),
            );
          }),
          /*second portion end here*/
        ],),
      ),
    );
  }
}
