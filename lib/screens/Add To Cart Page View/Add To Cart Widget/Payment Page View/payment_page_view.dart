import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPageView extends StatefulWidget {
  const PaymentPageView({super.key});

  @override
  State<PaymentPageView> createState() => _PaymentPageViewState();
}

class _PaymentPageViewState extends State<PaymentPageView> {
  @override
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppDarkColors.black1),);
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.blue),);
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkColors.black1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
/*first portion start here*/
      Image.asset('assets/images/payment.gif',width: 330,),
      /*first portion end here*/
        /*second portion start here*/
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text('Your Payment was',style: GoogleFonts.manrope(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
        ),
        /*second portion end here*/
        /*third portion start here*/
        Text('Successfully',style: GoogleFonts.manrope(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        /*third portion end here*/
      ],),
    );
  }
}
