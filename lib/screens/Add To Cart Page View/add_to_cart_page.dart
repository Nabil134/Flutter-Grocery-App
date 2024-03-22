
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/screens/Add%20To%20Cart%20Page%20View/Add%20To%20Cart%20Widget/CheckOut%20Page%20View/checkout_page_view.dart';
import 'package:flutter_grocery_app/screens/Add%20To%20Cart%20Page%20View/Add%20To%20Cart%20Widget/MyCustomButton_allUse.dart';
import 'package:flutter_grocery_app/screens/Home%20Page%20View/home_page_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/custom_textstyle.dart';
class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key,required this.items});
  final List items;

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  //DeleteItems start here
  void deleteItem(int index){
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
      title: const Text("Delete Item"),
      content: const Text("Are you sure you want to delete this item?"),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      actions: <Widget>[
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  onPressed: (){
    Navigator.pop(context);
  }, child: Text('Cancel',style: TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 17,
),),),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: (){
            setState(() {
              widget.items.removeAt(index);
            });
            Navigator.pop(context);
          }, child: Text('Delete',style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),),),
      ],
    ),
    );
  }
  //Delete Items end here
  //increase qauntity start here
  increaseQuantity(int index){
    setState(() {
      int currentQuanity=int.parse(widget.items[index]['quantity']);
      widget.items[index]['quantity']=(currentQuanity+1).toString();
    });

  }
  //increase qauntity end here
  //decrease qauntity start here
  decreaseQuantity(int index){
    setState(() {
      int currentQuanity=int.parse(widget.items[index]['quantity']);
      if(currentQuanity>1) {
        widget.items[index]['quantity'] = (currentQuanity - 1).toString();
      }
    });

  }
  //decrease qauntity end here
  double parsePrice(String price){
    return double.parse(price.replaceAll('\$',''));
  }

  //calculateSubTotal start here
  calculateSubTotal(){
    double subtotal=0.00;
    for(final cartItem in widget.items){
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
        SystemUiOverlayStyle(statusBarColor: AppColors.orangeLite));
  }
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.blue));
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body:SingleChildScrollView(
      child: Column(children: [
        /*first portion  start here*/
        Stack(children: [
          Container(
            height: 240,
            width: double.infinity,
            color: AppColors.orangeLite,
          ),
      Positioned(
        bottom: 60,
        child: Image.asset('assets/images/#.png'),),
   Positioned(
       top: 50,
       left: 250,
       child: Image.asset('assets/images/Vector.png'),),
   Positioned(
       top: 135,
       left: 115,
       child: Image.asset('assets/images/25.png'),),
       Positioned(
         left: 298,
         top: 118,
         child: Text('OFF!',style: TextStyle(
         fontSize: 15,
         fontWeight: FontWeight.bold,
         color: Colors.white,
       ),),),

       Row(children: [
         Padding(
           padding: const EdgeInsets.only(left: 20,top: 15),
           child: InkWell(
             onTap: (){
               Navigator.pop(context);
             },
             child: CircleAvatar(
             radius: 20,
             backgroundColor: AppDarkColors.black1,
             child: Icon(Icons.keyboard_arrow_left,color: Colors.black,),
           ),),
         ),
         Padding(
           padding: const EdgeInsets.only(top: 15, left: 25),
           child: Text(
             "Shopping Cart(${widget.items.length.toString()}) ",
             style: CustomTextStyle16.h1Medium16,
           ),
         ),
       ],),
        ],),
        /*first portion  end here*/
        /*second portion start here*/
        Container(height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.orange,
          ),
          child: Center(child: Text('Use code #HalalFood at Checkout',style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),),),
        ),
      /*second portion end here*/
        /*third portion start here*/
        widget.items.isEmpty?Column(children: [
          Center(
            child: Image.network(
              "https://cdn.dribbble.com/users/5107895/screenshots/14532312/media/a7e6c2e9333d0989e3a54c95dd8321d7.gif",
              height: 230,
            ),
          ),
          Text(
            "Your Cart is empty",
            style: CustomTextStyle20.h1SemiBold20,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Looks like you have not added anything to you cart\nGo ahead & explore top categories",
            style: CustomTextFieldStyle14.h1Medium14,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 90,
          ),
        ],):Padding(padding: const EdgeInsets.all(12),child: ListView.builder(
          itemCount: widget.items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: Image.network('${widget.items[index]['images']}'),
            ),
            title: Text(widget.items[index]['description'],style: CustomTextFieldStyle14.h1Medium14),
            subtitle: Text(widget.items[index]['price'],style: CustomTextFieldStyle14.h1Medium14),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              InkWell(
                onTap:(){
                  deleteItem(index);
                },
                child: Container(
                height:35,
                width: 35,
                decoration: BoxDecoration(
                  color: AppDarkColors.black10,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
child: Icon(Icons.delete_outline,
  color: Colors.black,
),
              ),),),
                SizedBox(
                  width: 10,
                ),
                InkWell(
        splashColor:Colors.transparent,
        child:Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: AppDarkColors.black10,
            borderRadius: BorderRadius.circular(20),
          ),
        child: Center(
          child: Icon(Icons.remove,
          color: Colors.black,),
        ),
        ),
        onTap: (){
          decreaseQuantity(index);
        },
      ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    "${widget.items[index]["quantity"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  splashColor:Colors.transparent,
                  child:Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: AppDarkColors.black10,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Icon(Icons.add,
                        color: Colors.black,),
                    ),
                  ),
                  onTap: (){
                    increaseQuantity(index);
                  },
                ),

              ],),

          );
        }),),
        /*third portion end here*/
        /*four portion start here*/
        BottomSheet(
          enableDrag: false,
            onClosing: (){}, builder: (context){
          double subtotal=calculateSubTotal();
          double deliveycharges=calculateTotal()-calculateSubTotal();
          double total =calculateTotal();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
child: Container(
  height: 200,
  decoration: BoxDecoration(
    color: AppDarkColors.black10,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(30),
      topLeft: Radius.circular(30),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
    child: Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Subtotal',style: CustomTextFieldStyle14.h1Medium14,),
          Text('\$$subtotal',style: CustomTextFieldStyle14.h1Medium14,),
        ],),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Charges',style: CustomTextFieldStyle14.h1Medium14,),
            Text('\$$deliveycharges',style: CustomTextFieldStyle14.h1Medium14,),
          ],),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total',style: CustomTextFieldStyle14.h1Medium14,),
            Text('\$$total',style: CustomTextFieldStyle14.h1Medium14,),
          ],),
      ),
    ],),
  ),
),
          );
        }),
        /*four portion end here*/
        /*last portion start here*/
        MyCustomButtonAllUse(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CheckOutPageView()));
        }, backgroundColor: AppColors.blueDark, text: "Proceed To checkout"),
        /*last portion end here*/
      ],),
    )),);
  }
}
