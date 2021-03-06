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
import 'package:food_delivery_app/widgets/image_view.dart';
import 'package:food_delivery_app/widgets/roundCornerShape.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final addresscontroller=new TextEditingController();
  final phonecontroller =new TextEditingController();
  final cardholder =new TextEditingController();
  final cardnumber =new TextEditingController();
  final expirydate =new TextEditingController();
  final cvv =new TextEditingController();

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
            backgroundColor: ColorConstants.whiteColor,
            title:
            Text('Checkout').mediumText(ColorConstants.colorTextAppBar, DimensionConstants.d20.sp,TextAlign.center),
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
                        height: DimensionConstants.d49.h,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: DimensionConstants.d19.w),
                          child: Text('Delivery').mediumText(ColorConstants.headingColor, DimensionConstants.d20.sp,TextAlign.center)),
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
                        height: DimensionConstants.d52.h,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
                        child: Center(
                          child: TextFormField(
                            controller: addresscontroller,

                            cursorColor:
                            ColorConstants.colorButtonbgColor,
                            style: ViewDecoration.textFieldStyle(
                                DimensionConstants
                                    .d16.sp),
                            decoration: ViewDecoration
                                .inputDecorationWithCurve(
                                "address".tr(),
                                prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        left: DimensionConstants
                                            .d19
                                            .w,

                                        right: DimensionConstants
                                            .d8
                                            .w
                                    ),
                                    child:  ImageView(
                                      path: ImageConstants.ic_map,
                                      height: DimensionConstants.d20.h,
                                      width: DimensionConstants.d20.w,
                                    )),
                                suffixIcon: Padding(
                                  padding:  EdgeInsets.only( top: DimensionConstants
                                      .d17
                                      .h,
                                      bottom: DimensionConstants
                                          .d17
                                          .h,
                                      right: DimensionConstants
                                          .d16
                                          .w),
                                  child: ImageView(
                                    path: ImageConstants.ic_address,
                                    height: DimensionConstants.d19.h,
                                    width: DimensionConstants.d19.w,
                                  ),
                                )
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,

                          ),
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
                        height: DimensionConstants.d52.h,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
                        child: Center(
                          child: TextFormField(
                            controller: phonecontroller,
                            textCapitalization:
                            TextCapitalization.sentences,
                            cursorColor:
                            ColorConstants.colorButtonbgColor,
                            style: ViewDecoration.textFieldStyle(
                                DimensionConstants
                                    .d16.sp),
                            decoration: ViewDecoration
                                .inputDecorationWithCurve(
                              "phone_number".tr(),
                              prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      left: DimensionConstants
                                          .d19
                                          .w,

                                      right: DimensionConstants
                                          .d8
                                          .w),
                                  child:  ImageView(
                                    path: ImageConstants.ic_phone,
                                    height: DimensionConstants.d20.h,
                                    width: DimensionConstants.d12.w,
                                  )),

                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,

                          ),
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d20.h,
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child:
                        CupertinoSwitch(

                          activeColor:
                          ColorConstants.colorButtonbgColor,
                          value: status,
                          onChanged:
                              (value) {
                            setState(() {
                              status =
                                  value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d20.h,
                      ),
                      Text('Payment').mediumText(ColorConstants.colorTextAppBar, DimensionConstants.d20.sp,TextAlign.center),
                      Row(

                        children: [

                          Radio(


                            splashRadius: DimensionConstants.d25.r,
                            value: 1,
                            groupValue: _radioSelected,
                            activeColor: ColorConstants.colorButtonbgColor,
                            onChanged: (value) {
                              setState(() {
                                _radioSelected = value!;
                                _radioVal = 'Credit Card';
                              });
                            },
                          ),

                          Text('Credit Card').mediumText(ColorConstants.colorTextAppBar, DimensionConstants.d16.sp,TextAlign.center),
                          SizedBox(
                            width: DimensionConstants.d52.w,
                          ),

                          Radio(
                            splashRadius: DimensionConstants.d25.r,
                            value: 2,
                            groupValue: _radioSelected,
                            activeColor: ColorConstants.colorButtonbgColor,
                            onChanged: (value) {
                              setState(() {
                                _radioSelected = value!;
                                _radioVal = 'Cash on delivery';
                              });
                            },
                          ),
                          Text('Cash on delivery').mediumText(ColorConstants.colorTextAppBar, DimensionConstants.d16.sp,TextAlign.center),
                        ],
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
                        height: DimensionConstants.d52.h,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
                        child: Center(
                          child: TextFormField(
                            controller: cardholder,

                            textCapitalization:
                            TextCapitalization.sentences,
                            cursorColor:
                            ColorConstants.colorButtonbgColor,
                            style: ViewDecoration.textFieldStyle(
                                DimensionConstants
                                    .d16.sp),
                            decoration: ViewDecoration
                                .inputDecorationWithCurve(
                              "card_holder".tr(),
                              prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      left: DimensionConstants
                                          .d20
                                          .w,

                                      right: DimensionConstants
                                          .d10
                                          .w),
                                  child:  ImageView(
                                    path: ImageConstants.ic_person,
                                    height: DimensionConstants.d20.h,
                                    width: DimensionConstants.d18.w,
                                    color: ColorConstants.colorHintTextColor,
                                  )
                              ),

                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'empty_phone'.tr();
                              } else {
                                return null;
                              }
                            },
                          ),
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
                        height: DimensionConstants.d52.h,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
                        child: Center(
                          child: TextFormField(
                            controller: cardnumber,

                            textCapitalization:
                            TextCapitalization.sentences,
                            cursorColor:
                            ColorConstants.colorButtonbgColor,
                            style: ViewDecoration.textFieldStyle(
                                DimensionConstants
                                    .d16.sp),
                            decoration: ViewDecoration
                                .inputDecorationWithCurve(
                              "card_number".tr(),
                              prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      left: DimensionConstants
                                          .d18
                                          .w,

                                      right: DimensionConstants
                                          .d8
                                          .w),
                                  child:  ImageView(
                                    path: ImageConstants.ic_card_holder,
                                    color: ColorConstants.colorHintTextColor,
                                    height: DimensionConstants.d16.h,
                                    width: DimensionConstants.d21.w,
                                  )),

                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,

                          ),
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d15.h,
                      ),
                      Row(
                        children: [
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
                            height: DimensionConstants.d52.h,
                            width: DimensionConstants.d179.w,
                            bgColor: ColorConstants.whiteColor,
                            topRightradius: DimensionConstants.d6.r,
                            topleftradius: DimensionConstants.d6.r,
                            bottomRightradius: DimensionConstants.d6.r,
                            bottomleftradius: DimensionConstants.d6.r,
                            child: Center(
                              child: TextFormField(
                                controller: expirydate,

                                textCapitalization:
                                TextCapitalization.sentences,
                                cursorColor:
                                ColorConstants.colorButtonbgColor,
                                style: ViewDecoration.textFieldStyle(
                                    DimensionConstants
                                        .d16.sp),
                                decoration: ViewDecoration
                                    .inputDecorationWithCurve(
                                  "expiry".tr(),
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: DimensionConstants
                                              .d19
                                              .w,

                                          right: DimensionConstants
                                              .d9
                                              .w),
                                      child:  ImageView(
                                        path: ImageConstants.ic_expiry,
                                        color: ColorConstants.colorHintTextColor,
                                        height: DimensionConstants.d20.h,
                                        width: DimensionConstants.d18.w,
                                      )),

                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,

                              ),
                            ),
                          ),
                          SizedBox(
                            width: DimensionConstants.d13.w,
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
                            height: DimensionConstants.d52.h,
                            width: DimensionConstants.d179.w,
                            bgColor: ColorConstants.whiteColor,
                            topRightradius: DimensionConstants.d6.r,
                            topleftradius: DimensionConstants.d6.r,
                            bottomRightradius: DimensionConstants.d6.r,
                            bottomleftradius: DimensionConstants.d6.r,
                            child: Center(
                              child: TextFormField(
                                controller: cvv,

                                textCapitalization:
                                TextCapitalization.sentences,
                                cursorColor:
                                ColorConstants.colorButtonbgColor,
                                style: ViewDecoration.textFieldStyle(
                                    DimensionConstants
                                        .d16.sp),
                                decoration: ViewDecoration
                                    .inputDecorationWithCurve(
                                  "cvv".tr(),
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: DimensionConstants
                                              .d18
                                              .w,

                                          right: DimensionConstants
                                              .d8
                                              .w),
                                      child:  ImageView(
                                        path: ImageConstants.ic_cvv,
                                        color: ColorConstants.colorHintTextColor,
                                        height: DimensionConstants.d16.h,
                                        width: DimensionConstants.d22.w,
                                      )),

                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,

                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: DimensionConstants.d20.h,
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child:
                        CupertinoSwitch(
                          activeColor:
                          ColorConstants.colorButtonbgColor,
                          value: status1,
                          onChanged:
                              (value) {
                            setState(() {
                              status1 =
                                  value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d79.h,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(addresscontroller.text==''){
                            DialogHelper.showMessage(context, 'Address cannot be empty');

                          }

                          else if(phonecontroller.text==''){
                            DialogHelper.showMessage(context, 'Phone number cannot be empty');

                          }

                          else if(cardholder.text==''){
                            DialogHelper.showMessage(context, 'Card Holder cannot be empty');

                          }

                          else if(cardnumber.text==''){
                            DialogHelper.showMessage(context, 'Card Number cannot be empty');

                          }

                          else if(expirydate.text==''){
                            DialogHelper.showMessage(context, 'Please enter expiry date');

                          }
                          else if(cvv.text==''){
                            DialogHelper.showMessage(context, 'Please enter CVV');

                          }
                          else{
                            Navigator.of(context).pushNamed(RoutesConstants.maps);
                          }

                        },
                        child: RoundCornerShape(
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
