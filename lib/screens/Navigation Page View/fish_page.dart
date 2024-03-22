import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';
import 'package:flutter_grocery_app/screens/Navigation%20Page%20View/widget/my_app_bar.dart';

class FishPage extends StatefulWidget {
  const FishPage({super.key});

  @override
  State<FishPage> createState() => _FishPageState();
}

class _FishPageState extends State<FishPage> {
/*fishPageGridItems start here*/
  final List<Map<String, dynamic>> fishPageGridItems = [
    {
      "description": "Flounder Fish",
      "price": "\$325",
      "images":
      "https://www.nicepng.com/png/full/1-16070_fish-png-image-fishes-available-in-india.png",
    },
    {
      "description": "Betta Fish",
      "price": "\$89",
      "images":
      "https://www.nicepng.com/png/full/196-1960050_join-captain-dave-gardner-gulf-of-mexico-fish.png",
    },
    {
      "description": "Goldie Fish",
      "price": "\$525",
      "images":
      "https://www.nicepng.com/png/full/3-31061_ocean-fish-png-clipart-black-and-white-download.png",
    },
    {
      "description": "Marlin Fish",
      "price": "\$125",
      "images": "https://www.nicepng.com/png/full/2-25450_fish-png.png",
    },
    {
      "description": "Neptune Fish",
      "price": "\$79",
      "images":
      "https://www.nicepng.com/png/full/3-33617_fish-png-clipart-fish-png.png",
    },
    {
      "description": "Barracuda Fish",
      "price": "\$50",
      "images":
      "https://www.nicepng.com/png/full/8-83439_free-png-fish-png-images-transparent-flying-fish.png",
    },
    {
      "description": "Anchovy Fish",
      "price": "\$100",
      "images":
      "https://www.nicepng.com/png/full/59-597265_fish-png-image-transparent-picture-of-fish.png",
    },
    {
      "description": "Swordfish Fish",
      "price": "\$23",
      "images":
      "https://www.nicepng.com/png/full/271-2716014_catch-amazing-fish-with-msfishingcharter-lady-fish.png",
    },
    {
      "description": "Tuna Fish",
      "price": "\$12",
      "images":
      "https://www.nicepng.com/png/full/248-2486582_river-fish-png-types-of-fish.png",
    },
    {
      "description": "Salmon Fish",
      "price": "\$40",
      "images":
      "https://www.nicepng.com/png/full/9-97053_carassius-gibelio-by-george-chernilevsky-fish-transparent-background.png",
    },
    {
      "description": "Sardine Fish",
      "price": "\$200",
      "images":
      "https://www.nicepng.com/png/full/67-677374_and-png-transparent-images-pluspng-free-fish-meat.png",
    },
  ];
  /*fishPageGridItems end here*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarText: 'Big And Small Fishes'),
      body: GridView.builder(
        itemCount: fishPageGridItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 252
      ), itemBuilder: (context,index){
return InkWell(child: Stack(children: [
  Container(
    width: 200,
    decoration: BoxDecoration(
      color: AppDarkColors.black10,
      borderRadius: BorderRadius.circular(10),
    ),
 child: Column(
   crossAxisAlignment: CrossAxisAlignment.start,
   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   children: [
   ClipRRect(child: Image.network('${fishPageGridItems.elementAt(index)['images']}',height: 160,width: double.infinity,fit: BoxFit.contain,)),
 Padding(
   padding: const EdgeInsets.only(left: 14,right: 14),
   child: Divider(
     thickness: 0.2,
     color: AppColors.blue,
   ),
 ),
   Padding(
     padding: EdgeInsets.only(left: 15),
     child: Text(
       '${fishPageGridItems.elementAt(index)['price']}',
       style: CustomTextStyle18.h1Bold18,
     ),
   ),
   Padding(
     padding: EdgeInsets.only(left: 15),
     child: Text(
       '${fishPageGridItems.elementAt(index)['description']}',
       style: CustomTextStyle18.h1Bold18,
     ),
   ),
 ],),
  ),
  Positioned(
    right: 15,
    top: 166,
    child: CircleAvatar(
    radius: 17,
    backgroundColor: AppColors.blue,
    child: Icon(Icons.add,size: 20,),
  ),),
],),);
      }),
    );
  }
}
