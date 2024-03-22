import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocery_app/constant/App_Colors.dart';
import 'package:flutter_grocery_app/constant/custom_textstyle.dart';
const double kToolbarHeight = 80;
class MyCustomAppBarAllUse extends StatefulWidget implements PreferredSizeWidget {
  const MyCustomAppBarAllUse({super.key,required this.appBarText});
  final String appBarText;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<MyCustomAppBarAllUse> createState() => _MyCustomAppBarAllUseState();
}

class _MyCustomAppBarAllUseState extends State<MyCustomAppBarAllUse> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppDarkColors.black1));
  }
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.orangeLite));
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 36,
      backgroundColor: Colors.transparent,
      toolbarHeight:kTextTabBarHeight,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: CircleAvatar(
          backgroundColor: AppDarkColors.black1,
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_arrow_left),
          ),
        ),
      ),
   title: Text(widget.appBarText,style: CustomTextStyle18.h1Regular18,),
    );
  }
}
