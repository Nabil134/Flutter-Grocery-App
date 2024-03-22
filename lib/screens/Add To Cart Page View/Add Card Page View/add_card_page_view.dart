import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';
import 'package:flutter_grocery_app/screens/Add%20To%20Cart%20Page%20View/Add%20To%20Cart%20Widget/CheckOut%20Page%20View/checkout%20page%20widget/myCustomAppBar_allUse.dart';
import 'package:flutter_grocery_app/screens/Add%20To%20Cart%20Page%20View/Add%20To%20Cart%20Widget/MyCustomButton_allUse.dart';
import 'package:flutter_grocery_app/screens/Add%20To%20Cart%20Page%20View/Add%20To%20Cart%20Widget/Payment%20Page%20View/payment_page_view.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home_page_view.dart';

class AddcartPageView extends StatefulWidget {
  final List item;
  const AddcartPageView({super.key,required this.item});

  @override
  State<AddcartPageView> createState() => _AddcartPageViewState();
}

class _AddcartPageViewState extends State<AddcartPageView> {
  double parsePrice(String price){
    return double.parse(price.replaceAll('\$',''));
  }
  //calculateSubTotal start here
  calculateSubTotal(){
    double subtotal=0.00;
    for(final cartItem in widget.item){
      double itemPrice = parsePrice(cartItem['price']);
      int quantity=int.parse(cartItem['quantity']);
      subtotal += itemPrice * quantity;
    }
    return subtotal;
  }
  //calculateSubTotal end here
  //calculateTotal start here
  double calculateTotal(){
    double subtotal = calculateSubTotal();
    double deliverycharges=20.0;// Change this to your actual delivery charges
    return subtotal + deliverycharges;
  }
  //calculateTotal end here
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppDarkColors.black1));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppDarkColors.black1));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:MyCustomAppBarAllUse(appBarText: 'Add Card',),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          /*first portion start here*/
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 30,
            ),
            child: Text('CARD HOLDER NAME',style: CustomTextStyle16.h1SemiBold16,),
          ),
          /*first portion end here*/
          /*second portion start here*/
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              style: CustomTextStyle18.h1SemiBold18,
              decoration: InputDecoration(
                hintText: "Enter you'r name",
                hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppDarkColors.black45,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          /*second portion end here*/
/*third portion start here*/
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 30,
            ),
            child: Text('CARD NUMBER',style: CustomTextStyle16.h1SemiBold16,),
          ),
        /*third portion end here*/
          /*second portion start here*/
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              keyboardType: TextInputType.number,
              style: CustomTextStyle18.h1SemiBold18,
              decoration: InputDecoration(
                hintText: "Enter you'r card number",
                hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppDarkColors.black45,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          /*second portion end here*/
          /*third portion start here*/
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: Text('EXP DATE',style: CustomTextStyle16.h1SemiBold16,),
            ),
           const SizedBox(width: 80,),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
                right: 30,
              ),
              child: Text('CVC',style: CustomTextStyle16.h1SemiBold16,),
            ),
          ] ,),
          /*third portion end here*/
          /*four portion start here*/
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  style: CustomTextStyle18.h1SemiBold18,
                  decoration: InputDecoration(
                    hintText: "EXP Date",
                    hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppDarkColors.black45,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: CustomTextStyle18.h1SemiBold18,
                  decoration: InputDecoration(
                    hintText: "CVC Number",
                    hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppDarkColors.black45,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],),
          /*four portion end here*/
          const SizedBox(height: 80,),
          /*five portion start here*/
          BottomSheet(
            enableDrag: false,
              onClosing: (){}, builder: (context){
              double subtotal=calculateSubTotal();
              double deliveycharges=calculateTotal()-calculateSubTotal();
              double total =calculateTotal();
            return Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
height: 230,
                decoration: BoxDecoration(
                  color: AppDarkColors.black10,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 8,
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(
                      "Subtotal",
                      style: CustomTextFieldStyle14.h1Medium14,
                    ),
                    Text(
                      '\$$subtotal',
                      style: CustomTextStyle16.h1Medium16,
                    ),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Charges",
                        style: CustomTextFieldStyle14.h1Medium14,
                      ),
                      Text(
                        '\$$deliveycharges',
                        style: CustomTextStyle16.h1Medium16,
                      ),
                    ],),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: CustomTextFieldStyle14.h1Medium14,
                      ),
                      Text(
                        '\$$total',
                        style: CustomTextStyle16.h1Medium16,
                      ),
                    ],),
                ),
              ],),
              ),
              ),
            );
          }),
          /*five portion end here*/
            const SizedBox(height: 5,),
            /*last portion start here*/
            Center(
              child: MyCustomButtonAllUse(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentPageView(),),).then((value) => Navigator.of(context).popUntil((route) => route.isFirst),);
                setState(() {
                  cartItems.clear();
                  print(cartItems);
                });
              },
                text: "Make Payment",
                backgroundColor: AppColors.blueDark,
              ),
            ),
            /*last portion end here*/
        ],),
      ),
    );
  }
}
