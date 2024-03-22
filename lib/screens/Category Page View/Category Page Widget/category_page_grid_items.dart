import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';

import '../../Navigation Page View/fish_page.dart';
import '../../Navigation Page View/fruit_page.dart';
import '../../Navigation Page View/meat_page.dart';
import '../../Navigation Page View/vegetable_page.dart';

class CategoryPageGridItem extends StatefulWidget {
  const CategoryPageGridItem({super.key});

  @override
  State<CategoryPageGridItem> createState() => _CategoryPageGridItemState();
}

class _CategoryPageGridItemState extends State<CategoryPageGridItem> {
  final List<Map<String,dynamic>> categoryPageGridItem=[
    {
      "title": "Fishes",
      "subtitle": "From Sea",
      "images":
      "https://www.nicepng.com/png/full/1-17276_fish-png-four-transparent-background-fish-png.png",
    },
    {
      "title": "Meats",
      "subtitle": "Organic",
      "images":
      "https://www.nicepng.com/png/full/67-676953_fresh-chicken-meat-png-raw-meat-png.png",
    },
    {
      "title": "Vegetables",
      "subtitle": "Organic",
      "images":
      "https://www.nicepng.com/png/full/6-67893_fruits-vegetables-png-fruits-and-vegetables-png.png",
    },
    {
      "title": "Fruits",
      "subtitle": "Fresh & Organic",
      "images":
      "https://www.nicepng.com/png/full/7-70090_fruit-basket-fruits-png-isolated-basket-of-fruits.png",
    },
    {
      "title": "Cooking Oil",
      "subtitle": "Organic",
      "images":
      "https://www.nicepng.com/png/full/50-504966_our-range-of-cooking-oils-for-healthy-and.png",
    },
    {
      "title": "Nike Shoes",
      "subtitle": "Natural Material",
      "images":
      "https://www.nicepng.com/png/full/4-40060_nike-shoes-transparent-png-nike-shoes-in-png.png",
    },
    {
      "title": "Playstations",
      "subtitle": "Gaming Gadget",
      "images":
      "https://www.nicepng.com/png/full/199-1997828_picture-of-sony-playstation-4-ps4-gold-500gb.png",
    },
    {
      "title": "Men's Jackets",
      "subtitle": "Organic",
      "images":
      "https://www.nicepng.com/png/full/116-1167980_best-vortex-jacket-stormtech-system-png-png-stormtech.png",
    },
    {
      "title": "Headphones",
      "subtitle": "Plurar Device",
      "images":
      "https://www.nicepng.com/png/full/203-2036447_modern-bluetooth-headphones-a-audio-headphones-inc-black.png",
    },
    {
      "title": "Caps",
      "subtitle": "Organic",
      "images":
      "https://www.nicepng.com/png/full/57-570835_spacex-x-cap-patagonia-p-6-label-trad.png",
    },
    {
      "title": "Gaming Chairs",
      "subtitle": "Ergonomic",
      "images":
      "https://www.nicepng.com/png/full/805-8050876_ergonomic-design-gaming-chair.png",
    },
  ];
  /*_navigateToPage start here*/
  _navigateToPage(int index){
    switch(index){
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const FishPage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MeatPage()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const VegetablePage()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const FruitPage()));
        break;
    }
  }
  /*_navigateToPage end here*/
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8),child: GridView.builder(
      shrinkWrap: true,
        itemCount:categoryPageGridItem.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing:20,mainAxisExtent: 210,
        ), itemBuilder:  (context,index){
return InkWell(
  onTap: (){
    _navigateToPage(index);
  },
  child: Container(
  width: 200,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: AppDarkColors.black10,
  ),
child: Column(
  children: [
    ClipRRect(child: Image.network("${categoryPageGridItem.elementAt(index)['images']}",width: 160,height: 140,fit: BoxFit.contain,),),
Padding(
  padding: const EdgeInsets.only(left: 15,right: 15),
  child:   Divider(
    thickness: 0.2,
    color: AppColors.blue,
  ),
),
    Text(categoryPageGridItem[index]['title'],style: CustomTextStyle18.h1SemiBold18,),
    Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(categoryPageGridItem[index]['subtitle'],style:TextStyle(
fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppDarkColors.grey,
      ),),
    ),
  ],
),
),);
    }),);
  }
}
