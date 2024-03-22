import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';
import 'package:flutter_grocery_app/screens/Track%20Order%20View/Track%20Order%20Widget/listTile.dart';

class TrackOrderView extends StatefulWidget {
  const TrackOrderView({super.key});

  @override
  State<TrackOrderView> createState() => _TrackOrderViewState();
}

class _TrackOrderViewState extends State<TrackOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkColors.black1,
      appBar: AppBar(
        titleSpacing: 36,
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundColor: AppDarkColors.black10,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.keyboard_arrow_left),
            ),
          ),
        ),
      title: Text('Track Order',style: CustomTextStyle18.h1Regular18,),
      ),
    body: SingleChildScrollView(
      child: Column(children: [
/*first portion start here*/
      Stack(children: [
        Container(height: 450,width: 380,
          child: Image.asset('assets/images/Directions.gif',fit: BoxFit.contain,),
        ),
    Positioned(
      top: 370,
      child: Container(
      height: 75,
      width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppDarkColors.black10,
      ),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular( 50),
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
            ],
            ),
        child: CircleAvatar(
          backgroundColor: AppDarkColors.black10,
          radius: 25,
          child: Image.asset('assets/images/man.png',width:45,),
        ),
          ),
       title: Text('Delivery Man',style: TextStyle(
         fontSize: 14,
         fontWeight: FontWeight.w400,
         color: Color(0xff616A7D),
       ),),
       subtitle: Text('John William',style: CustomTextStyle18.h1SemiBold18,),
          trailing: CircleAvatar(
            backgroundColor: AppColors.blue,
            radius: 25,
            child: Image.asset('assets/images/Chat.png'),
          ),
        ),
    ),
    ),
      ],),
      /*first portion end here*/
        /*second portion start here*/
        const ListTileDelivery(iconDeliver: Icon(Icons.location_on_outlined),
            title: "Delivery Address", subtitle:'37 New line, Sunamganj'),
        /*second portion end here*/
        /*third portion start here*/
        const ListTileDelivery(iconDeliver: Icon(Icons.access_time),
            title: "Delivery In", subtitle:'20 min'),
        /*third portion end here*/
        /*last portion start here*/
        BottomSheet(onClosing: (){}, builder: (context){
          return Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppDarkColors.black10,
              borderRadius:BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          child: Column(children: [
            Container(
              height: 5,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.blue,
              ),
            ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           Text("Order Details",
           style: CustomTextStyle16.h1SemiBold16,
         ),
            Text(
              "(ID: #765433)",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff616A7D),
              ),
            ),
       Container(
         height: 28,
         width: 95,
         decoration: BoxDecoration(
           color: AppDarkColors.black20,
           borderRadius: BorderRadius.circular(20),
         ),
       child:Center(
         child: Text('Success',style: TextStyle(
           fontSize: 15,
           fontWeight: FontWeight.w700,
           color: AppColors.blue,

         ),),
       ),
       ),
         ],),
          ],),
          );
        }),
        /*last portion end here*/
      ],),
    ),
    );
  }
}
