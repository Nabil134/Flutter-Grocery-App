import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Onboarding view/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnboardingView()));
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppDarkColors.black1));
    return Scaffold(
      backgroundColor: AppDarkColors.black1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        /*first portion start here*/
        Center(child: Image.asset('assets/images/splashimage.png',width: 300,),
        ),
        /*first portion end here*/
        /*second portion start here*/
        Text('Little Shops',style: GoogleFonts.manrope(
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),),
        /*third portion start here*/
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Text(
            "Groceries",
            style: GoogleFonts.roboto(
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        /*third portion end here*/
      ],),
    );

  }
}
