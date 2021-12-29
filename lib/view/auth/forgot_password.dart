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

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                  designSize: const Size(DimensionConstants.loginscreenwidth, DimensionConstants.loginscreenheight),
                  builder: () {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.93.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: DimensionConstants.arrowtoppadding.h,),
                            GestureDetector(onTap: (){
                              Navigator.pop(context);
                            },
                                child: Icon(Icons.arrow_back_ios,color: ColorConstants.colorBlack,size: 20,)),
                            SizedBox(
                              height: DimensionConstants.forgotpassowrdtoppadding.h,
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
                            SizedBox(
                              child: Form(

                                child: Column(
                                  children: [


                                    SizedBox(
                                      height: DimensionConstants.buttonheight,
                                      child: TextFormField(
                                        cursorColor:
                                        ColorConstants.colorButtonbgColor,
                                        controller: _emailController,
                                        style: ViewDecoration.textFieldStyle(
                                            DimensionConstants.textfieldTextSize.sp),
                                        decoration: ViewDecoration
                                            .inputDecorationWithCurve(
                                            "enter_email".tr(),
                                            prefixIcon: Padding(
                                                padding: EdgeInsets.only(left: DimensionConstants.nametextfieldleftpadding.w,top: DimensionConstants.nametextfieldtoppadding.h,
                                                    bottom: DimensionConstants.nametextfieldbottompadding.h,right: DimensionConstants.nametextfieldrightpadding.w),
                                                child: const ImageView(
                                                  path: ImageConstants.ic_email,
                                                )
                                            )
                                        ),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                        TextInputType.emailAddress,

                                      ),
                                    ),



                                    SizedBox(
                                      height: DimensionConstants.loginscreengap3.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
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
                                              'submit'.tr(),
                                            ).buttonText(
                                                ColorConstants.whiteColor,
                                                DimensionConstants.buttontextsize.sp,
                                                TextAlign.center),

                                        ],

                      ),
                    ))))
                          ]
                                          )));
                  },
                ),
              );
            },
          )),
    );
  }
}

//
