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
              return SafeArea(
                child: ScreenUtilInit(
                  designSize: const Size(DimensionConstants.loginscreenwidth,DimensionConstants.loginscreenheight),
                  builder: () {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: DimensionConstants.loginhorizontalpadding.w),
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
                                ).regularText(ColorConstants.headingColor, DimensionConstants.welcomeTextSize.sp),

                              ],
                            ) ,
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
                                            DimensionConstants.textfieldTextSize.sp),
                                        decoration: ViewDecoration
                                            .inputDecorationWithCurve(
                                            "username".tr(),
                                            prefixIcon: Padding(
                                                padding: EdgeInsets.only(left: DimensionConstants.nametextfieldleftpadding.w,top: DimensionConstants.nametextfieldtoppadding.h,
                                                    bottom: DimensionConstants.nametextfieldbottompadding.h,right: DimensionConstants.nametextfieldrightpadding.w),
                                                child: ImageView(
                                                  path: ImageConstants.ic_person,



                                                )
                                            )
                                        ),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.text,

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
                                        controller: _passwordController,

                                        style: ViewDecoration.textFieldStyle(
                                            DimensionConstants.textfieldTextSize.sp),
                                        decoration: ViewDecoration
                                            .inputDecorationWithCurve(
                                          "password".tr(),
                                          prefixIcon: Padding(
                                              padding: EdgeInsets.only(left: DimensionConstants.passwordtextfieldleftpadding.w,top: DimensionConstants.passwordtextfieldtoppadding.h,
                                                  bottom: DimensionConstants.passwordtextfieldbottompadding.h,
                                                  right: DimensionConstants.passwordtextfieldrightpadding.w),
                                              child: const ImageView(
                                                path: ImageConstants.ic_password,


                                              )
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: ColorConstants.colorHintTextColor,
                                              size: DimensionConstants.eyeiconsize,
                                            ),
                                            onPressed: () {
                                              // Update the state i.e. toogle the state of passwordVisible variable
                                              setState(() {
                                                _passwordVisible = !_passwordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.text,

                                      ),
                                    ),
                                    SizedBox(
                                      height: DimensionConstants.forgotpasswordpadding.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(RoutesConstants.forgot);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [

                                            Column(
                                              children: [
                                                Text(
                                                  'forgot_password'.tr(),
                                                ).regularText(
                                                    ColorConstants.colorBlack,
                                                   DimensionConstants.noaccounttextsize.sp,
                                                    ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: DimensionConstants.loginbtntoppadding.h,
                                    ),
                                  ],
                                ),
                              ),
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
                               Navigator.pushNamedAndRemoveUntil(context, "home_page", (Route<dynamic> route) => false);

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
                                              'login'.tr(),
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
                            SizedBox(
                              height: DimensionConstants.buttongap1.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: DimensionConstants.dividerleftpadding.w,
                                ),
                                const Expanded(
                                    child: Divider(
                                      color: ColorConstants.dividerColor,
                                      thickness: DimensionConstants.dividerthickness,
                                    )),
                                SizedBox(
                                  width: DimensionConstants.dividerpadding1.w,
                                ),
                                Text(
                                    "or".tr()
                                ).btnText(ColorConstants.colorBlack, DimensionConstants.dividertextsize.sp),
                                SizedBox(
                                  width: DimensionConstants.dividerpadding2.w,
                                ),
                                const Expanded(
                                    child: Divider(
                                      color: ColorConstants.dividerColor,
                                      thickness: DimensionConstants.dividerthickness,
                                    )),
                                SizedBox(
                                  width: DimensionConstants.dividerrightpadding.w,
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
                                      padding: EdgeInsets.only(left: DimensionConstants.buttoniconpadding.w),
                                      child: Row(


                                        children: [
                                          ImageView(
                                            path: ImageConstants.ic_facebook,
                                            height: DimensionConstants.fbiconheight.h,
                                            width: DimensionConstants.fbiconwidth.w,
                                          ),
                                          SizedBox(
                                            width: DimensionConstants.icongap.w,
                                          ),
                                          Text(
                                            'fb_login'.tr(),
                                          ).btnText(
                                            ColorConstants.whiteColor,
                                            DimensionConstants.buttontextsize.sp,
                                          ),

                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(
                              height: DimensionConstants.googlebutongap.h,
                            ),
                            Container(
                              width: DimensionConstants.buttonwidth.w,
                              height: DimensionConstants.buttonheight.h,
                              child: RoundCornerShape(
                                  bgColor: Colors.white,
                                  radius: DimensionConstants.buttonradius.r,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: DimensionConstants.googleicongap.w),
                                      child: Row(

                                        children: [
                                          ImageView(
                                            path: ImageConstants.ic_google,
                                            height: DimensionConstants.googleiconheight.h,
                                            width: DimensionConstants.googleiconwidth.w,
                                          ),
                                          SizedBox(
                                            width: DimensionConstants.googletextgap.w,
                                          ),
                                          Text(
                                            'google_login'.tr(),
                                          ).btnText(
                                            ColorConstants.googleTextColor,
                                            DimensionConstants.buttontextsize.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(
                              height: DimensionConstants.noaccountsizegap.h,
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

                                  ).btnText(ColorConstants.googleTextColor, DimensionConstants.noaccounttextsize.sp),
                                  SizedBox(
                                    width: DimensionConstants.noaccounttextgap.w,
                                  ),
                                  Text(
                                    "sign_up".tr(),
                                  ).btnText(ColorConstants.colorButtonbgColor, DimensionConstants.noaccounttextsize.sp)
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
