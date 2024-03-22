import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home%20page%20widget/custom_row.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home%20page%20widget/home_page_product_data.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home%20page%20widget/text_field.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home_page_grid_item.dart';

import '../Add To Cart Page View/add_to_cart_page.dart';
/*Global Cart Item List*/
List cartItems=[];
List favItems=[];
List orderItem=[
];
/*Global Cart Item List*/
class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.blue));
  }
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.blue));
    super.dispose();

  }
  /*placeOrderCallBack start here*/
  void placeOrderCallBack() {
    setState(() {
      orderItem.addAll(cartItems);
   //   cartItems.clear(); // Clear the cart after placing the order
      print(orderItem);
      print(orderItem.length);
    });
  }
  /*placeOrderCallBack end here*/
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          /*first portion start here*/
          Container(height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.blue,
            ),
         child: Column(children: [
Padding(
  padding: const EdgeInsets.only(left: 22,right: 22),
  child:   CustomTextField(),
),
         Padding(
           padding: const EdgeInsets.only(top:20,left: 16,right: 45),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Text('DELIVERY TO',style: TextStyle(
               color: AppDarkColors.black45,
               fontSize: 11,
               fontWeight: FontWeight.w800,
             ),),
             Text('WITHIN',style: TextStyle(
               color: AppDarkColors.black45,
               fontSize: 11,
               fontWeight: FontWeight.w800,
             ),),
           ],),
         ),
           Padding(
             padding: const EdgeInsets.only(top:5,left: 16,right: 10),
             child: Row(
               children: [
                 Text(
                   "Green Way 3000, Sylhet",
                   style: TextStyle(
                     fontSize: 14,
                     color: Colors.white,
                   ),
                 ),
                 SizedBox(
                   width: 5.0,
                 ),
                 Icon(
                   Icons.keyboard_arrow_down,
                   color: Colors.white,
                 ),
              Spacer(),
                 Row(children: [
                   Text(
                     "1 Hour",
                     style: TextStyle(
                       fontSize: 14,
                       color: Colors.white,
                     ),
                   ),
                   Icon(
                     Icons.keyboard_arrow_down,
                     color: Colors.white,
                   ),
                   SizedBox(
                     width: 8.0,
                   ),

                 ],),
               ],),
           ),
         ],),
          ),
          /*first portion end here*/
          const SizedBox(height: 20,),
          /*second portion portion here*/
          SingleChildScrollView(
            scrollDirection:Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(children: [
                CustomRowUsdHrs(backgroundColor: AppColors.orangeLite,
                    digitText: '346', usdHrsText: 'USD', description: 'Yours Total savings'),
                const SizedBox(
                  width: 20,
                ),
                CustomRowUsdHrs(
                  digitText: "215",
                  usdHrsText: "HRS",
                  description: "Your time saved",
                  backgroundColor: AppDarkColors.black20,
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomRowUsdHrs(backgroundColor: AppColors.orangeLite,
                    digitText: '400', usdHrsText: 'USD', description: 'Yours Total savings'),
                const SizedBox(
                  width: 20,
                ),
                CustomRowUsdHrs(
                  digitText: "250",
                  usdHrsText: "HRS",
                  description: "Your time saved",
                  backgroundColor: AppDarkColors.black20,
                ),

              ],),
            ),
          ),
          /*second portion end here*/
          const SizedBox(height: 10,),
          /*third portion start here*/
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Recommended',style: CustomTextStyle30.h1Regular30,),
          ),
          /*third portion end here*/
            /*last portion start here*/
            HomePageGridItem(
addToFavCallBack: (index){
  /*
  if (!favItems.any((item) => item['id'] == homePageProductData[index]['id'])) {
    setState(() {
      favItems.add(homePageProductData[index]);
      print('Added to favorites: ${homePageProductData[index]}');
      print('Total favorite items: ${favItems.length}');
    });
  } else {
    final description = homePageProductData[index]['description'];
    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(
        backgroundColor: AppDarkColors.grey,
        content: Text("$description Already exists in the Favorites"),
      ),
    );
  }
*/

  setState(() {

    if(homePageProductData[index]['isFav']==true){
      // If it's already a favorite, remove it from favorites
      homePageProductData[index]["isFav"] = false;
      favItems.remove(homePageProductData[index]);
      print(favItems);
    }
    else{
      // If it's not a favorite, add it to favorites
      homePageProductData[index]["isFav"] = true;
      favItems.add(homePageProductData[index]);
      print(favItems);
      print(favItems.length);
    }

  });

},

/*addToCartcallBack start here*/
            addToCartCallBack: (index){
              setState(() {
                cartItems.add(homePageProductData[index]);
                print(cartItems);
                print(cartItems.length);
               placeOrderCallBack();
              });
            },
            /*addToCartCallBack end here*/

            ),
            /*last portion end here*/
        ],),
      ),
    );
  }
}
