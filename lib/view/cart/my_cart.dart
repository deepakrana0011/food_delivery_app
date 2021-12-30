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
import 'package:food_delivery_app/widgets/roundCornerShape.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List navigationitems = ['Home', 'WishList', 'Home', 'Cart', 'Profile'];
  List navigationicons = [
    ImageConstants.ic_home,
    ImageConstants.ic_favorite,
    ImageConstants.ic_dashboard,
    ImageConstants.ic_cart,
    ImageConstants.ic_profile
  ];
  int ind = 3;
  List<int> count = [1,1,1];

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
            title: Text('My Cart').btnText(
                ColorConstants.colorTextAppBar, DimensionConstants.d20.sp),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: ColorConstants.colorTextAppBar,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesConstants.home_page);
              },
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: Container(
            height: DimensionConstants.bottombarheight.h,
            width: DimensionConstants.bottombarwidth.w,
            child: BottomNavigationBarShape(
                topleftradius:
                DimensionConstants.bottomnavigationbartopleftradius.w,
                bottomRightradius: 0,
                topRightradius:
                DimensionConstants.bottomnavigationbartoprightradius.w,
                bgColor: ColorConstants.whiteColor,
                bottomleftradius: 0,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: DimensionConstants.nametextfieldleftpadding.w,
                        right: DimensionConstants.nametextfieldleftpadding.w,
                        top: DimensionConstants.bottomrowtoppadding.h,
                        bottom: DimensionConstants.bottomrowbottompadding.h),
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
                                    ind=index;
                                  });
                                  onItemTapped(index);
                                },
                                child: Container(
                                  height: DimensionConstants
                                      .bottomcontainerheight.h,
                                  width:
                                  DimensionConstants.bottomcontainerwidth.w,
                                  child: BottomNavigationBarShape(
                                    bgColor:
                                    ind==index? ColorConstants.bottomcontainercolor:ColorConstants.whiteColor,
                                    topRightradius:  DimensionConstants.buttonradius.r,
                                    topleftradius: DimensionConstants.buttonradius.r,
                                    bottomRightradius: DimensionConstants.buttonradius.r,
                                    bottomleftradius: DimensionConstants.buttonradius.r,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        ImageView(
                                          path: navigationicons[index],
                                          height: DimensionConstants.d17.h,
                                          width: DimensionConstants.d18.w,
                                          color: ind==index?ColorConstants.colorButtonbgColor:ColorConstants.colorBlack,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(navigationitems[index]).btnText(
                                            ind==index?   ColorConstants.colorButtonbgColor:ColorConstants.whiteColor,
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
                                width: DimensionConstants.d38.w,
                              ),
                            ],
                          );
                        }))),
          ),
          backgroundColor: ColorConstants.colorbackground,
          key: _scaffoldKey,
          body: BaseView<SignUpProvider>(
            onModelReady: (provider) {},
            builder: (context, provider, _) {
              return SafeArea(
                child: ScreenUtilInit(
                  designSize: const Size(DimensionConstants.loginscreenwidth,
                      DimensionConstants.loginscreenheight),
                  builder: () {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: DimensionConstants.d28.h,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: DimensionConstants.d20.w,
                                      right: DimensionConstants.d20.w),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: DimensionConstants.d147.h,
                                        width: DimensionConstants.d372.w,
                                        child: RoundCornerShape(
                                            bgColor: ColorConstants.whiteColor,
                                            radius:
                                                DimensionConstants.buttonradius.r,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: DimensionConstants.d16.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left:
                                                          DimensionConstants.d10.w,
                                                      right:
                                                          DimensionConstants.d10.w),
                                                  child: Row(
                                                    children: [
                                                      Text('Chicken Zinger')
                                                          .btnText(
                                                              ColorConstants
                                                                  .darkblackcolor,
                                                              DimensionConstants
                                                                  .d16.sp),
                                                      SizedBox(
                                                        width: DimensionConstants
                                                            .d70.w,
                                                      ),
                                                      Text('7999 EGP').btnText(
                                                          ColorConstants
                                                              .colorButtonbgColor,
                                                          DimensionConstants
                                                              .d16.sp),
                                                      SizedBox(
                                                        width: DimensionConstants
                                                            .d86.w,
                                                      ),
                                                      ImageView(
                                                        path: ImageConstants
                                                            .ic_cancel,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: DimensionConstants.d1.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left:
                                                          DimensionConstants.d10.w,
                                                      right:
                                                          DimensionConstants.d10.w),
                                                  child: Row(
                                                    children: [
                                                      Text('Spicy & crispy with garlic')
                                                          .btnText(
                                                              ColorConstants
                                                                  .cartTextcolor,
                                                              DimensionConstants
                                                                  .d14.sp),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: DimensionConstants.d9.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left:
                                                          DimensionConstants.d10.w,
                                                      right:
                                                          DimensionConstants.d5.w),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              ImageView(
                                                                path: ImageConstants
                                                                    .ic_fire,
                                                                height:
                                                                    DimensionConstants
                                                                        .d18.h,
                                                                width:
                                                                    DimensionConstants
                                                                        .d18.w,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    DimensionConstants
                                                                        .d4.w,
                                                              ),
                                                              Text('195Cal').btnText(
                                                                  ColorConstants
                                                                      .colorBlack,
                                                                  DimensionConstants
                                                                      .d14.sp)
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                DimensionConstants
                                                                    .d14.h,
                                                          ),
                                                          Row(
                                                            children: [
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
                                                                          .d40.h,
                                                                  width:
                                                                      DimensionConstants
                                                                          .d40.w,
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
                                                                            .buttonradius
                                                                            .r,
                                                                    topRightradius:
                                                                        DimensionConstants
                                                                            .buttonradius
                                                                            .r,
                                                                    bottomleftradius:
                                                                        DimensionConstants
                                                                            .buttonradius
                                                                            .r,
                                                                    bottomRightradius:
                                                                        DimensionConstants
                                                                            .buttonradius
                                                                            .r,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              DimensionConstants
                                                                                  .d12
                                                                                  .w,
                                                                          right:
                                                                              DimensionConstants
                                                                                  .d12
                                                                                  .w),
                                                                      child:
                                                                          ImageView(
                                                                        path: ImageConstants
                                                                            .ic_minus,
                                                                        height:
                                                                            DimensionConstants
                                                                                .d3.h,
                                                                        width:
                                                                            DimensionConstants
                                                                                .d17
                                                                                .w,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    DimensionConstants
                                                                        .d15.w,
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
                                                                        .d15.w,
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
                                                                          .d40.h,
                                                                  width:
                                                                      DimensionConstants
                                                                          .d40.w,
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
                                                                            .buttonradius
                                                                            .r,
                                                                    topRightradius:
                                                                        DimensionConstants
                                                                            .buttonradius
                                                                            .r,
                                                                    bottomleftradius:
                                                                        DimensionConstants
                                                                            .buttonradius
                                                                            .r,
                                                                    bottomRightradius:
                                                                        DimensionConstants
                                                                            .buttonradius
                                                                            .r,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              DimensionConstants
                                                                                  .d12
                                                                                  .w,
                                                                          right:
                                                                              DimensionConstants
                                                                                  .d12
                                                                                  .w),
                                                                      child:
                                                                          ImageView(
                                                                        path: ImageConstants
                                                                            .ic_add,
                                                                        height:
                                                                            DimensionConstants
                                                                                .d3.h,
                                                                        width:
                                                                            DimensionConstants
                                                                                .d17
                                                                                .w,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    DimensionConstants
                                                                        .d9.w,
                                                              ),
                                                              ImageView(
                                                                path: ImageConstants
                                                                    .ic_delivery,
                                                                height:
                                                                    DimensionConstants
                                                                        .d24.h,
                                                                width:
                                                                    DimensionConstants
                                                                        .d24.w,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    DimensionConstants
                                                                        .d5.w,
                                                              ),
                                                              Text('20 mins').btnText(
                                                                  ColorConstants
                                                                      .colorBlack,
                                                                  DimensionConstants
                                                                      .d14.sp)
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: DimensionConstants
                                                            .d37.w,
                                                      ),
                                                      ImageView(
                                                        path: ImageConstants
                                                            .ic_cart_burger,
                                                        height: DimensionConstants
                                                            .d92.h,
                                                        width: DimensionConstants
                                                            .d104.w,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d20.h,
                                      )
                                    ],
                                  ),
                                );
                              }),
                          Padding(padding: EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                            child: Container(
                              height: DimensionConstants.d110.h,
                              width: DimensionConstants.d372.w,
                              child: RoundCornerShape(
                                bgColor: ColorConstants.whiteColor,
                                radius: DimensionConstants.buttonradius.r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: DimensionConstants.d7.h,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: DimensionConstants.d18.w,
                                        ),
                                        Text('Total Items').btnText(ColorConstants.colorHintTextColor, DimensionConstants.d15.sp),
                                        SizedBox(
                                          width: DimensionConstants.d187.w,
                                        ),
                                        Text('134.99 EGP').btnText(ColorConstants.colorHintTextColor, DimensionConstants.d15.sp)

                                      ],
                                    ),
                                    SizedBox(
                                      height: DimensionConstants.d8.h,
                                    ),
                                    Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                                      child:Row(
                                        children: [
                                          Text('Shipping').btnText(ColorConstants.colorHintTextColor, DimensionConstants.d15.sp),
                                          SizedBox(
                                            width: DimensionConstants.d227.w,
                                          ),

                                          Text('10 EGP').boldText(ColorConstants.colorHintTextColor, DimensionConstants.d15.sp,TextAlign.center),



                                        ],
                                      )
                                      ,),

                                    Padding(
                                      padding:  EdgeInsets.only(left: DimensionConstants.d18.w,right: DimensionConstants.d18.w),
                                      child: Divider(
                                        thickness: DimensionConstants.d1.h,
                                      ),
                                    ),

                                    Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                                      child:Row(
                                        children: [
                                          Text('Total Cost').btnText(ColorConstants.darkblackcolor, DimensionConstants.d15.sp),
                                          SizedBox(
                                            width: DimensionConstants.d200.w,
                                          ),

                                          Text('14.99 EGP').btnText(ColorConstants.colorButtonbgColor, DimensionConstants.d15.sp),



                                        ],
                                      )
                                      ,),




                                  ],
                                ),
                              ),
                            ),),
                          SizedBox(
                            height: DimensionConstants.d14.h,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: DimensionConstants.d21.w,right: DimensionConstants.d21.w),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamed(RoutesConstants.checkout);
                              },
                              child: SizedBox(
                                width: DimensionConstants.buttonwidth.w,
                                height: DimensionConstants.buttonheight.h,
                                child: RoundCornerShape(
                                    bgColor: ColorConstants.colorButtonbgColor,
                                    radius: DimensionConstants.buttonradius.r,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'checkout'.tr(),
                                          ).buttonText(
                                              ColorConstants.whiteColor,
                                              DimensionConstants.buttontextsize.sp,
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
                  },
                ),
              );
            },
          )),
    );
  }

  void onItemTapped(int index) {
    if (index == 0) {
      Navigator.of(context).pushNamed(RoutesConstants.home_page);
    }


    if(index==4){
      Navigator.of(context)
          .pushNamed(RoutesConstants.profile);
    }
  }
}

//
