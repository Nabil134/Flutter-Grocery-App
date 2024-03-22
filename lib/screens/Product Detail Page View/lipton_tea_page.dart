import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';
import 'package:flutter_grocery_app/screens/Navigation%20Page%20View/widget/my_app_bar.dart';

import '../../constant/App_Colors.dart';
import 'Product Widget/product_detail_button1.dart';
import 'Product Widget/product_detail_button2.dart';

class LiptonTeaPage extends StatefulWidget {
  const LiptonTeaPage({super.key});

  @override
  State<LiptonTeaPage> createState() => _LiptonTeaPageState();
}

class _LiptonTeaPageState extends State<LiptonTeaPage> {
  int activePage=0;
  final PageController pageController=PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarText: 'Lipton Tea Page',),
      body: SingleChildScrollView(
        child: Column(children: [
          /*first portion start here*/
          Container(
            child: SizedBox(
              height: 160,
              child: PageView(
                controller: pageController,
                onPageChanged: (int index){
                  setState(() {
                    activePage=index;
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 42,right: 35),
                    child:   Container(
                      child: Column(children: [
                        Row(children: [
                          const SizedBox(width: 65,),
                          Image.asset('assets/images/lipton1.png',width: 180,),
                        ],),
//const SizedBox(height: 40,),
                      ],),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42,right: 35),
                    child:   Container(
                      child: Column(children: [
                        Row(children: [
                          const SizedBox(width: 65,),
                          Image.asset('assets/images/lipton2.png',width: 180,),
                        ],),
//const SizedBox(height: 40,),
                      ],),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42,right: 35),
                    child:   Container(
                      child: Column(children: [
                        Row(children: [
                          const SizedBox(width: 65,),
                          Image.asset('assets/images/lipton3.png',width: 180,),
                        ],),
//const SizedBox(height: 40,),
                      ],),

                    ),
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:125),
            child: Row(children: List.generate(3, (index) => Padding(padding:const EdgeInsets.only(right: 5),child:
            Container(
              height: activePage==index?6:4,
              width: activePage==index?45:25,
              decoration: BoxDecoration(
                color: activePage==index?AppColors.orangeLite:AppDarkColors.black20,
                borderRadius: BorderRadius.circular(5),
              ),
            ),),),),
          ),
          /*first portion end here*/
          /*second portion start here*/
          BottomSheet(onClosing: (){}, builder:(context){
            return Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
              child: Container(
               // height: 477,
                height: MediaQuery.of(context).size.height * 0.8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppDarkColors.black10,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
child: Column(children: [
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    child: Text('Pure Choise Top\nLipton Tea',style:CustomTextStyle20.h1SemiBold20,),
  ),
Row(children: [
  Flexible(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text('\$34.70/KG',style:TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.blue,
      ),),
    ),
  ),
],),
  /*rating portion start here*/
  Row(children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
      child: AnimatedRatingStars(
        initialRating: 3,
        minRating: 0.0,
        maxRating: 5.0,
        filledColor: Colors.amber,
        emptyColor: Colors.grey,
        filledIcon: Icons.star,
        halfFilledIcon: Icons.star_half,
        emptyIcon: Icons.star_border,
        onChanged: (double rating) {
          // Handle the rating change here
          print('Rating: $rating');
        },
        displayRatingValue: true,
        interactiveTooltips: true,
        customFilledIcon: Icons.star,
        customHalfFilledIcon: Icons.star_half,
        customEmptyIcon: Icons.star_border,
        starSize: 15.0,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        readOnly: false,
      ),
    ),
    Text('110 reviews',style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppDarkColors.black20,
    ),),
  ],),
  /*rating portion end here*/
  /*detail start here*/
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text('Details',style:CustomTextStyle18.h1SemiBold18),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Text('A lemon is a yellow citrus fruit. It is related to the orange. Lemon juice is about 5% citric acid, and has a pH of 2 to 3. Lemon plants vary in size yet stay generally small.',style:TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppDarkColors.black60,
      ),),
    ),
  ],),
  /*detail end here*/
  /*Nutrient Portion start here*/
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 12),
        child: Text(
          "Nutrition facts",
          style: CustomTextStyle18.h1SemiBold18,
        ),
      ),
      Icon(Icons.keyboard_arrow_down,size: 30,color: AppDarkColors.black45,) ,
    ],),
  /*Nutrient Portion end here*/
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Divider(thickness: 2,),
  ),
  /*Reviews Portion start here*/
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 12),
        child: Text(
          "Reviews",
          style: CustomTextStyle18.h1SemiBold18,
        ),
      ),
      Icon(Icons.keyboard_arrow_down,size: 30,color: AppDarkColors.black45,) ,
    ],),
  /*Custom button start here*/
  Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(child: ProductDetailCustomButton1(onPressed: (){},text: 'Add To Cart',),),
      Expanded(child: ProductDetailCustomButton2(onPressed: (){}, text: 'Buy Now'),),
    ],),
  /*Custom button end here*/
  /*Reviews Portion end here*/
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Divider(thickness: 2,),
  ),
],),
              ),
            );
          }),
          /*second portion end here*/


        ],),
      ),
    );
  }
}

