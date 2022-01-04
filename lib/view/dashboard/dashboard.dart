import 'dart:io';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:food_delivery_app/constants/color_constants.dart';
import 'package:food_delivery_app/constants/decoration.dart';
import 'package:food_delivery_app/constants/dimension_constants.dart';
import 'package:food_delivery_app/constants/image_constants.dart';
import 'package:food_delivery_app/constants/route_constants.dart';
import 'package:food_delivery_app/constants/validations.dart';
import 'package:food_delivery_app/extensions/allExtensions.dart';
import 'package:food_delivery_app/helper/dialog_helper.dart';
import 'package:food_delivery_app/helper/keyboard_helper.dart';
import 'package:food_delivery_app/provider/signup_provider.dart';
import 'package:food_delivery_app/view/base_view.dart';
import 'package:food_delivery_app/view/cart/my_cart.dart';
import 'package:food_delivery_app/view/home_page/home_page.dart';
import 'package:food_delivery_app/view/products/products.dart';
import 'package:food_delivery_app/view/profile/profile.dart';
import 'package:food_delivery_app/view/wishlist/wishlist.dart';
import 'package:food_delivery_app/widgets/bottom_bar_Container_shape.dart';
import 'package:food_delivery_app/widgets/image_view.dart';
import 'package:food_delivery_app/widgets/roundCornerShape.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<Widget> _children = [
    HomePage(),
    
    WishList(),
    Products(),
    MyCart(),
    Profile(),

  ];

  List navigationitems=['Home','WishList','Products','Cart','Profile'];
  List navigationicons=[ImageConstants.ic_home,ImageConstants.ic_favorite,ImageConstants.ic_dashboard,ImageConstants.ic_cart,ImageConstants.ic_profile];
  List restuarntnames=['Vegan Resto','Healthy Food','Good Food','Good Food'];
  int currentindex=0;
  int pageIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpProvider>(
        onModelReady: (provider) {},
        builder: (context, provider, _) {
          return SafeArea(
            child: Scaffold(
                backgroundColor: ColorConstants.colorbackground,
                key: _scaffoldKey,
                bottomNavigationBar: _bottomNavigationBar(),
              body: _children.elementAt(currentindex),
            ),
          );
        });
  }

  _bottomNavigationBar() {
    return Consumer<SignUpProvider>(
      builder: (c, provider, _) => Container(
        height: DimensionConstants.d76.h,
        width: DimensionConstants.d414.w,
        child: BottomNavigationBarShape(
            topleftradius:
            DimensionConstants.d15.r,
            bottomRightradius: 0,
            topRightradius:
            DimensionConstants.d15.r,
            bgColor: ColorConstants.whiteColor,
            bottomleftradius: 0,
            child: Padding(
                padding: EdgeInsets.only(
                    left: DimensionConstants.d20.w,
                    right: DimensionConstants.d20.w,
                    top: DimensionConstants.d11.h,
                    bottom: DimensionConstants.d22.h),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: navigationitems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {

                              setState(() {
                                currentindex=index;
                              });
                              //onItemTapped(index);
                            },
                            child: Container(
                              height: DimensionConstants
                                  .d43.h,
                              width:
                              DimensionConstants.d43.w,
                              child: BottomNavigationBarShape(
                                bgColor:
                                currentindex==index? ColorConstants.bottomcontainercolor:ColorConstants.whiteColor,
                                topRightradius:  DimensionConstants.d6.r,
                                topleftradius: DimensionConstants.d6.r,
                                bottomRightradius: DimensionConstants.d6.r,
                                bottomleftradius: DimensionConstants.d6.r,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: DimensionConstants.d4.h,
                                    ),
                                    ImageView(
                                      path: navigationicons[index],
                                      height: DimensionConstants.d20.h,
                                      width: DimensionConstants.d19.w,
                                      color: currentindex==index?ColorConstants.colorButtonbgColor:ColorConstants.colorBlack,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),


                                    Text(navigationitems[index]).btnText(
                                        currentindex==index?   ColorConstants.colorButtonbgColor:ColorConstants.whiteColor,
                                        DimensionConstants.d10.sp,maxLines: 2),
                                    SizedBox(
                                      height: 1.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: DimensionConstants.d35.w,
                          ),
                        ],
                      );
                    }))),
      )
    );
  }

}

//
