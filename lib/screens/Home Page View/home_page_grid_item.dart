import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home%20page%20widget/home_page_product_data.dart';
import 'package:flutter_grocery_app/screens/Product%20Detail%20Page%20View/lipton_tea_page.dart';

import '../../constant/App_Colors.dart';
import '../Product Detail Page View/lemonade_page.dart';

class HomePageGridItem extends StatefulWidget {
  const HomePageGridItem({super.key,required this.addToFavCallBack,required this.addToCartCallBack});
  final Function(int) addToCartCallBack;
  final Function(int) addToFavCallBack;

  @override
  State<HomePageGridItem> createState() => _HomePageGridItemState();
}

class _HomePageGridItemState extends State<HomePageGridItem> {
  /*_navigateToProductPage start here*/
  _navigateToProductPage(int index){
    switch(index){
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LemonadePage()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LiptonTeaPage()));
        break;
    }

  }
  /*_navigateToProductPage end here*/
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GridView.builder(
        itemCount: homePageProductData.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 252,
      ), itemBuilder: (context,index){
          bool isFavorite=homePageProductData[index]['isFav'];
          Color itemColor=isFavorite==true?Colors.red:AppDarkColors.black10;
return Stack(children: [
  Container(
    width: 200,
    decoration: BoxDecoration(
      color: AppDarkColors.black10,
      borderRadius: BorderRadius.circular(10),
    ),
  ),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
  InkWell(child: ClipRRect(
    child: Image.network('${homePageProductData.elementAt(index)['images']}',width: double.infinity,
      height: 160,
      fit: BoxFit.contain,
    ),
  ),onTap: (){
    _navigateToProductPage(index);
  },
  ),
  Padding(
    padding: const EdgeInsets.only(left: 14,right: 14),
child: Divider(
  color: AppColors.blue,
  thickness: 0.1,
),
  ),
Padding(
  padding: const EdgeInsets.only(left: 15,top: 5),
  child:   Text('${homePageProductData.elementAt(index)['price']}',style: CustomTextStyle18.h1Bold18,),
),
  Padding(
    padding: const EdgeInsets.only(left: 15),
    child:   Text('${homePageProductData.elementAt(index)['description']}',style: CustomTextStyle18.h1Bold18,),
  ),
],),
  Positioned(
    right: 14,
    top: 182,
    child: InkWell(child: CircleAvatar(
    radius: 17,
    backgroundColor: AppColors.blue,
    child: Icon(Icons.add,color: Colors.white,size: 20,),
  ),
  onTap: (){
      widget.addToCartCallBack(index);
  },
    ),
  ),
  Positioned(
    right: 60,
    top: 182,
    child: InkWell(child: CircleAvatar(
    radius: 17,
    backgroundColor: AppColors.blue,
    child: Icon(Icons.favorite,color: itemColor ,size: 20,),
  ),
 onTap: (){
widget.addToFavCallBack(index);
 },
  ),

  ),
],);
      }),
    );
  }
}
