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

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ScreenScaler? scaler;
  final _formKey = GlobalKey<FormState>();
  final fnamecontroller = TextEditingController();
  final lnamecontroller = TextEditingController();
  final agecontroller = TextEditingController();
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
              return SingleChildScrollView(
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
                        ).regularText(ColorConstants.headingColor, DimensionConstants.d22.sp),

                      ],
                    ) ,
                    SizedBox(
                      height: DimensionConstants.d51.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                      child: SizedBox(
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
                                "username".tr(),
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

                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d15.h,
                    ),

                    Padding(
                      padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                      child: SizedBox(
                        height: DimensionConstants.d52
                            .h,
                        child: RoundCornerShape(
                          bgColor: ColorConstants.whiteColor,
                          radius: DimensionConstants.d6.r,

                          child: TextFormField(
                            obscureText: !_passwordVisible,
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
                              "password".tr(),
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
                                    width: DimensionConstants.d19.w,
                                    height: DimensionConstants.d19.h,
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
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,

                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d9.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RoutesConstants.forgot);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: DimensionConstants.d20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Column(
                              children: [
                                Text(
                                  'forgot_password'.tr(),
                                ).regularText(
                                  ColorConstants.colorBlack,
                                  DimensionConstants.d14.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: DimensionConstants.d28.h,
                    ),

                    GestureDetector(
                      onTap: () {
                        if(fnamecontroller.text==''){
                          DialogHelper.showMessage(context, 'Username cannot be empty');
                          return;
                        }
                        if(_passwordController.text==''){
                          DialogHelper.showMessage(context, 'Password cannot be empty');
                          return;
                        }

                        if(_passwordController.text.length<6){
                          DialogHelper.showMessage(context, 'Password should be of atleast 6 letters');
                          return;
                        }
                        Navigator.pushNamedAndRemoveUntil(context, "dashboard", (Route<dynamic> route) => false);

                      },
                      child: Padding(
                        padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
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
                                      'login'.tr(),
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
                    SizedBox(
                      height: DimensionConstants.d17.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width:
                          DimensionConstants.d134.w,
                        ),
                        const Expanded(
                            child: Divider(
                              color: ColorConstants.dividerColor,
                              thickness: DimensionConstants.d1,
                            )),
                        SizedBox(
                          width: DimensionConstants.d6.w,
                        ),
                        Text(
                            "or".tr()
                        ).normalText(ColorConstants.colorBlack, DimensionConstants.d12.sp),
                        SizedBox(
                          width: DimensionConstants.d4.w,
                        ),
                        const Expanded(
                            child: Divider(
                              color: ColorConstants.dividerColor,
                              thickness: DimensionConstants.d1,
                            )),
                        SizedBox(
                          width:
                          DimensionConstants.d134.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: DimensionConstants.d13.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                      child: Container(
                        width: DimensionConstants.d373.w,
                        height: DimensionConstants.d52.h,
                        child: RoundCornerShape(
                            bgColor: ColorConstants.fbbuttonColor,
                            radius: DimensionConstants.d6.r,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: DimensionConstants.d83.w),
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
                                    ).normalText(
                                      ColorConstants.whiteColor,
                                      DimensionConstants.d16.sp,
                                    ),

                                  ],
                                ),
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d19.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                      child: Container(
                        width: DimensionConstants.d373.w,
                        height: DimensionConstants.d52.h,
                        child: RoundCornerShape(
                            bgColor: Colors.white,
                            radius: DimensionConstants.d6.r,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: DimensionConstants.d81.w),
                                child: Row(

                                  children: [
                                    ImageView(
                                      path: ImageConstants.ic_google,
                                      height: DimensionConstants.d21.h,
                                      width: DimensionConstants.d21.w,
                                    ),
                                    SizedBox(
                                      width: DimensionConstants.d10.w,
                                    ),
                                    Text(
                                      'google_login'.tr(),
                                    ).normalText(
                                      ColorConstants.googleTextColor,
                                      DimensionConstants.d16.sp,
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d21.h,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamedAndRemoveUntil(context, "signup", (Route<dynamic> route) => false);

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "dont_have_account".tr(),

                          ).normalText(ColorConstants.googleTextColor, DimensionConstants.d14.sp),
                          SizedBox(
                            width: DimensionConstants.d3.w,
                          ),
                          Text(
                            "sign_up".tr(),
                          ).normalText(ColorConstants.colorButtonbgColor, DimensionConstants.d14.sp)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}

//
