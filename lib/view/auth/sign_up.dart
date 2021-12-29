import 'dart:io';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  ScreenScaler? scaler;
  final _formKey = GlobalKey<FormState>();
  final fnamecontroller = TextEditingController();
  final lnamecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final desccontroller = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              DimensionConstants.loginhorizontalpadding.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: DimensionConstants.loginscreengap1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "welcome_message".tr(),
                                ).regularText(ColorConstants.headingColor,
                                    DimensionConstants.welcomeTextSize.sp),
                              ],
                            ),
                            SizedBox(
                              height: DimensionConstants.loginscreengap2.h,
                            ),
                            Container(
                              child: Form(
                                child: Column(
                                  children: [
                                    Container(
                                      height: DimensionConstants.buttonheight,
                                      child: TextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        cursorColor:
                                            ColorConstants.colorButtonbgColor,
                                        controller: fnamecontroller,
                                        style: ViewDecoration.textFieldStyle(
                                            DimensionConstants
                                                .textfieldTextSize.sp),
                                        decoration: ViewDecoration.inputDecorationWithCurve(
                                            "full_name".tr(),
                                            prefixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    left: DimensionConstants
                                                        .nametextfieldleftpadding
                                                        .w,
                                                    top: DimensionConstants
                                                        .nametextfieldtoppadding
                                                        .h,
                                                    bottom: DimensionConstants
                                                        .nametextfieldbottompadding
                                                        .h,
                                                    right: DimensionConstants
                                                        .nametextfieldrightpadding
                                                        .w),
                                                child: const ImageView(
                                                  path:
                                                      ImageConstants.ic_person,
                                                ))),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value!.trim().isEmpty) {
                                            return 'empty_name'.tr();
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: DimensionConstants.textfieldgap.h,
                                    ),
                                    Container(
                                      height: DimensionConstants.buttonheight,
                                      child: TextFormField(
                                        cursorColor:
                                            ColorConstants.colorButtonbgColor,
                                        controller: _emailController,
                                        style: ViewDecoration.textFieldStyle(
                                            DimensionConstants
                                                .textfieldTextSize.sp),
                                        decoration: ViewDecoration.inputDecorationWithCurve(
                                            "email".tr(),
                                            prefixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    left: DimensionConstants
                                                        .emailtextfieldleftpadding
                                                        .w,
                                                    top: DimensionConstants
                                                        .emailtextfieldtoppadding
                                                        .h,
                                                    bottom: DimensionConstants
                                                        .emailtextfieldbottompadding
                                                        .h,
                                                    right: DimensionConstants
                                                        .emailtextfieldrightpadding
                                                        .w),
                                                child: const ImageView(
                                                  path: ImageConstants.ic_email,
                                                ))),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.trim().isEmpty) {
                                            return 'empty_email'.tr();
                                          } else if (!Validations
                                              .emailValidation(value)) {
                                            return 'invalid_email'.tr();
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: DimensionConstants.textfieldgap.h,
                                    ),
                                    Container(
                                      height: DimensionConstants.buttonheight,
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
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: ColorConstants
                                                  .colorHintTextColor,
                                              size: DimensionConstants
                                                  .eyeiconsize,
                                            ),
                                            onPressed: () {
                                              // Update the state i.e. toogle the state of passwordVisible variable
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
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
                                    SizedBox(
                                      height: DimensionConstants.textfieldgap.h,
                                    ),
                                    Container(
                                      height: DimensionConstants.buttonheight,
                                      child: TextFormField(
                                        controller: _passwordController,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        cursorColor:
                                            ColorConstants.colorButtonbgColor,
                                        style: ViewDecoration.textFieldStyle(
                                            DimensionConstants
                                                .textfieldTextSize.sp),
                                        decoration: ViewDecoration
                                            .inputDecorationWithCurve(
                                          "confirm_password".tr(),
                                          prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: DimensionConstants
                                                      .passwordtextfieldleftpadding
                                                      .w,
                                                  top: DimensionConstants
                                                      .passwordtextfieldtoppadding
                                                      .h,
                                                  bottom: DimensionConstants
                                                      .passwordtextfieldbottompadding
                                                      .h,
                                                  right: DimensionConstants
                                                      .passwordtextfieldrightpadding
                                                      .w),
                                              child: const ImageView(
                                                path:
                                                    ImageConstants.ic_password,
                                              )),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: ColorConstants
                                                  .colorHintTextColor,
                                              size: DimensionConstants
                                                  .eyeiconsize,
                                            ),
                                            onPressed: () {
                                              // Update the state i.e. toogle the state of passwordVisible variable
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value!.trim().isEmpty) {
                                            return 'empty_password'.tr();
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          DimensionConstants.loginscreengap3.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (fnamecontroller.text == '') {
                                  DialogHelper.showMessage(
                                      context, 'Name cannot be empty');
                                  return;
                                }
                                if (_emailController.text == '') {
                                  DialogHelper.showMessage(
                                      context, 'Email cannot be empty');
                                  return;
                                }
                                if (!Validations.emailValidation(_emailController.text)) {
                                  DialogHelper.showMessage(
                                      context, 'Invalid email');
                                  return;
                                }
                                if (phonecontroller.text == '') {
                                  DialogHelper.showMessage(
                                      context, 'Phone number cannot be empty');
                                  return;
                                }
                                if (_passwordController.text == '') {
                                  DialogHelper.showMessage(
                                      context, 'Password cannot be empty');
                                  return;
                                }

                                if (_passwordController.text.length < 6) {
                                  DialogHelper.showMessage(context,
                                      'Password should be of atleast 6 letters');
                                  return;
                                }
                              },
                              child: Container(
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
                                            'sign_up'.tr(),
                                          ).buttonText(
                                              ColorConstants.whiteColor,
                                              DimensionConstants
                                                  .buttontextsize.sp,
                                              TextAlign.center),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: DimensionConstants.buttongap1.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      DimensionConstants.dividerleftpadding.w,
                                ),
                                const Expanded(
                                    child: Divider(
                                  color: ColorConstants.dividerColor,
                                  thickness:
                                      DimensionConstants.dividerthickness,
                                )),
                                SizedBox(
                                  width: DimensionConstants.dividerpadding1.w,
                                ),
                                Text("or".tr()).btnText(
                                    ColorConstants.colorBlack,
                                    DimensionConstants.dividertextsize.sp),
                                SizedBox(
                                  width: DimensionConstants.dividerpadding2.w,
                                ),
                                const Expanded(
                                    child: Divider(
                                  color: ColorConstants.dividerColor,
                                  thickness:
                                      DimensionConstants.dividerthickness,
                                )),
                                SizedBox(
                                  width:
                                      DimensionConstants.dividerrightpadding.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: DimensionConstants.buttongap1.h,
                            ),
                            Container(
                              width: DimensionConstants.buttonwidth.w,
                              height: DimensionConstants.buttonheight.h,
                              child: RoundCornerShape(
                                  bgColor: ColorConstants.fbbuttonColor,
                                  radius: DimensionConstants.buttonradius.r,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: DimensionConstants
                                              .buttoniconpadding.w),
                                      child: Row(
                                        children: [
                                          ImageView(
                                            path: ImageConstants.ic_facebook,
                                            height: DimensionConstants
                                                .fbiconheight.h,
                                            width: DimensionConstants
                                                .fbiconwidth.w,
                                          ),
                                          SizedBox(
                                            width: DimensionConstants.icongap.w,
                                          ),
                                          Text(
                                            'fb_login'.tr(),
                                          ).btnText(
                                            ColorConstants.whiteColor,
                                            DimensionConstants
                                                .buttontextsize.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: DimensionConstants.googlebutongap.h,
                            ),
                            SizedBox(
                              width: DimensionConstants.buttonwidth.w,
                              height: DimensionConstants.buttonheight.h,
                              child: RoundCornerShape(
                                  bgColor: Colors.white,
                                  radius: DimensionConstants.buttonradius.r,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: DimensionConstants
                                              .googleicongap.w),
                                      child: Row(
                                        children: [
                                          ImageView(
                                            path: ImageConstants.ic_google,
                                            height: DimensionConstants
                                                .googleiconheight.h,
                                            width: DimensionConstants
                                                .googleiconwidth.w,
                                          ),
                                          SizedBox(
                                            width: DimensionConstants
                                                .googletextgap.w,
                                          ),
                                          Text(
                                            'google_login'.tr(),
                                          ).btnText(
                                            ColorConstants.googleTextColor,
                                            DimensionConstants
                                                .buttontextsize.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: DimensionConstants.noaccountsizegap.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    "login", (Route<dynamic> route) => false);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "already_account".tr(),
                                  ).btnText(ColorConstants.googleTextColor,
                                      DimensionConstants.noaccounttextsize.sp),
                                  SizedBox(
                                    width:
                                        DimensionConstants.noaccounttextgap.w,
                                  ),
                                  Text(
                                    "sign_in".tr(),
                                  ).btnText(ColorConstants.colorButtonbgColor,
                                      DimensionConstants.noaccounttextsize.sp)
                                ],
                              ),
                            ),
                          ],
                        ),
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
