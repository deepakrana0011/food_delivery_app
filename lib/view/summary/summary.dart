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
import 'package:food_delivery_app/widgets/image_view.dart';
import 'package:food_delivery_app/widgets/roundCornerShape.dart';

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  final addresscontroller=new TextEditingController();
  final phonecontroller =new TextEditingController();
  bool status=false;
  bool status1=true;
  Object _radioSelected = 1;
  String? _radioVal;



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
            title:
            Text('Summary').mediumText(ColorConstants.colorTextAppBar, DimensionConstants.d20.sp,TextAlign.center),
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
              return  SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: DimensionConstants.d36.h,
                      ),
                      RoundCornerShape(
                        decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 12,
                                color: ColorConstants.borderColor,
                              )
                            ]
                        ),
                        height: DimensionConstants.d70.h,
                        width: DimensionConstants.d372.w,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(

                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: DimensionConstants.d18.w,
                                ),
                                Text('Address').mediumText(ColorConstants.colorBlack, DimensionConstants.d14.sp,TextAlign.center),
                                SizedBox(
                                  width: DimensionConstants.d250.w,
                                ),
                                Text('Edit').mediumText(ColorConstants.percentagecolor, DimensionConstants.d14.sp,TextAlign.center)

                              ],
                            ),
                            SizedBox(
                              height: DimensionConstants.d2.h,
                            ),
                            Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                              child:Text('4517 Washington Ave. Manchester, Kentucky 39495').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp,
                                  TextAlign.center)
                              ,)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d15.h,
                      ),
                      RoundCornerShape(
                        decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 12,
                                color: ColorConstants.borderColor,
                              )
                            ]
                        ),
                        height: DimensionConstants.d70.h,
                        width: DimensionConstants.d372.w,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              children: [
                                SizedBox(
                                  width: DimensionConstants.d18.w,
                                ),
                                Text('Phone Number').mediumText(ColorConstants.colorBlack, DimensionConstants.d14.sp,TextAlign.center),
                                SizedBox(
                                  width: DimensionConstants.d207.w,
                                ),
                                Text('Edit').mediumText(ColorConstants.percentagecolor, DimensionConstants.d14.sp,TextAlign.center)

                              ],
                            ),
                            SizedBox(
                              height: DimensionConstants.d2.h,
                            ),
                            Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                              child:Text('01 102 0512 02566').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp,TextAlign.center)
                              ,)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d15.h,
                      ),
                      RoundCornerShape(
                        decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 12,
                                color: ColorConstants.borderColor,
                              )
                            ]
                        ),
                        height: DimensionConstants.d70.h,
                        width: DimensionConstants.d372.w,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Row(
                              children: [
                                SizedBox(
                                  width: DimensionConstants.d18.w,
                                ),
                                Text('Payment').mediumText(ColorConstants.colorBlack, DimensionConstants.d14.sp,TextAlign.center),
                                SizedBox(
                                  width: DimensionConstants.d245.w,
                                ),
                                Text('Edit').mediumText(ColorConstants.percentagecolor, DimensionConstants.d14.sp,TextAlign.center)

                              ],
                            ),
                            SizedBox(
                              height: DimensionConstants.d2.h,
                            ),
                            Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                              child:Text('Visa: 365-254-2415-1240').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp,TextAlign.center)
                              ,)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d15.h,
                      ),
                      RoundCornerShape(
                        decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 12,
                                color: ColorConstants.borderColor,
                              )
                            ]
                        ),
                        height: DimensionConstants.d116.h,
                        width: DimensionConstants.d372.w,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              children: [
                                SizedBox(
                                  width: DimensionConstants.d18.w,
                                ),
                                Text('Order').mediumText(ColorConstants.colorBlack, DimensionConstants.d14.sp,TextAlign.center),
                                SizedBox(
                                  width: DimensionConstants.d264.w,
                                ),
                                Text('Edit').mediumText(ColorConstants.percentagecolor, DimensionConstants.d14.sp,TextAlign.center)

                              ],
                            ),
                            SizedBox(
                              height: DimensionConstants.d3.h,
                            ),
                            Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                              child:Row(
                                children: [
                                  Text('Chicken Zinger, Size (S)').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp,TextAlign.center),
                                  SizedBox(
                                    width: DimensionConstants.d86.w,
                                  ),
                                  RoundCornerShape(
                                    height: DimensionConstants.d18.h,
                                    width: DimensionConstants.d18.w,
                                    bgColor: ColorConstants.whiteColor,
                                    strokeColor: ColorConstants.strokecolor,
                                    topleftradius: DimensionConstants.d6.r,
                                    topRightradius: DimensionConstants.d6.r,
                                    bottomRightradius: DimensionConstants.d6.r,
                                    bottomleftradius: DimensionConstants.d6.r,
                                    child: Padding(
                                        padding:  EdgeInsets.only(left: DimensionConstants.d5.w,top: DimensionConstants.d8.h,bottom: DimensionConstants.d8.h,
                                            right: DimensionConstants.d5.w),
                                        child: ImageView(
                                          path: ImageConstants.ic_minus,
                                          height: DimensionConstants.d1.h,
                                          width: DimensionConstants.d7.w,
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    width: DimensionConstants.d4.w,
                                  ),
                                  Text('1 X 79.99 EGP').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp,TextAlign.center),
                                  SizedBox(
                                    width: DimensionConstants.d4.w,
                                  ),
                                  RoundCornerShape(
                                    height: DimensionConstants.d18.h,
                                    width: DimensionConstants.d18.w,
                                    bgColor: ColorConstants.whiteColor,
                                    strokeColor: ColorConstants.strokecolor,
                                    topleftradius: DimensionConstants.d6.r,
                                    topRightradius: DimensionConstants.d6.r,
                                    bottomRightradius: DimensionConstants.d6.r,
                                    bottomleftradius: DimensionConstants.d6.r,
                                    child: Padding(
                                        padding:  EdgeInsets.only(left: DimensionConstants.d5.w,top: DimensionConstants.d5.h,bottom: DimensionConstants.d5.h,
                                            right: DimensionConstants.d5.w),
                                        child: ImageView(
                                          path: ImageConstants.ic_add,
                                          height: DimensionConstants.d7.h,
                                          width: DimensionConstants.d7.w,
                                        )
                                    ),
                                  ),

                                ],
                              )
                              ,),
                            SizedBox(
                              height: DimensionConstants.d8.h,
                            ),
                            Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                              child:Row(
                                children: [
                                  Text('Pizza Marina, Size (L)').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp,TextAlign.center),
                                  SizedBox(
                                    width: DimensionConstants.d108.w,
                                  ),
                                  RoundCornerShape(
                                    height: DimensionConstants.d18.h,
                                    width: DimensionConstants.d18.w,
                                    bgColor: ColorConstants.whiteColor,
                                    strokeColor: ColorConstants.strokecolor,
                                    topleftradius: DimensionConstants.d6.r,
                                    topRightradius: DimensionConstants.d6.r,
                                    bottomRightradius: DimensionConstants.d6.r,
                                    bottomleftradius: DimensionConstants.d6.r,
                                    child: Padding(
                                        padding:  EdgeInsets.only(left: DimensionConstants.d5.w,top: DimensionConstants.d8.h,bottom: DimensionConstants.d8.h,
                                            right: DimensionConstants.d5.w),
                                        child: ImageView(
                                          path: ImageConstants.ic_minus,
                                          height: DimensionConstants.d1.h,
                                          width: DimensionConstants.d7.w,
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    width: DimensionConstants.d4.w,
                                  ),
                                  Text('2 X 50 EGP').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp,TextAlign.center),
                                  SizedBox(
                                    width: DimensionConstants.d4.w,
                                  ),
                                  RoundCornerShape(
                                    height: DimensionConstants.d18.h,
                                    width: DimensionConstants.d18.w,
                                    bgColor: ColorConstants.whiteColor,
                                    strokeColor: ColorConstants.strokecolor,
                                    topleftradius: DimensionConstants.d6.r,
                                    topRightradius: DimensionConstants.d6.r,
                                    bottomRightradius: DimensionConstants.d6.r,
                                    bottomleftradius: DimensionConstants.d6.r,
                                    child: Padding(
                                        padding:  EdgeInsets.only(left: DimensionConstants.d5.w,top: DimensionConstants.d5.h,bottom: DimensionConstants.d5.h,
                                            right: DimensionConstants.d5.w),
                                        child: ImageView(
                                          path: ImageConstants.ic_add,
                                          height: DimensionConstants.d7.h,
                                          width: DimensionConstants.d7.w,
                                        )
                                    ),
                                  ),

                                ],
                              )
                              ,),
                            SizedBox(
                              height: DimensionConstants.d2.h,
                            ),
                            Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                              child:Row(
                                children: [
                                  Text('Exter Fries').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp,TextAlign.center),
                                  SizedBox(
                                    width: DimensionConstants.d218.w,
                                  ),

                                  Text('1 X 5 EGP').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp,TextAlign.center),



                                ],
                              )
                              ,),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d15.h,
                      ),
                      RoundCornerShape(
                        decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 12,
                                color: ColorConstants.borderColor,
                              )
                            ]
                        ),
                        height: DimensionConstants.d110.h,
                        width: DimensionConstants.d373.w,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              children: [
                                SizedBox(
                                  width: DimensionConstants.d18.w,
                                ),
                                Text('Total Items').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d15.sp,TextAlign.center),
                                SizedBox(
                                  width: DimensionConstants.d187.w,
                                ),
                                Text('134.99 EGP').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d15.sp,TextAlign.center)

                              ],
                            ),
                            SizedBox(
                              height: DimensionConstants.d8.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                              child:Row(
                                children: [
                                  Text('Shipping').mediumText(ColorConstants.colorHintTextColor, DimensionConstants.d15.sp,TextAlign.center),
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
                            Padding(
                                padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                                child:Row(
                                  children: [

                                    Text('Total Cost').mediumText(ColorConstants.darkblackcolor, DimensionConstants.d15.sp,TextAlign.center),

                                    SizedBox(
                                      width: DimensionConstants.d200.w,
                                    ),

                                    Text('14.99 EGP').GilroySemiBoldText(ColorConstants.colorButtonbgColor, DimensionConstants.d15.sp,TextAlign.center),

                                  ],
                                )

                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d158.h,
                      ),
                      RoundCornerShape(
                          decoration: BoxDecoration(

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
                                  'done'.tr(),
                                ).boldText(
                                    ColorConstants.whiteColor,
                                    DimensionConstants.d16.sp,
                                    TextAlign.center),

                              ],
                            ),
                          )
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
