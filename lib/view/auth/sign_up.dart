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
              return  Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                    DimensionConstants.d20.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: DimensionConstants.d143.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "welcome_message".tr(),
                          ).regularText(ColorConstants.headingColor,
                              DimensionConstants.d22.sp),
                        ],
                      ),
                      SizedBox(
                        height: DimensionConstants.d51.h,
                      ),
                      Container(
                        child: Form(
                          child: Column(
                            children: [
                              Container(
                                height: DimensionConstants.d52
                                    .h,
                                child: RoundCornerShape(
                                  bgColor: ColorConstants.whiteColor,
                                  radius: DimensionConstants.d6.r,
                                  child: TextFormField(
                                    textCapitalization:
                                    TextCapitalization.sentences,
                                    cursorColor:
                                    ColorConstants.colorButtonbgColor,
                                    controller: fnamecontroller,
                                    style: ViewDecoration.textFieldStyle(
                                        DimensionConstants
                                            .d16.sp),
                                    decoration: ViewDecoration.inputDecorationWithCurve(
                                        "full_name".tr(),
                                        prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                left: DimensionConstants
                                                    .d20
                                                    .w,
                                                top: DimensionConstants
                                                    .d16
                                                    .h,
                                                bottom: DimensionConstants
                                                    .d16
                                                    .h,
                                                right: DimensionConstants
                                                    .d10
                                                    .w),
                                            child:  ImageView(
                                              path:
                                              ImageConstants.ic_person,
                                              width: DimensionConstants.d18.w,
                                              height: DimensionConstants.d20.h,
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
                              ),
                              SizedBox(
                                height: DimensionConstants.d15.h,
                              ),
                              Container(
                                height: DimensionConstants.d52
                                    .h,
                                child: RoundCornerShape(
                                  bgColor: ColorConstants.whiteColor,
                                  radius: DimensionConstants.d6.r,

                                  child: TextFormField(
                                    cursorColor:
                                    ColorConstants.colorButtonbgColor,
                                    controller: _emailController,
                                    style: ViewDecoration.textFieldStyle(
                                        DimensionConstants
                                            .d16.sp),
                                    decoration: ViewDecoration.inputDecorationWithCurve(
                                        "email".tr(),
                                        prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                left: DimensionConstants
                                                    .d19
                                                    .w,
                                                top: DimensionConstants
                                                    .d19
                                                    .h,
                                                bottom: DimensionConstants
                                                    .d19
                                                    .h,
                                                right: DimensionConstants
                                                    .d9
                                                    .w),
                                            child:  ImageView(
                                              path: ImageConstants.ic_email,
                                              width: DimensionConstants.d20.w,
                                              height: DimensionConstants.d14.h,
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
                              ),
                              SizedBox(
                                height: DimensionConstants.d15.h,
                              ),
                              Container(
                                height: DimensionConstants.d52
                                    .h,
                                child: RoundCornerShape(
                                  bgColor: ColorConstants.whiteColor,
                                  radius: DimensionConstants.d6.r,
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
                                                  .d19.w
                                                  .w,
                                              top: DimensionConstants
                                                  .d16
                                                  .h,
                                              bottom: DimensionConstants
                                                  .d16
                                                  .h,
                                              right: DimensionConstants
                                                  .d8
                                                  .w),
                                          child:  ImageView(
                                            path: ImageConstants.ic_phone,
                                            height: DimensionConstants.d20.h,
                                            width: DimensionConstants.d20.w,
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
                                              .d15,
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
                              ),
                              SizedBox(
                                height: DimensionConstants.d15.h,
                              ),
                              Container(
                                height: DimensionConstants.d52.h,
                                child: RoundCornerShape(
                                  bgColor: ColorConstants.whiteColor,
                                  radius: DimensionConstants.d6.r,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    textCapitalization:
                                    TextCapitalization.sentences,
                                    cursorColor:
                                    ColorConstants.colorButtonbgColor,
                                    style: ViewDecoration.textFieldStyle(
                                        DimensionConstants
                                            .d16.sp),
                                    decoration: ViewDecoration
                                        .inputDecorationWithCurve(
                                      "confirm_password".tr(),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: DimensionConstants
                                                  .d19
                                                  .w,
                                              top: DimensionConstants
                                                  .d16
                                                  .h,
                                              bottom: DimensionConstants
                                                  .d15
                                                  .h,
                                              right: DimensionConstants
                                                  .d8
                                                  .w),
                                          child:  ImageView(
                                            path:
                                            ImageConstants.ic_password,
                                            width: DimensionConstants.d20.w,
                                            height: DimensionConstants.d20.h,
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
                                              .d15,
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
                              ),
                              SizedBox(
                                height:
                                DimensionConstants.d37.h,
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
                          Navigator.pushNamedAndRemoveUntil(context, "home_page", (Route<dynamic> route) => false);
                        },
                        child: Container(
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
                                      'sign_up'.tr(),
                                    ).buttonText(
                                        ColorConstants.whiteColor,
                                        DimensionConstants
                                            .d16.sp,
                                        TextAlign.center),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d17.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width:
                            DimensionConstants.d114.w,
                          ),
                          const Expanded(
                              child: Divider(
                                color: ColorConstants.dividerColor,
                                thickness:
                                DimensionConstants.d1,
                              )),
                          SizedBox(
                            width: DimensionConstants.d6.w,
                          ),
                          Text("or".tr()).btnText(
                              ColorConstants.colorBlack,
                              DimensionConstants.d12.sp),
                          SizedBox(
                            width: DimensionConstants.d3.w,
                          ),
                          const Expanded(
                              child: Divider(
                                color: ColorConstants.dividerColor,
                                thickness:
                                DimensionConstants.d1,
                              )),
                          SizedBox(
                            width:
                            DimensionConstants.d115.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: DimensionConstants.d17.h,
                      ),
                      Container(
                        width: DimensionConstants.d373.w,
                        height: DimensionConstants.d52.h,
                        child: RoundCornerShape(
                            bgColor: ColorConstants.fbbuttonColor,
                            radius: DimensionConstants.d6.r,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: DimensionConstants
                                        .d83.w),
                                child: Row(
                                  children: [
                                    ImageView(
                                      path: ImageConstants.ic_facebook,
                                      height: DimensionConstants
                                          .d21.h,
                                      width: DimensionConstants
                                          .d12.w,
                                    ),
                                    SizedBox(
                                      width: DimensionConstants.d15.w,
                                    ),
                                    Text(
                                      'fb_login'.tr(),
                                    ).btnText(
                                      ColorConstants.whiteColor,
                                      DimensionConstants
                                          .d16.sp,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: DimensionConstants.d19.h,
                      ),
                      SizedBox(
                        width: DimensionConstants.d373.w,
                        height: DimensionConstants.d52.h,
                        child: RoundCornerShape(
                            bgColor: Colors.white,
                            radius: DimensionConstants.d6.r,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: DimensionConstants
                                        .d81.w),
                                child: Row(
                                  children: [
                                    ImageView(
                                      path: ImageConstants.ic_google,
                                      height: DimensionConstants
                                          .d21.h,
                                      width: DimensionConstants
                                          .d21.w,
                                    ),
                                    SizedBox(
                                      width: DimensionConstants
                                          .d10.w,
                                    ),
                                    Text(
                                      'google_login'.tr(),
                                    ).btnText(
                                      ColorConstants.googleTextColor,
                                      DimensionConstants
                                          .d16.sp,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: DimensionConstants.d21.h,
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
                                DimensionConstants.d14.sp),
                            SizedBox(
                              width:
                              DimensionConstants.d3.w,
                            ),
                            Text(
                              "sign_in".tr(),
                            ).btnText(ColorConstants.colorButtonbgColor,
                                DimensionConstants.d14.sp)
                          ],
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
