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



  final _emailController = TextEditingController();

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
          backgroundColor: ColorConstants.colorbackground,
          key: _scaffoldKey,
          body: BaseView<SignUpProvider>(
            onModelReady: (provider) {},
            builder: (context, provider, _) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: DimensionConstants.d20.w),
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: DimensionConstants.d36.h,),
                            GestureDetector(onTap: (){
                              Navigator.pop(context);
                            },
                                child: const Icon(Icons.arrow_back_ios,color: ColorConstants.colorBlack,size: DimensionConstants.d20,)),
                            SizedBox(
                              height: DimensionConstants.d89.h,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "welcome_message".tr(),
                                ).mediumText(ColorConstants.headingColor, DimensionConstants.d22.sp,TextAlign.center),

                              ],
                            ) ,
                            SizedBox(
                              height: DimensionConstants.d51.h,
                            ),
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
                              height: DimensionConstants.d52.h,
                              bgColor: ColorConstants.whiteColor,
                              topRightradius: DimensionConstants.d6.r,
                              topleftradius: DimensionConstants.d6.r,
                              bottomRightradius: DimensionConstants.d6.r,
                              bottomleftradius: DimensionConstants.d6.r,
                              child: Center(
                                child: TextFormField(
                                  cursorColor:
                                  ColorConstants.colorButtonbgColor,
                                  controller: _emailController,
                                  style: ViewDecoration.textFieldStyle(
                                      DimensionConstants.d16.sp),
                                  decoration: ViewDecoration
                                      .inputDecorationWithCurve(
                                      "enter_email".tr(),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: DimensionConstants.d20.w,
                                              right: DimensionConstants.d10.w),
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
                            ),
                            SizedBox(
                              height: DimensionConstants.d37.h,
                            ),
                            GestureDetector(
                                onTap: () {
                                  if (_emailController.text == '') {
                                    DialogHelper.showMessage(
                                        context, 'Email cannot be empty');

                                  }
                                  else if (!Validations.emailValidation(_emailController.text)) {
                                    DialogHelper.showMessage(
                                        context, 'Invalid email');

                                  }
                                },
                                child: RoundCornerShape(
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
                                            'submit'.tr(),
                                          ).boldText(
                                              ColorConstants.whiteColor,
                                              DimensionConstants.d16.sp,
                                              TextAlign.center),

                                        ],

                                      ),
                                    )))
                          ]
                      )));
            },
          )),
    );
  }
}

//
