import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home_page_view.dart';
import 'package:flutter_grocery_app/screens/Product%20Detail%20Page%20View/Product%20Widget/product_detail_button2.dart';

import '../Track Order View/track_order_view.dart';

class OrderPageView extends StatefulWidget {
  const OrderPageView({super.key,required this.orderList});
  final List orderList;

  @override
  State<OrderPageView> createState() => _OrderPageViewState();
}

class _OrderPageViewState extends State<OrderPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkColors.black1,
      appBar: AppBar(
        titleSpacing: 36,
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        elevation: 0,
        title: Text('Orders',style: CustomTextStyle18.h1Bold18,),
        leading: CircleAvatar(
          backgroundColor: AppDarkColors.black10,
          child: InkWell(child: Icon(Icons.keyboard_arrow_left),),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: orderItem.length,
                itemBuilder: (context,index){
              return Column(children: [
               Row(children: [
                 CircleAvatar(
                   radius:32,
                   backgroundColor: Colors.transparent,
                   child: Image.network('${widget.orderList[index]['images']}'),
                 ),
             const SizedBox(width: 15,),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text('${widget.orderList[index]['description']}',style: CustomTextStyle18.h1SemiBold18,),
                ),
            const SizedBox(height: 5,),
                Text('${widget.orderList[index]['price']}',style: CustomTextStyle16.h1SemiBold16,),
              ],),
              const Spacer(),
                 Padding(
                   padding: const EdgeInsets.only(top: 30,right: 10),
                   child: Text('${widget.orderList[index]['id']}',style: CustomTextStyle16.h1SemiBold16,),
                 ),
               ],),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               Stack(children: [
                 Container(
                   height: 185,
                   width: 150,
                   child: CircleAvatar(
                     radius: 80,
                     backgroundColor: Colors.transparent,
                     child: Image.asset('assets/images/Delivery.gif'),
                   ),
                 ),
              Positioned(
                bottom:0,
                right:45,
                child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xffD4D4D4),
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                    style: BorderStyle.solid,
                  ),

               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.5),
                   spreadRadius: 10,
                   blurRadius: 10,
                   offset: Offset(0, 3),
                 ),
               ], ),
              child:Icon(Icons.place,
                color: AppColors.blue,
                size: 30,
              ),
              ),
              ),
               ],),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                Text('${widget.orderList[index]['description']}',style: CustomTextStyle20.h1Regular20,),
                Text(' are on the way',style: CustomTextStyle20.h1SemiBold20,),
              ProductDetailCustomButton2(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TrackOrderView()));
              }, text: "Track Order"),
              ],),
            ),
             ],) ,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 5),
                  child: Text('Meet Our Rider:${widget.orderList[index]['ridername']}',style: CustomTextStyle20.h1SemiBold20,),
                ),
             Padding(
               padding: const EdgeInsets.symmetric(
                 horizontal: 10
               ),
               child: Divider(
                 height: 60,
                 thickness: 1.0,
               ),
             ),
              ],);
            }),

          ],),
        ),
      ),
    );
  }
}
