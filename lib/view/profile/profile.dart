import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:food_delivery_app/constants/color_constants.dart';
import 'package:food_delivery_app/constants/decoration.dart';
import 'package:food_delivery_app/constants/route_constants.dart';
import 'package:food_delivery_app/constants/validations.dart';
import 'package:food_delivery_app/extensions/allExtensions.dart';
import 'package:food_delivery_app/helper/keyboard_helper.dart';
import 'package:food_delivery_app/provider/signup_provider.dart';
import 'package:food_delivery_app/view/base_view.dart';
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
            backgroundColor: ColorConstants.whiteColor,
            title:
                Text('Profile').appBarText(ColorConstants.colorTextAppBar, 18),
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
                  designSize: const Size(360, 640),
                  builder: () {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 18.h),
                              child: Row(
                                children: [
                                  Container(
                                    height: 90.h,
                                    width: 90.w,
                                    child: RoundCornerShape(
                                      bgColor: ColorConstants.whiteColor,
                                      radius: 12,
                                      child:  Wrap(

                                      children: [
                                        Stack(
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          overflow: Overflow.visible,
                                          children: [
                                            Center(
                                              child: Icon(
                                                Icons.person,
                                                size: 70,
                                                color: ColorConstants.colorTextAppBar,
                                              ),
                                            )

                                            ,
                                            Positioned(
                                                top: 60,
                                                left: 70,
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
                                  SizedBox(width: 30,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Noha Osama').menuItemText(ColorConstants.colorTextAppBar, 18),
                                      SizedBox(height: 8,),
                                      Text('+201238837328').menuItemText(ColorConstants.colorTextAppBar, 16)

                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.mail,color: Colors.grey,),
                                SizedBox(width: 2,),
                                Text('Noha.haraz207@gmail.com').appBarText(ColorConstants.colorBlack, 16),
                                SizedBox(width: 2,),
                                Icon(Icons.edit,color: Colors.yellow,),

                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: profileLinks.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 3.h),
                                      child: Container(
                                        child: RoundCornerShape(
                                          radius: 4,
                                          bgColor: ColorConstants.whiteColor,
                                          child: ListTile(
                                            onTap: () {},
                                            title: Text(profileLinks[index])
                                                .menuItemText(
                                                    ColorConstants.colorBlack,
                                                    16),
                                            trailing: index == 0 ||
                                                    index == 1 ||
                                                    index == 2 ||
                                                    index == 6
                                                ? Icon(Icons.arrow_forward_ios)
                                                : index == 4
                                                    ? Text('English')
                                                        .menuItemText(
                                                        Colors.yellow,
                                                        14,
                                                      )
                                                    : index == 5
                                                        ? Text('Egypt')
                                                            .menuItemText(
                                                            Colors.yellow,
                                                            14,
                                                          )
                                                        : Transform.scale(
                                                            scale: 0.8,
                                                            child:
                                                                CupertinoSwitch(
                                                              activeColor:
                                                                  Colors.yellow,
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
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text('Logout')
                                    .menuItemText(Colors.orange, 20))
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
