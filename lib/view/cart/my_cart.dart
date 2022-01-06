import 'dart:io';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/constants/color_constants.dart';
import 'package:food_delivery_app/constants/dimension_constants.dart';
import 'package:food_delivery_app/constants/image_constants.dart';
import 'package:food_delivery_app/constants/route_constants.dart';
import 'package:food_delivery_app/extensions/allExtensions.dart';
import 'package:food_delivery_app/provider/signup_provider.dart';
import 'package:food_delivery_app/view/base_view.dart';
import 'package:food_delivery_app/widgets/image_view.dart';
import 'package:food_delivery_app/widgets/list_view.dart';
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
            title: const Text('My Cart').mediumText(
                ColorConstants.colorTextAppBar, DimensionConstants.d20.sp,TextAlign.center),

            centerTitle: true,
          ),

          backgroundColor: ColorConstants.whiteColor,
          key: _scaffoldKey,
          body: BaseView<SignUpProvider>(
            onModelReady: (provider) {},
            builder: (context, provider, _) {
              return SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w,bottom: DimensionConstants.d24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: DimensionConstants.d28.h,
                      ),
                      Listview(
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                RoundCornerShape(
                                    decoration: const BoxDecoration(

                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0.0, 0.75),
                                            blurRadius: 12,
                                            color: ColorConstants.borderColor,
                                          )
                                        ]
                                    ),
                                    height: DimensionConstants.d147.h,
                                    width: DimensionConstants.d373.w,
                                    bgColor: ColorConstants.whiteColor,
                                    topRightradius: DimensionConstants.d6.r,
                                    topleftradius: DimensionConstants.d6.r,
                                    bottomRightradius: DimensionConstants.d6.r,
                                    bottomleftradius: DimensionConstants.d6.r,
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
                                                  .mediumText(
                                                  ColorConstants
                                                      .darkblackcolor,
                                                  DimensionConstants
                                                      .d16.sp,TextAlign.center),
                                              SizedBox(
                                                width: DimensionConstants
                                                    .d70.w,
                                              ),
                                              Text('7999 EGP').mediumText(
                                                  ColorConstants
                                                      .colorButtonbgColor,
                                                  DimensionConstants
                                                      .d16.sp,TextAlign.center),
                                              SizedBox(
                                                width: DimensionConstants
                                                    .d86.w,
                                              ),
                                              ImageView(
                                                path: ImageConstants
                                                    .ic_cancel,
                                                height: DimensionConstants.d12.h,
                                                width: DimensionConstants.d12.h,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: DimensionConstants.d1.h,
                                        ),

                                        SizedBox(
                                          height: DimensionConstants.d4.h,
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
                                                      Text('Spicy & crispy with garlic')
                                                          .mediumText(
                                                          ColorConstants
                                                              .cartTextcolor,
                                                          DimensionConstants
                                                              .d14.sp,TextAlign.center),
                                                    ],
                                                  ),
                                                  SizedBox
                                                    (height: DimensionConstants.d7.h,),
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
                                                      Text('195Cal').mediumText(
                                                          ColorConstants
                                                              .colorBlack,
                                                          DimensionConstants
                                                              .d14.sp,TextAlign.center)
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
                                                        child:  RoundCornerShape(
                                                          height:
                                                          DimensionConstants
                                                              .d40.h,
                                                          width:
                                                          DimensionConstants
                                                              .d40.w,
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
                                                      SizedBox(
                                                        width:
                                                        DimensionConstants
                                                            .d15.w,
                                                      ),
                                                      Text(count[index].toString()).boldText(
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
                                                        child: RoundCornerShape(
                                                          height:
                                                          DimensionConstants
                                                              .d40.h,
                                                          width:
                                                          DimensionConstants
                                                              .d40.w,
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
                                                                  .d15.h,
                                                              width:
                                                              DimensionConstants
                                                                  .d15
                                                                  .w,
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
                                                      Text('20 mins').mediumText(
                                                          ColorConstants
                                                              .colorBlack,
                                                          DimensionConstants
                                                              .d14.sp,TextAlign.center)
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
                                                    .d94.h,
                                                width: DimensionConstants
                                                    .d102.w,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  height: DimensionConstants.d20.h,
                                )
                              ],
                            );
                          }),
                      RoundCornerShape(
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 12,
                                color: ColorConstants.borderColor,
                              )
                            ]
                        ),
                        height: DimensionConstants.d110.h,
                        width: DimensionConstants.d372.w,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
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
                                Text('Total Items').mediumText(ColorConstants.darkblackcolor, DimensionConstants.d15.sp,TextAlign.center),
                                SizedBox(
                                  width: DimensionConstants.d187.w,
                                ),
                                Text('134.99 EGP').mediumText(ColorConstants.darkblackcolor, DimensionConstants.d15.sp,TextAlign.center)

                              ],
                            ),
                            SizedBox(
                              height: DimensionConstants.d8.h,
                            ),
                            Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                              child:Row(
                                children: [
                                  Text('Shipping').mediumText(ColorConstants.darkblackcolor, DimensionConstants.d15.sp,TextAlign.center),
                                  SizedBox(
                                    width: DimensionConstants.d227.w,
                                  ),

                                  Text('10 EGP').boldText(ColorConstants.darkblackcolor, DimensionConstants.d15.sp,TextAlign.center),



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
                                  const Text('Total Cost').mediumText(ColorConstants.darkblackcolor, DimensionConstants.d15.sp,TextAlign.center),
                                  SizedBox(
                                    width: DimensionConstants.d200.w,
                                  ),

                                  const Text('14.99 EGP').GilroySemiBoldText(ColorConstants.colorButtonbgColor, DimensionConstants.d15.sp,TextAlign.center),



                                ],
                              )
                              ,),




                          ],
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d14.h,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(RoutesConstants.checkout);
                        },
                        child: SizedBox(

                          child: RoundCornerShape(
                              decoration: const BoxDecoration(

                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 12,
                                      color: ColorConstants.borderColor,
                                    )
                                  ]
                              ),
                              width: DimensionConstants.d373.w,
                              height: DimensionConstants.d52.h,
                              bgColor: ColorConstants.colorButtonbgColor,
                              topRightradius: DimensionConstants.d6.r,
                              topleftradius: DimensionConstants.d6.r,
                              bottomRightradius: DimensionConstants.d6.r,
                              bottomleftradius: DimensionConstants.d6.r,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'checkout'.tr(),
                                    ).boldText(
                                        ColorConstants.whiteColor,
                                        DimensionConstants.d16.sp,
                                        TextAlign.center),

                                  ],
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }


}

//
