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
            backgroundColor: ColorConstants.colorbackground,
            title:
            Text('Summary').btnText(ColorConstants.colorTextAppBar, DimensionConstants.d20.sp),
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
                            height: DimensionConstants.d36.h,
                          ),
                          Padding(padding: EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                          child: Container(
                            height: DimensionConstants.d70.h,
                            width: DimensionConstants.d372.w,
                            child: RoundCornerShape(
                              bgColor: ColorConstants.whiteColor,
                              radius: DimensionConstants.buttonradius.r,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: DimensionConstants.d14.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: DimensionConstants.d18.w,
                                      ),
                                      Text('Address').btnText(ColorConstants.colorBlack, DimensionConstants.d14.sp),
                                      SizedBox(
                                        width: DimensionConstants.d242.w,
                                      ),
                                      Text('Edit').btnText(ColorConstants.percentagecolor, DimensionConstants.d14.sp)

                                    ],
                                  ),
                                  SizedBox(
                                    height: DimensionConstants.d2.h,
                                  ),
                                  Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                                  child:Text('4517 Washington Ave. Manchester, Kentucky 39495').btnText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp)
                                    ,)
                                ],
                              ),
                            ),
                          ),),
                          SizedBox(
                            height: DimensionConstants.d15.h,
                          ),
                          Padding(padding: EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                            child: Container(
                              height: DimensionConstants.d70.h,
                              width: DimensionConstants.d372.w,
                              child: RoundCornerShape(
                                bgColor: ColorConstants.whiteColor,
                                radius: DimensionConstants.buttonradius.r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: DimensionConstants.d14.h,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: DimensionConstants.d18.w,
                                        ),
                                        Text('Phone Number').btnText(ColorConstants.colorBlack, DimensionConstants.d14.sp),
                                        SizedBox(
                                          width: DimensionConstants.d199.w,
                                        ),
                                        Text('Edit').btnText(ColorConstants.percentagecolor, DimensionConstants.d14.sp)

                                      ],
                                    ),
                                    SizedBox(
                                      height: DimensionConstants.d2.h,
                                    ),
                                    Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                                      child:Text('01 102 0512 02566').btnText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp)
                                      ,)
                                  ],
                                ),
                              ),
                            ),),
                          SizedBox(
                            height: DimensionConstants.d15.h,
                          ),
                          Padding(padding: EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                            child: Container(
                              height: DimensionConstants.d70.h,
                              width: DimensionConstants.d372.w,
                              child: RoundCornerShape(
                                bgColor: ColorConstants.whiteColor,
                                radius: DimensionConstants.buttonradius.r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: DimensionConstants.d14.h,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: DimensionConstants.d18.w,
                                        ),
                                        Text('Payment').btnText(ColorConstants.colorBlack, DimensionConstants.d14.sp),
                                        SizedBox(
                                          width: DimensionConstants.d237.w,
                                        ),
                                        Text('Edit').btnText(ColorConstants.percentagecolor, DimensionConstants.d14.sp)

                                      ],
                                    ),
                                    SizedBox(
                                      height: DimensionConstants.d2.h,
                                    ),
                                    Padding(padding: EdgeInsets.only(left:DimensionConstants.d18.w ),
                                      child:Text('Visa: 365-254-2415-1240').btnText(ColorConstants.colorHintTextColor, DimensionConstants.d12.sp)
                                      ,)
                                  ],
                                ),
                              ),
                            ),),





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
