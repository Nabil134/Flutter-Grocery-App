import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';
import 'package:flutter_grocery_app/screens/Add%20To%20Cart%20Page%20View/Add%20Card%20Page%20View/add_card_page_view.dart';
import 'package:flutter_grocery_app/screens/Add%20To%20Cart%20Page%20View/Add%20To%20Cart%20Widget/CheckOut%20Page%20View/checkout%20page%20widget/custom_container_textfield.dart';
import 'package:flutter_grocery_app/screens/Add%20To%20Cart%20Page%20View/Add%20To%20Cart%20Widget/MyCustomButton_allUse.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home_page_view.dart';

import 'checkout page widget/myCustomAppBar_allUse.dart';

class CheckOutPageView extends StatefulWidget {
  const CheckOutPageView({super.key});


  @override
  State<CheckOutPageView> createState() => _CheckOutPageViewState();
}

class _CheckOutPageViewState extends State<CheckOutPageView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppDarkColors.black1));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.orangeLite));
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppDarkColors.black1,
      appBar:MyCustomAppBarAllUse(
        appBarText: 'Checkout',
      ),
    body: SingleChildScrollView(
      child: Column(children: [
        /*first portion start here*/
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30),
          child: Text('Delivery Address',style: CustomTextStyle16.h1SemiBold16,),
        ),
        /*first portion end here*/
        /*second portion start here*/
        CustomContainerTextField(borderColor: AppColors.orange,addressText: 'Home',
          hintText: "Enter you'r Home Address ",),
        /*second portion end here*/
        const SizedBox(height: 30,),
        /*third portion start here*/
        CustomContainerTextField(borderColor: AppDarkColors.black45,addressText: 'Office',
          hintText: "Enter you'r Office Address ",),
        /*third portion end here*/
        const SizedBox(height: 50,),
   /*four portion start here*/
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: AppColors.orange,
                width: 2,
              ),
            ),
          child: Icon(Icons.add,
            color: AppColors.orange,
            size: 20,
          ),
          ),
       const SizedBox(width: 10,),
          Text('Add New Address'),
        ],),
        /*four portion end here*/
        const SizedBox(height: 100,),
        /*last portion start here*/
        Center(child: MyCustomButtonAllUse(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddcartPageView(item: cartItems,),),);
        }, backgroundColor: AppColors.blueDark, text: "Add Card")),
        /*last portion end here*/
      ],),
    ),
    );
  }
}
