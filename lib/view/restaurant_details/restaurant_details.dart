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
import 'package:food_delivery_app/helper/keyboard_helper.dart';
import 'package:food_delivery_app/provider/signup_provider.dart';
import 'package:food_delivery_app/view/base_view.dart';
import 'package:food_delivery_app/widgets/bottom_bar_Container_shape.dart';
import 'package:food_delivery_app/widgets/image_view.dart';
import 'package:food_delivery_app/widgets/list_view.dart';
import 'package:food_delivery_app/widgets/roundCornerShape.dart';

class RestaurantDetails extends StatefulWidget {
  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  List menuitems = [
    'Soup',
    'Pizza',
    'Burger',
    'Drinks',
    'Soup',
    'Pizza',
    'Burger',
    'Drinks'
  ];
  int menuindex = 0;
  List<int> count = [1,1];
  List<int> counter = [1,1];
  int bottomcounter=0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorConstants.colorbackground,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: ColorConstants.colorTextAppBar,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
          ),
          backgroundColor: ColorConstants.colorbackground,
          key: _scaffoldKey,
          body: BaseView<SignUpProvider>(
            onModelReady: (provider) {},
            builder: (context, provider, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: DimensionConstants.d25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: DimensionConstants.d20.w,
                          right: DimensionConstants.d20.w),
                      child: Stack(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        overflow: Overflow.visible,
                        children: [
                          Container(
                            height: DimensionConstants.d182.h,
                            width: DimensionConstants.d372.w,
                            child: BottomNavigationBarShape(
                              topRightradius:
                              DimensionConstants.d6.r,
                              topleftradius:
                              DimensionConstants.d6.r,
                              bottomRightradius:
                              DimensionConstants.d6.r,
                              bottomleftradius:
                              DimensionConstants.d6.r,
                              bgColor: ColorConstants.whiteColor,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    DimensionConstants.d6.r),
                                child: ImageView(
                                  path:
                                  ImageConstants.ic_restaurant_promo,
                                  height: DimensionConstants.d182.h,
                                  width: DimensionConstants.d372.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: DimensionConstants.d158.h,
                            left: DimensionConstants.d18.w,
                            right: DimensionConstants.d17.w,
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(DimensionConstants.d10.r),
                              child: Container(
                                height: DimensionConstants.d89.h,
                                width: DimensionConstants.d338.w,
                                child: RoundCornerShape(
                                    bgColor: ColorConstants.whiteColor,
                                    radius: DimensionConstants.d10.r,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: DimensionConstants.d16.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: DimensionConstants.d9.w,
                                              right:
                                              DimensionConstants.d8.w),
                                          child: Row(
                                            children: [
                                              Text('Arabiata restaurant')
                                                  .normalText(
                                                  ColorConstants
                                                      .colorBlack,
                                                  DimensionConstants
                                                      .d15.sp),
                                              SizedBox(
                                                width: DimensionConstants
                                                    .d102.w,
                                              ),
                                              ImageView(
                                                path: ImageConstants.ic_map,
                                                height: DimensionConstants
                                                    .d13.h,
                                                width: DimensionConstants
                                                    .d11.w,
                                              ),
                                              Text('Assuit City ').normalText(
                                                  ColorConstants
                                                      .colorHintTextColor,
                                                  DimensionConstants.d12.sp)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: DimensionConstants.d19.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: DimensionConstants.d9.w,
                                              right:
                                              DimensionConstants.d9.w),
                                          child: Row(
                                            children: [
                                              ImageView(
                                                path:
                                                ImageConstants.ic_star,
                                                height: DimensionConstants
                                                    .d14.h,
                                                width: DimensionConstants
                                                    .d15.w,
                                              ),
                                              SizedBox(
                                                width:
                                                DimensionConstants.d5.w,
                                              ),
                                              Text('4.5(234)').normalText(
                                                  ColorConstants.blackcolor,
                                                  DimensionConstants
                                                      .d14.sp),
                                              SizedBox(
                                                width: DimensionConstants
                                                    .d18.w,
                                              ),
                                              ImageView(
                                                path: ImageConstants
                                                    .ic_delivery,
                                                height: DimensionConstants
                                                    .d22.h,
                                                width: DimensionConstants
                                                    .d22.w,
                                              ),
                                              SizedBox(
                                                width:
                                                DimensionConstants.d7.w,
                                              ),
                                              Text('20 mins, 10 EGP')
                                                  .normalText(
                                                  ColorConstants
                                                      .colorBlack,
                                                  DimensionConstants
                                                      .d13.sp),
                                              SizedBox(
                                                width: DimensionConstants
                                                    .d15.w,
                                              ),
                                              Text('20 miles away').normalText(
                                                  ColorConstants
                                                      .colorButtonbgColor,
                                                  DimensionConstants.d13.sp)
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d86.h,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: DimensionConstants.d19.w),
                      child: Text('Menu').normalText(
                          ColorConstants.colorBlack,
                          DimensionConstants.d16.sp),
                    ),
                    SizedBox(
                      height: DimensionConstants.d10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: DimensionConstants
                              .d18.w,
                          right: DimensionConstants
                              .d26.w),
                      child: Container(
                        color: ColorConstants.whiteColor,
                        height: DimensionConstants.d38.h,
                        child: Listview(
                          physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: menuitems.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: DimensionConstants.d2.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            menuindex = index;
                                          });
                                        },
                                        child: Container(
                                          height: DimensionConstants.d32.h,
                                          width: DimensionConstants.d79.w,
                                          child: Material(
                                            elevation: 1.5,
                                            borderRadius:
                                            BorderRadius.circular(
                                                DimensionConstants
                                                    .d6.r),
                                            child: RoundCornerShape(
                                                bgColor: menuindex == index
                                                    ? ColorConstants
                                                    .colorButtonbgColor
                                                    : ColorConstants
                                                    .whiteColor,
                                                radius: DimensionConstants
                                                    .d6.r,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top:
                                                          DimensionConstants
                                                              .d8.h,
                                                          left:
                                                          DimensionConstants
                                                              .d20.w,
                                                          bottom: DimensionConstants.d8.h,
                                                          right:
                                                          DimensionConstants
                                                              .d20.w),
                                                      child: Text(menuitems[index]).normalText(
                                                          menuindex == index
                                                              ? ColorConstants
                                                              .whiteColor
                                                              : ColorConstants
                                                              .blackcolor,
                                                          DimensionConstants
                                                              .d12.sp),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: DimensionConstants.d8.w,
                                      )
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d12.h,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: DimensionConstants.d19.w),
                      child: Text('Soup').normalText(
                          ColorConstants.colorBlack,
                          DimensionConstants.d16.sp),
                    ),
                    SizedBox(
                      height: DimensionConstants.d11.h,
                    ),
                    Listview(
                      scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: DimensionConstants.d20.w,
                                    right: DimensionConstants.d20.w),
                                child: GestureDetector(
                                  onTap: () {
                                    openModalSheet();
                                  },
                                  child: Container(
                                    height: DimensionConstants.d138.h,
                                    width: DimensionConstants.d372.w,
                                    child: RoundCornerShape(
                                        bgColor:
                                        ColorConstants.whiteColor,
                                       radius: DimensionConstants.d6.r,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: DimensionConstants
                                                  .d10.w,
                                              right: DimensionConstants
                                                  .d10.w),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                        DimensionConstants
                                                            .d11.h,
                                                      ),
                                                      Text('Chicken Zinger').normalText(
                                                          ColorConstants
                                                              .colorBlack,
                                                          DimensionConstants
                                                              .d16.sp),
                                                      SizedBox(
                                                        height:
                                                        DimensionConstants
                                                            .d5.h,
                                                      ),
                                                      Text('Spicy & crispy with garlic').normalText(
                                                          ColorConstants
                                                              .cartTextcolor,
                                                          DimensionConstants
                                                              .d14.sp),
                                                      SizedBox(
                                                        height:
                                                        DimensionConstants
                                                            .d9.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          ImageView(
                                                            path: ImageConstants
                                                                .ic_fire,
                                                            height:
                                                            DimensionConstants
                                                                .d16
                                                                .h,
                                                            width:
                                                            DimensionConstants
                                                                .d16
                                                                .w,
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            DimensionConstants
                                                                .d4.w,
                                                          ),
                                                          Text('195Cal').normalText(
                                                              ColorConstants
                                                                  .colorBlack,
                                                              DimensionConstants
                                                                  .d14
                                                                  .sp),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                        DimensionConstants
                                                            .d10.h,
                                                      ),
                                                      Text('7999 EGP')
                                                          .normalText(
                                                        ColorConstants
                                                            .colorHintTextColor,
                                                        DimensionConstants
                                                            .d12.sp,
                                                        decoration: TextDecoration.lineThrough

                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d86.w,
                                                  ),
                                                  ImageView(
                                                    path: ImageConstants
                                                        .ic_cart_burger,
                                                    height:
                                                    DimensionConstants
                                                        .d94.h,
                                                    width:
                                                    DimensionConstants
                                                        .d103.w,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: DimensionConstants
                                                    .d1.h,
                                              ),
                                              Row(
                                                children: [
                                                  Text('7999 EGP').normalText(
                                                      ColorConstants
                                                          .colorButtonbgColor,
                                                      DimensionConstants
                                                          .d16.sp),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d12.w,
                                                  ),
                                                  ImageView(
                                                    path: ImageConstants
                                                        .ic_star,
                                                    height:
                                                    DimensionConstants
                                                        .d14.h,
                                                    width:
                                                    DimensionConstants
                                                        .d15.w,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d5.w,
                                                  ),
                                                  Text('4.5').normalText(
                                                      ColorConstants
                                                          .blackcolor,
                                                      DimensionConstants
                                                          .d15.sp),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d134.w,
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){
                                                      if(count[index]>0){
                                                        count[index]--;
                                                        setState(() {
                                                          count[index]=count[index];
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      height:
                                                      DimensionConstants
                                                          .d30.h,
                                                      width:
                                                      DimensionConstants
                                                          .d30.w,
                                                      child:
                                                      BottomNavigationBarShape(
                                                        bgColor:
                                                        ColorConstants
                                                            .whiteColor,
                                                        strokeColor:
                                                        ColorConstants
                                                            .strokecolor,
                                                        topleftradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        topRightradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        bottomleftradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        bottomRightradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left:
                                                              DimensionConstants
                                                                  .d8.w,
                                                              right:
                                                              DimensionConstants
                                                                  .d8
                                                                  .w),
                                                          child: ImageView(
                                                            path: ImageConstants
                                                                .ic_minus,
                                                            height:
                                                            DimensionConstants
                                                                .d3.h,
                                                            width:
                                                            DimensionConstants
                                                                .d12.w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d10.w,
                                                  ),
                                                  Text(count[index].toString()).mediumText(
                                                      ColorConstants
                                                          .darkblackcolor,
                                                      DimensionConstants
                                                          .d16.sp,
                                                      TextAlign.center),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d10.w,
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){
                                                      count[index]++;
                                                      setState(() {
                                                        count[index]=count[index];
                                                      });
                                                    },
                                                    child: Container(
                                                      height:
                                                      DimensionConstants
                                                          .d30.h,
                                                      width:
                                                      DimensionConstants
                                                          .d30.w,
                                                      child:
                                                      BottomNavigationBarShape(
                                                        bgColor:
                                                        ColorConstants
                                                            .whiteColor,
                                                        strokeColor:
                                                        ColorConstants
                                                            .strokecolor,
                                                        topleftradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        topRightradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        bottomleftradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        bottomRightradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left:
                                                              DimensionConstants
                                                                  .d9.w,
                                                              right:
                                                              DimensionConstants
                                                                  .d9
                                                                  .w),
                                                          child: ImageView(
                                                            path:
                                                            ImageConstants
                                                                .ic_add,
                                                            height:
                                                            DimensionConstants
                                                                .d11.h,
                                                            width:
                                                            DimensionConstants
                                                                .d11.w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: DimensionConstants.d20.h,
                              )
                            ],
                          );
                        }),
                    Padding(
                      padding:
                      EdgeInsets.only(left: DimensionConstants.d19.w),
                      child: Text('Pizza').normalText(
                          ColorConstants.colorBlack,
                          DimensionConstants.d16.sp),
                    ),
                    SizedBox(
                      height: DimensionConstants.d11.h,
                    ),
                    Listview(
                      scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: DimensionConstants.d20.w,
                                    right: DimensionConstants.d20.w),
                                child: GestureDetector(
                                  onTap: (){
                                    openModalSheet();
                                  },
                                  child: Container(
                                    height: DimensionConstants.d138.h,
                                    width: DimensionConstants.d372.w,
                                    child: RoundCornerShape(
                                        bgColor: ColorConstants.whiteColor,
                                        radius: DimensionConstants.d6.r,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                              DimensionConstants.d10.w,
                                              right:
                                              DimensionConstants.d10.w),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                        DimensionConstants
                                                            .d11.h,
                                                      ),
                                                      Text('Chicken Zinger')
                                                          .normalText(
                                                          ColorConstants
                                                              .colorBlack,
                                                          DimensionConstants
                                                              .d16.sp),
                                                      SizedBox(
                                                        height:
                                                        DimensionConstants
                                                            .d5.h,
                                                      ),
                                                      Text('Spicy & crispy with garlic')
                                                          .normalText(
                                                          ColorConstants
                                                              .cartTextcolor,
                                                          DimensionConstants
                                                              .d14.sp),
                                                      SizedBox(
                                                        height:
                                                        DimensionConstants
                                                            .d9.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          ImageView(
                                                            path:
                                                            ImageConstants
                                                                .ic_fire,
                                                            height:
                                                            DimensionConstants
                                                                .d16.h,
                                                            width:
                                                            DimensionConstants
                                                                .d16.w,
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            DimensionConstants
                                                                .d4.w,
                                                          ),
                                                          Text('195Cal').normalText(
                                                              ColorConstants
                                                                  .colorBlack,
                                                              DimensionConstants
                                                                  .d14.sp),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                        DimensionConstants
                                                            .d10.h,
                                                      ),
                                                      Text('7999 EGP')
                                                          .normalText(
                                                        ColorConstants
                                                            .colorHintTextColor,
                                                        DimensionConstants
                                                            .d12.sp,
                                                          decoration: TextDecoration.lineThrough
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d86.w,
                                                  ),
                                                  ImageView(
                                                    path: ImageConstants
                                                        .ic_cart_burger,
                                                    height:
                                                    DimensionConstants
                                                        .d94.h,
                                                    width:
                                                    DimensionConstants
                                                        .d103.w,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height:
                                                DimensionConstants.d1.h,
                                              ),
                                              Row(
                                                children: [
                                                  Text('7999 EGP').normalText(
                                                      ColorConstants
                                                          .colorButtonbgColor,
                                                      DimensionConstants
                                                          .d16.sp),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d12.w,
                                                  ),
                                                  ImageView(
                                                    path: ImageConstants
                                                        .ic_star,
                                                    height:
                                                    DimensionConstants
                                                        .d14.h,
                                                    width:
                                                    DimensionConstants
                                                        .d15.w,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d3.w,
                                                  ),
                                                  Text('4.5').normalText(
                                                      ColorConstants
                                                          .blackcolor,
                                                      DimensionConstants
                                                          .d15.sp),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d134.w,
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){
                                                      if(counter[index]>0){
                                                        counter[index]--;
                                                        setState(() {
                                                          counter[index]=counter[index];
                                                        });
                                                      }

                                                      print(count);
                                                    },
                                                    child: Container(
                                                      height:
                                                      DimensionConstants
                                                          .d30.h,
                                                      width:
                                                      DimensionConstants
                                                          .d30.w,
                                                      child:
                                                      BottomNavigationBarShape(
                                                        bgColor:
                                                        ColorConstants
                                                            .whiteColor,
                                                        strokeColor:
                                                        ColorConstants
                                                            .strokecolor,
                                                        topleftradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        topRightradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        bottomleftradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        bottomRightradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left:
                                                              DimensionConstants
                                                                  .d8.w,
                                                              right:
                                                              DimensionConstants
                                                                  .d8.w),
                                                          child: ImageView(
                                                            path:
                                                            ImageConstants
                                                                .ic_minus,
                                                            height:
                                                            DimensionConstants
                                                                .d3.h,
                                                            width:
                                                            DimensionConstants
                                                                .d12.w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d10.w,
                                                  ),
                                                  Text(counter[index].toString()).mediumText(
                                                      ColorConstants
                                                          .darkblackcolor,
                                                      DimensionConstants
                                                          .d16.sp,
                                                      TextAlign.center),
                                                  SizedBox(
                                                    width:
                                                    DimensionConstants
                                                        .d10.w,
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){
                                                      counter[index]++;
                                                      setState(() {
                                                        counter[index]=counter[index];
                                                      });
                                                    },
                                                    child: Container(
                                                      height:
                                                      DimensionConstants
                                                          .d30.h,
                                                      width:
                                                      DimensionConstants
                                                          .d30.w,
                                                      child:
                                                      BottomNavigationBarShape(
                                                        bgColor:
                                                        ColorConstants
                                                            .whiteColor,
                                                        strokeColor:
                                                        ColorConstants
                                                            .strokecolor,
                                                        topleftradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        topRightradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        bottomleftradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        bottomRightradius:
                                                        DimensionConstants
                                                            .d6
                                                            .r,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left:
                                                              DimensionConstants
                                                                  .d9.w,
                                                              right:
                                                              DimensionConstants
                                                                  .d9.w),
                                                          child: ImageView(
                                                            path:
                                                            ImageConstants
                                                                .ic_add,
                                                            height:
                                                            DimensionConstants
                                                                .d11.h,
                                                            width:
                                                            DimensionConstants
                                                                .d11.w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: DimensionConstants.d20.h,
                              )
                            ],
                          );
                        })
                  ],
                ),
              );
            },
          )),
    );
  }

  void openModalSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,

        backgroundColor: ColorConstants.colorbackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (context) {
          return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
            return DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.8,
                // half screen on load
                maxChildSize: 1,
                // full screen on scroll
                minChildSize: 0.7,
                builder: (BuildContext context,
                    ScrollController scrollController) {
                  return SingleChildScrollView(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        Container(
                          height: DimensionConstants.d182.h,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: BottomNavigationBarShape(
                            topRightradius: DimensionConstants.d15.r,
                            topleftradius: DimensionConstants.d15.r,
                            bottomleftradius: 0,
                            bottomRightradius: 0,
                            bgColor: ColorConstants.whiteColor,
                            child: ImageView(
                              path: ImageConstants.ic_cart_burger,
                              height: DimensionConstants.d182.h,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DimensionConstants.d20.h,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: DimensionConstants
                                .d20.w),
                            child: Text('Chicken Zinger').normalText(
                                ColorConstants.colorBlack,
                                DimensionConstants.d22.sp)),
                        SizedBox(
                          height: DimensionConstants.d13.h,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: DimensionConstants
                                .d20.w),
                            child: Text('7999 EGP').normalText(
                                ColorConstants.colorButtonbgColor,
                                DimensionConstants.d18.sp)),
                        SizedBox(
                          height: DimensionConstants.d7.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: DimensionConstants.d15
                              .w),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (bottomcounter > 0) {
                                    bottomcounter--;
                                    setState(() {
                                      bottomcounter = bottomcounter;
                                    });
                                  }
                                },
                                child: Container(
                                  height: DimensionConstants.d40.h,
                                  width: DimensionConstants.d40.w,
                                  child: BottomNavigationBarShape(
                                    bgColor: ColorConstants.whiteColor,
                                    strokeColor: ColorConstants.strokecolor,
                                    topleftradius: DimensionConstants.d6.r,
                                    topRightradius: DimensionConstants.d6.r,
                                    bottomleftradius: DimensionConstants.d6.r,
                                    bottomRightradius: DimensionConstants.d6.r,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: DimensionConstants.d12.w,
                                          right: DimensionConstants.d12.w),
                                      child: ImageView(
                                        path: ImageConstants.ic_minus,
                                        height: DimensionConstants.d3.h,
                                        width: DimensionConstants.d17.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: DimensionConstants.d20.w,
                              ),
                              Text(bottomcounter.toString()).mediumText(
                                  ColorConstants.darkblackcolor,
                                  DimensionConstants.d16.sp, TextAlign.center),
                              SizedBox(
                                width: DimensionConstants.d20.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  bottomcounter++;
                                  setState(() {
                                    bottomcounter = bottomcounter;
                                  });
                                },
                                child: Container(
                                  height: DimensionConstants.d40.h,
                                  width: DimensionConstants.d40.w,
                                  child: BottomNavigationBarShape(
                                    bgColor: ColorConstants.whiteColor,
                                    strokeColor: ColorConstants.strokecolor,
                                    topleftradius: DimensionConstants.d6.r,
                                    topRightradius: DimensionConstants.d6.r,
                                    bottomleftradius: DimensionConstants.d6.r,
                                    bottomRightradius: DimensionConstants.d6.r,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: DimensionConstants.d12.w,
                                          right: DimensionConstants.d12.w),
                                      child: ImageView(
                                        path: ImageConstants.ic_add,
                                        height: DimensionConstants.d15.h,
                                        width: DimensionConstants.d15.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: DimensionConstants.d20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: DimensionConstants.d18.w,
                              right: DimensionConstants.d18.w),
                          child: Container(
                            height: DimensionConstants.d468.h,
                            width: DimensionConstants.d372.w,
                            child: BottomNavigationBarShape(
                              topleftradius: DimensionConstants.d6.r,
                              topRightradius: DimensionConstants.d6.r,
                              bottomleftradius: DimensionConstants.d6.r,
                              bottomRightradius: DimensionConstants.d6.r,
                              bgColor: ColorConstants.whiteColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: DimensionConstants.d19.h,
                                  ),
                                  Padding(
                                      padding:
                                      EdgeInsets.only(
                                          left: DimensionConstants.d15.w),
                                      child: Text('Details').normalText(
                                          ColorConstants.colorBlack,
                                          DimensionConstants.d18.sp)),
                                  SizedBox(
                                    height: DimensionConstants.d2.h,
                                  ),
                                  Padding(
                                      padding:
                                      EdgeInsets.only(
                                          left: DimensionConstants.d15.w),
                                      child: Text('Spicy & crispy with garlic')
                                          .normalText(
                                          ColorConstants.colorBlack,
                                          DimensionConstants.d14.sp)),
                                  SizedBox(
                                    height: DimensionConstants.d8.h,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: DimensionConstants.d15.w,
                                          right: DimensionConstants.d15.w),
                                      child: Text(
                                          'Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.')
                                          .normalText(
                                          ColorConstants.detailsTextcolor,
                                          DimensionConstants.d12.sp,
                                          maxLines: 4)),
                                  SizedBox(
                                    height: DimensionConstants.d11.h,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.only(
                                        left: DimensionConstants.d15.w),
                                    child: Row(
                                      children: [
                                        ImageView(
                                          path: ImageConstants.ic_fire,
                                          height: DimensionConstants.d18.h,
                                          width: DimensionConstants.d18.w,
                                        ),
                                        SizedBox(
                                          width: DimensionConstants.d2.w,
                                        ),
                                        Text('195Cal').normalText(
                                            ColorConstants.colorBlack,
                                            DimensionConstants.d14.sp)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: DimensionConstants.d17.h,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.only(
                                        left: DimensionConstants.d15.w),
                                    child: Row(
                                      children: [
                                        ImageView(
                                          path: ImageConstants.ic_star,
                                          height: DimensionConstants.d14.h,
                                          width: DimensionConstants.d16.w,
                                        ),
                                        SizedBox(
                                          width: DimensionConstants.d6.w,
                                        ),
                                        Text('4.5(234)').normalText(
                                            ColorConstants.blackcolor,
                                            DimensionConstants.d14.sp),
                                        SizedBox(
                                          width: DimensionConstants.d158.w,
                                        ),
                                        ImageView(
                                          path: ImageConstants.ic_delivery,
                                          height: DimensionConstants.d22.h,
                                          width: DimensionConstants.d22.w,
                                        ),
                                        SizedBox(
                                          width: DimensionConstants.d8.w,
                                        ),
                                        Text('20 mins, 10 EGP').normalText(
                                            ColorConstants.colorBlack,
                                            DimensionConstants.d13.sp),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: DimensionConstants.d15.h,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: DimensionConstants.d17.w,
                                          right: DimensionConstants.d17.w),
                                      child: Container(
                                        height: DimensionConstants.d1.h,
                                        width: DimensionConstants.d338.w,
                                        color: ColorConstants.gray,
                                      )
                                  ),
                                  SizedBox(
                                    height: DimensionConstants.d12.h,
                                  ),
                                  Padding(
                                      padding:
                                      EdgeInsets.only(
                                          left: DimensionConstants.d14.w),
                                      child: Text('Extras').normalText(
                                          ColorConstants.colorBlack,
                                          DimensionConstants.d18.sp)),
                                  SizedBox(
                                    height: DimensionConstants.d12.h,
                                  ),
                                  Container(

                                    child: Listview(
                                      scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        itemCount: 2,
                                        itemBuilder: (BuildContext context,
                                            int index) {
                                          return Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: DimensionConstants.d17
                                                        .w),
                                                child: Row(
                                                  children: [
                                                    ImageView(
                                                      path: ImageConstants
                                                          .ic_sprite,
                                                      width: DimensionConstants
                                                          .d30.w,
                                                      height: DimensionConstants
                                                          .d54.h,
                                                    ),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d14.w,
                                                    ),
                                                    Text('Sprite').normalText(
                                                        ColorConstants
                                                            .colorBlack,
                                                        DimensionConstants.d18
                                                            .sp),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d5.w,
                                                    ),
                                                    Container(
                                                      height: DimensionConstants
                                                          .d1.h,
                                                      width: DimensionConstants
                                                          .d52.w,
                                                      color:
                                                      ColorConstants
                                                          .colorHintTextColor,
                                                    ),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d5.w,
                                                    ),
                                                    Text('5 EGP').normalText(
                                                        ColorConstants
                                                            .colorBlack,
                                                        DimensionConstants.d18
                                                            .sp),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d32.w,
                                                    ),
                                                    Container(
                                                      height: DimensionConstants
                                                          .d30.h,
                                                      width: DimensionConstants
                                                          .d30.w,
                                                      child: BottomNavigationBarShape(
                                                        bgColor: ColorConstants
                                                            .whiteColor,
                                                        strokeColor:
                                                        ColorConstants
                                                            .strokecolor,
                                                        topleftradius: DimensionConstants
                                                            .d6.r,
                                                        topRightradius: DimensionConstants
                                                            .d6.r,
                                                        bottomleftradius: DimensionConstants
                                                            .d6.r,
                                                        bottomRightradius:
                                                        DimensionConstants
                                                            .d6.r,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              left: DimensionConstants
                                                                  .d9.w,
                                                              right:
                                                              DimensionConstants
                                                                  .d9.w),
                                                          child: ImageView(
                                                            path: ImageConstants
                                                                .ic_minus,
                                                            height: DimensionConstants
                                                                .d2.h,
                                                            width: DimensionConstants
                                                                .d13.w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d15.w,
                                                    ),
                                                    Text('1').buttonText(
                                                        ColorConstants
                                                            .darkblackcolor,
                                                        DimensionConstants.d16
                                                            .sp,
                                                        TextAlign.center),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d15.w,
                                                    ),
                                                    Container(
                                                      height: DimensionConstants
                                                          .d30.h,
                                                      width: DimensionConstants
                                                          .d30.w,
                                                      child: BottomNavigationBarShape(
                                                        bgColor: ColorConstants
                                                            .whiteColor,
                                                        strokeColor:
                                                        ColorConstants
                                                            .strokecolor,
                                                        topleftradius: DimensionConstants
                                                            .d6.r,
                                                        topRightradius: DimensionConstants
                                                            .d6.r,
                                                        bottomleftradius: DimensionConstants
                                                            .d6.r,
                                                        bottomRightradius:
                                                        DimensionConstants
                                                            .d6.r,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              left: DimensionConstants
                                                                  .d9.w,
                                                              right:
                                                              DimensionConstants
                                                                  .d9.w),
                                                          child: ImageView(
                                                            path: ImageConstants
                                                                .ic_add,
                                                            height:
                                                            DimensionConstants
                                                                .d12.h,
                                                            width: DimensionConstants
                                                                .d12.w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: DimensionConstants.d16
                                                    .h,
                                              )

                                            ],
                                          );
                                        }),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: DimensionConstants.d17.w,
                                          right: DimensionConstants.d17.w),
                                      child: Container(
                                        height: DimensionConstants.d1.h,
                                        width: DimensionConstants.d338.w,
                                        color: ColorConstants.gray,
                                      )
                                  ),
                                  SizedBox(
                                    height: DimensionConstants.d10.h,
                                  ),
                                  Padding(padding: EdgeInsets.only(
                                      left: DimensionConstants.d18.w,
                                      right: DimensionConstants.d18.w),
                                    child: Row(
                                      children: [
                                        Text('Total Cost').normalText(
                                            ColorConstants.darkblackcolor,
                                            DimensionConstants.d15.sp),
                                        SizedBox(
                                          width: DimensionConstants.d187.w,
                                        ),

                                        Text('14.99 EGP').normalText(
                                            ColorConstants.colorButtonbgColor,
                                            DimensionConstants.d15.sp),


                                      ],
                                    )
                                    ,),

                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DimensionConstants.d70.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: DimensionConstants.d21
                              .w,
                            right: DimensionConstants.d21.w,
                            bottom: DimensionConstants.d24.h,),
                          child: GestureDetector(

                            child: SizedBox(
                              width: DimensionConstants.d373.w,
                              height: DimensionConstants.d52.h,
                              child: RoundCornerShape(
                                  bgColor: ColorConstants.colorButtonbgColor,
                                  radius: DimensionConstants.d6.r,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Add To Cart',
                                        ).buttonText(
                                            ColorConstants.whiteColor,
                                            DimensionConstants.d16.sp,
                                            TextAlign.center),

                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  );
                }

            );
          });
        });
  }
}

//
