import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';
import 'package:flutter_grocery_app/screens/widget/customButton1.dart';

import 'Bottom Navigation Bar/curved_navigation.dart';
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int activePage=0;
  final PageController pageController =PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 33, bottom: 30),
          child: Column(children: [
            /*first portion start here*/
            Container(
              child: SizedBox(
                height: height * 0.35,
                child: PageView(
controller: pageController,
                  onPageChanged: (int index){
  setState(() {
    activePage=index;
  });
                  },
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 42, right: 35),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                            "You'r Groceries\nWithout Stress at",
                            style: CustomTextStyle30.h1Bold30,
                          ),
                       Row(children: [
                         Text(
                           "Home",
                           style: CustomTextStyle30.h1Bold30,
                         ),
                         SizedBox(
                           width: 25,
                         ),
                    Image.asset('assets/images/emoji.png'),

                       ],),
                           SizedBox(height: 30,),
                            Text(
                              "Shop from a wide selection of grocery item from topbrands withover 80.000 items on our online supermarket....",
                              style: CustomTextStyle18.h1Medium18,
                            ),
                          ],),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 42, right: 35),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amazing Discounts& offers Speedy at",
                              style: CustomTextStyle30.h1Bold30,
                            ),
                            Row(children: [
                              Text(
                                "Doorstep",
                                style: CustomTextStyle30.h1Bold30,
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Image.asset('assets/images/emoji.png'),

                            ],),
                            SizedBox(height: 30,),
                            Text(
                              overflow:TextOverflow.ellipsis,
                              maxLines:2,
                              "Cheaper prices than you'r local supermarket, great discounts and cashback offers to top it off....",
                              style: CustomTextStyle18.h1Medium18,
                            ),
                          ],),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 42, right: 35),
              child: Row(children: List.generate(2, (index) => Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  height: activePage == index ? 6 : 4,
                  width: activePage == index ? 45 : 25,
                  decoration: BoxDecoration(
                    color: activePage==index?AppDarkColors.black1:AppDarkColors.black45,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),),),
            ),
/*first portion end here*/
          const SizedBox(height: 20,),
            /*second portion start here*/
          ClipRRect(child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
         child: Image.asset('assets/images/Catalogue.gif',
           height: 270,
           width: 270,
         ),
          ),),
            /*second portion end here*/
     //  Spacer(),
            /*last portion start here*/
          SizedBox(
            height: height * 0.08,
            width: width * 0.75,
            child: CustomButton1(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CurvedNavigationBottom(),
                  ),
                );
              },
text: "Get Started",
              backgroundColor: AppDarkColors.black1,
              textColor: AppDarkColors.black100,
            ),
          ),

            /*last portion end here*/
          ],),
        ),
      ),),
    );
  }
}
