import 'dart:io';

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
import 'package:food_delivery_app/widgets/bottom_bar_Container_shape.dart';
import 'package:food_delivery_app/widgets/image_view.dart';
import 'package:food_delivery_app/widgets/roundCornerShape.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List profileLinks = [
    'Account Info',
    "Saved Address",
    "History",
    "Notifications",
    "Language",
    "Country",
    "Settings"
  ];
  bool status = false;
  List navigationitems = ['Home', 'WishList', 'Home', 'Cart', 'Profile'];
  List navigationicons = [
    ImageConstants.ic_home,
    ImageConstants.ic_favorite,
    ImageConstants.ic_dashboard,
    ImageConstants.ic_cart,
    ImageConstants.ic_profile
  ];
  int ind = 4;

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
                Text('Profile').appBarText(ColorConstants.colorTextAppBar,DimensionConstants.d20.sp ),

            centerTitle: true,
          ),

          backgroundColor: ColorConstants.colorbackground,
          key: _scaffoldKey,
          body: BaseView<SignUpProvider>(
            onModelReady: (provider) {

            },
            builder: (context, provider, _) {
              return  SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: DimensionConstants.d18.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only( left: DimensionConstants.d20.w,
                          right: DimensionConstants.d20.w),
                      child: Row(
                        children: [
                          Container(
                            height: DimensionConstants.d103.h,
                            width: DimensionConstants.d94.w,
                            child: RoundCornerShape(
                              bgColor: ColorConstants.whiteColor,
                              radius: DimensionConstants.d12.r,
                              child:  Wrap(

                                children: [
                                  Stack(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    overflow: Overflow.visible,
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.person,
                                          size: DimensionConstants.d86.sp,
                                          color: ColorConstants.colorTextAppBar,
                                        ),
                                      )

                                      ,
                                      Positioned(
                                          top: DimensionConstants.d54.h,
                                          left: DimensionConstants.d79.w,
                                          child: GestureDetector(

                                              child: Icon(
                                                Icons.camera_alt,
                                                color: ColorConstants
                                                    .colorButtonbgColor,
                                              )))
                                    ],
                                  ),
                                ],
                              ),

                            ),
                          ),
                          SizedBox(width: DimensionConstants.d20.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Noha Osama').btnText(ColorConstants.colorBlack, DimensionConstants.d16.sp),
                              SizedBox(height: DimensionConstants.d8.h,),
                              Text('+201238837328').menuItemText(ColorConstants.colorBlack, DimensionConstants.d14.sp)

                            ],
                          )
                        ],
                      ),),
                    SizedBox(
                      height: DimensionConstants.d15.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.only( left: DimensionConstants.d20.w,
                          right: DimensionConstants.d20.w),
                      child: Row(
                        children: [
                          Icon(Icons.mail,color: Colors.grey,),
                          SizedBox(width: DimensionConstants.d4.w,),
                          Text('Noha.haraz207@gmail.com').btnText(ColorConstants.colorBlack, DimensionConstants.d15.sp),
                          SizedBox(width: DimensionConstants.d4.w,),
                          Icon(Icons.edit,color: ColorConstants.colorButtonbgColor,),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d15.h,
                    ),
                    Padding(
                      padding:EdgeInsets.only( left: DimensionConstants.d20.w,
                        right: DimensionConstants.d20.w),
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: profileLinks.length,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  height: DimensionConstants.d52.h,
                                  width: DimensionConstants.d372.w,
                                  child: RoundCornerShape(
                                      bgColor: ColorConstants.whiteColor,
                                      radius: DimensionConstants.d6.r,
                                      child: Padding(
                                          padding:  EdgeInsets.only(bottom: DimensionConstants.d13.h,top: DimensionConstants.d13.h),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: DimensionConstants.d15.w,
                                              ),
                                              Text(profileLinks[index]).btnText(ColorConstants.colorBlack, DimensionConstants.d16.sp),
                                              Spacer(),
                                              index == 0 ||
                                                  index == 1 ||
                                                  index == 2 ||
                                                  index == 6
                                                  ? Icon(Icons.arrow_forward_ios,color: ColorConstants.colorHintTextColor,size: DimensionConstants.d20.sp,)
                                                  : index == 4
                                                  ? Text('English')
                                                  .btnText(
                                                ColorConstants.colorButtonbgColor,
                                                DimensionConstants.d14.sp,
                                              )
                                                  : index == 5
                                                  ? Text('Egypt')
                                                  .btnText(
                                                ColorConstants.colorButtonbgColor,
                                                DimensionConstants.d14.sp,
                                              )
                                                  : Transform.scale(
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
                                                width: DimensionConstants.d10.w,
                                              )

                                            ],
                                          )
                                      )
                                  ),
                                ),
                                SizedBox(
                                  height: DimensionConstants.d15.h,
                                ),
                              ],
                            );
                          }),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: DimensionConstants.d21.w,right: DimensionConstants.d21.w,bottom: DimensionConstants.d25.h),
                      child: GestureDetector(
                        onTap: (){
                          DialogHelper.showDialogWithTwoButtons(context, 'Logout', 'Yes', 'Cancel', 'Are you sure you want to Logout?',
                              positiveButtonPress: (){
                                Navigator.pushNamedAndRemoveUntil(context, "login", (Route<dynamic> route) => false);
                              }, negativeButtonPress: () {
                                Navigator.pop(context);
                              });
                        },
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
                                      'Logout',
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

                  ],
                ),

              );
            },
          )),
    );
  }

}

//
