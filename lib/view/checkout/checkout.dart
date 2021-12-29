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

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
            backgroundColor: ColorConstants.colorbackground,
            title:
            Text('Checkout').btnText(ColorConstants.colorTextAppBar, DimensionConstants.d20.sp),
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
              return SafeArea(
                child: ScreenUtilInit(
                  designSize: const Size(DimensionConstants.loginscreenwidth,
                      DimensionConstants.loginscreenheight),
                  builder: () {
                    return  SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: DimensionConstants.d59.h,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: DimensionConstants.d19.w),
                            child: Text('Delivery').btnText(ColorConstants.headingColor, DimensionConstants.d20.sp)),
                            SizedBox(
                              height: DimensionConstants.d15.h,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                              child: Container(
                                height: DimensionConstants.d52.h,
                                child: RoundCornerShape(
                                  bgColor: ColorConstants.whiteColor,
                                  radius: DimensionConstants.buttonradius.r,
                                  child: TextFormField(
                                    controller: addresscontroller,
                                    textCapitalization:
                                    TextCapitalization.sentences,
                                    cursorColor:
                                    ColorConstants.colorButtonbgColor,
                                    style: ViewDecoration.textFieldStyle(
                                        DimensionConstants
                                            .textfieldTextSize.sp),
                                    decoration: ViewDecoration
                                        .inputDecorationWithCurve(
                                      "address".tr(),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: DimensionConstants
                                                  .d22
                                                  .w,
                                              top: DimensionConstants
                                                  .d17
                                                  .h,
                                              bottom: DimensionConstants
                                                  .d17
                                                  .h,
                                              right: DimensionConstants
                                                  .d11
                                                  .w),
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
                                                .d11
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
                            ),
                            SizedBox(
                              height: DimensionConstants.d15.h,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                              child: Container(
                                height: DimensionConstants.d52.h,
                                child: RoundCornerShape(
                                  bgColor: ColorConstants.whiteColor,
                                  radius: DimensionConstants.buttonradius.r,
                                  child: TextFormField(
                                    controller: phonecontroller,
                                    textCapitalization:
                                    TextCapitalization.sentences,
                                    cursorColor:
                                    ColorConstants.colorButtonbgColor,
                                    style: ViewDecoration.textFieldStyle(
                                        DimensionConstants
                                            .textfieldTextSize.sp),
                                    decoration: ViewDecoration
                                        .inputDecorationWithCurve(
                                      "phone_number".tr(),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: DimensionConstants
                                                  .phonetextfieldleftpadding
                                                  .w,
                                              top: DimensionConstants
                                                  .phonetextfieldtoppadding
                                                  .h,
                                              bottom: DimensionConstants
                                                  .phonetextfieldbottompadding
                                                  .h,
                                              right: DimensionConstants
                                                  .phonetextfieldrightpadding
                                                  .w),
                                          child: const ImageView(
                                            path: ImageConstants.ic_phone,
                                          )),

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
                            ),
                            SizedBox(
                              height: DimensionConstants.d20.h,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: DimensionConstants.d18.w),
                            child: Transform.scale(
                              scale: 1,
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
                            ),),
                            SizedBox(
                              height: DimensionConstants.d20.h,
                            ),
                            Padding(padding: EdgeInsets.only(left: DimensionConstants.d19.w),
                            child: Text('Payment').btnText(ColorConstants.colorTextAppBar, DimensionConstants.d20.sp)),
                            Padding(
                              padding: EdgeInsets.only(left: DimensionConstants.d18.w),
                              child: Row(

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

                                  Text('Credit Card').btnText(ColorConstants.colorTextAppBar, DimensionConstants.d16.sp),
                                  SizedBox(
                                    width: DimensionConstants.d92.w,
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
                                  Text('Cash on delivery').btnText(ColorConstants.colorTextAppBar, DimensionConstants.d16.sp),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: DimensionConstants.d18.h,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                              child: Container(
                                height: DimensionConstants.d52.h,
                                child: RoundCornerShape(
                                  bgColor: ColorConstants.whiteColor,
                                  radius: DimensionConstants.buttonradius.r,
                                  child: TextFormField(

                                    textCapitalization:
                                    TextCapitalization.sentences,
                                    cursorColor:
                                    ColorConstants.colorButtonbgColor,
                                    style: ViewDecoration.textFieldStyle(
                                        DimensionConstants
                                            .textfieldTextSize.sp),
                                    decoration: ViewDecoration
                                        .inputDecorationWithCurve(
                                        "card_holder".tr(),
                                        prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                left: DimensionConstants
                                                    .d22
                                                    .w,
                                                top: DimensionConstants
                                                    .d17
                                                    .h,
                                                bottom: DimensionConstants
                                                    .d17
                                                    .h,
                                                right: DimensionConstants
                                                    .d11
                                                    .w),
                                            child:  ImageView(
                                              path: ImageConstants.ic_profile,
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
                            ),
                            SizedBox(
                              height: DimensionConstants.d15.h,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                              child: Container(
                                height: DimensionConstants.d52.h,
                                child: RoundCornerShape(
                                  bgColor: ColorConstants.whiteColor,
                                  radius: DimensionConstants.buttonradius.r,
                                  child: TextFormField(

                                    textCapitalization:
                                    TextCapitalization.sentences,
                                    cursorColor:
                                    ColorConstants.colorButtonbgColor,
                                    style: ViewDecoration.textFieldStyle(
                                        DimensionConstants
                                            .textfieldTextSize.sp),
                                    decoration: ViewDecoration
                                        .inputDecorationWithCurve(
                                      "card_number".tr(),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: DimensionConstants
                                                  .d22
                                                  .w,
                                              top: DimensionConstants
                                                  .d17
                                                  .h,
                                              bottom: DimensionConstants
                                                  .d17
                                                  .h,
                                              right: DimensionConstants
                                                  .d11
                                                  .w),
                                          child:  ImageView(
                                            path: ImageConstants.ic_card_holder,
                                            color: ColorConstants.colorHintTextColor,
                                            height: DimensionConstants.d20.h,
                                            width: DimensionConstants.d18.w,
                                          )),

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
                            ),
                            SizedBox(
                              height: DimensionConstants.d15.h,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                              child: Row(
                                children: [
                                  Container(
                                    height: DimensionConstants.d52.h,
                                    width: DimensionConstants.d179.w,
                                    child: RoundCornerShape(
                                      bgColor: ColorConstants.whiteColor,
                                      radius: DimensionConstants.buttonradius.r,
                                      child: TextFormField(

                                        textCapitalization:
                                        TextCapitalization.sentences,
                                        cursorColor:
                                        ColorConstants.colorButtonbgColor,
                                        style: ViewDecoration.textFieldStyle(
                                            DimensionConstants
                                                .textfieldTextSize.sp),
                                        decoration: ViewDecoration
                                            .inputDecorationWithCurve(
                                          "expiry".tr(),
                                          prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: DimensionConstants
                                                      .d22
                                                      .w,
                                                  top: DimensionConstants
                                                      .d17
                                                      .h,
                                                  bottom: DimensionConstants
                                                      .d17
                                                      .h,
                                                  right: DimensionConstants
                                                      .d11
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
                                    width: DimensionConstants.d13.w,
                                  ),
                                  Container(
                                    height: DimensionConstants.d52.h,
                                    width: DimensionConstants.d179.w,
                                    child: RoundCornerShape(
                                      bgColor: ColorConstants.whiteColor,
                                      radius: DimensionConstants.buttonradius.r,
                                      child: TextFormField(

                                        textCapitalization:
                                        TextCapitalization.sentences,
                                        cursorColor:
                                        ColorConstants.colorButtonbgColor,
                                        style: ViewDecoration.textFieldStyle(
                                            DimensionConstants
                                                .textfieldTextSize.sp),
                                        decoration: ViewDecoration
                                            .inputDecorationWithCurve(
                                          "cvv".tr(),
                                          prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: DimensionConstants
                                                      .d22
                                                      .w,
                                                  top: DimensionConstants
                                                      .d17
                                                      .h,
                                                  bottom: DimensionConstants
                                                      .d17
                                                      .h,
                                                  right: DimensionConstants
                                                      .d11
                                                      .w),
                                              child:  ImageView(
                                                path: ImageConstants.ic_cvv,
                                                color: ColorConstants.colorHintTextColor,
                                                height: DimensionConstants.d20.h,
                                                width: DimensionConstants.d18.w,
                                              )),

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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: DimensionConstants.d20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: DimensionConstants.d18.w),
                              child: Transform.scale(
                                scale: 1,
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
                              ),),
                            SizedBox(
                              height: DimensionConstants.d124.h,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: DimensionConstants.d21.w,right: DimensionConstants.d21.w),
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
                                            'done'.tr(),
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
}

//
