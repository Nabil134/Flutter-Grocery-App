import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/screens/Track%20Order%20View/track_order_view.dart';

import '../../Category Page View/category_page_view.dart';
import '../../Favourite Page View/favourite_page_view.dart';
import '../../Home Page View/home_page_view.dart';
import '../../Order Page View/order_page_view.dart';
class CurvedNavigationBottom extends StatefulWidget {
  const CurvedNavigationBottom({super.key});

  @override
  State<CurvedNavigationBottom> createState() => _CurvedNavigationBottomState();
}

class _CurvedNavigationBottomState extends State<CurvedNavigationBottom> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomePageView(),
    const CategoriesPageView(),
    FavouritePageView(favoriteItems: favItems,),
    OrderPageView(orderList: orderItem,),
  //  TrackOrderView(),
  ];
  _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      extendBody: true,
      backgroundColor: AppDarkColors.black1,
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColors.blue,
backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
onTap: _onTabTapped,
        index: _currentIndex,
items: [
  Icon(
    Icons.home_outlined,
    size: 30,
    color: Colors.white,
  ),
  Icon(
    Icons.grid_view_outlined,
    size: 30,
    color: Colors.white,
  ),
  Icon(
    Icons.favorite_outline,
    size: 30,
    color: Colors.white,
  ),
  Icon(
    Icons.shopping_bag_outlined,
    size: 30,
    color: Colors.white,
  ),
],
      ),
      body: _screens[_currentIndex],
    ),
    );
  }
}
