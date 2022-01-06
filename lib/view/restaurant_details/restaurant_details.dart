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
import 'package:food_delivery_app/widgets/list_view.dart';
import 'package:food_delivery_app/widgets/roundCornerShape.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class RestaurantDetails extends StatefulWidget {
  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  List menuitems = [
    'Soup',
    'Pizza',
    'Burger',
    'Drinks',
    'Soup',
    'Pizza',
    'Burger',
    'Drinks'
  ];
  int menuindex = 0;
  List<int> count = [1, 1];
  List<int> counter = [1, 1];
  int bottomcounter = 0;

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
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: DimensionConstants.d20.w,
                      right: DimensionConstants.d20.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: DimensionConstants.d25.h,
                      ),
                      Stack(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        overflow: Overflow.visible,
                        children: [
                          RoundCornerShape(
                            height: DimensionConstants.d182.h,
                            width: DimensionConstants.d372.w,
                            topRightradius: DimensionConstants.d6.r,
                            topleftradius: DimensionConstants.d6.r,
                            bottomRightradius: DimensionConstants.d6.r,
                            bottomleftradius: DimensionConstants.d6.r,
                            bgColor: ColorConstants.whiteColor,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  DimensionConstants.d6.r),
                              child: ImageView(
                                path: ImageConstants.ic_restaurant_promo,
                                height: DimensionConstants.d182.h,
                                width: DimensionConstants.d372.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: DimensionConstants.d158.h,
                            left: DimensionConstants.d18.w,
                            right: DimensionConstants.d17.w,
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(
                                  DimensionConstants.d10.r),
                              child: RoundCornerShape(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 12,
                                      color: ColorConstants.borderColor,
                                    )
                                  ]),
                                  height: DimensionConstants.d89.h,
                                  width: DimensionConstants.d338.w,
                                  bgColor: ColorConstants.whiteColor,
                                  topRightradius: DimensionConstants.d10.r,
                                  topleftradius: DimensionConstants.d10.r,
                                  bottomRightradius: DimensionConstants.d10.r,
                                  bottomleftradius: DimensionConstants.d10.r,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: DimensionConstants.d16.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d9.w,
                                            right: DimensionConstants.d8.w),
                                        child: Row(
                                          children: [
                                            Text('Arabiata restaurant')
                                                .mediumText(
                                                    ColorConstants.colorBlack,
                                                    DimensionConstants.d15.sp,
                                                    TextAlign.center),
                                            SizedBox(
                                              width: DimensionConstants.d102.w,
                                            ),
                                            ImageView(
                                              path: ImageConstants.ic_map,
                                              height: DimensionConstants.d13.h,
                                              width: DimensionConstants.d11.w,
                                            ),
                                            Text('Assuit City ').mediumText(
                                                ColorConstants
                                                    .colorHintTextColor,
                                                DimensionConstants.d12.sp,
                                                TextAlign.center)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d19.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d9.w,
                                            right: DimensionConstants.d9.w),
                                        child: Row(
                                          children: [
                                            ImageView(
                                              path: ImageConstants.ic_star,
                                              height: DimensionConstants.d14.h,
                                              width: DimensionConstants.d15.w,
                                            ),
                                            SizedBox(
                                              width: DimensionConstants.d5.w,
                                            ),
                                            Text('4.5(234)').mediumText(
                                                ColorConstants.blackcolor,
                                                DimensionConstants.d14.sp,
                                                TextAlign.center),
                                            SizedBox(
                                              width: DimensionConstants.d18.w,
                                            ),
                                            ImageView(
                                              path: ImageConstants.ic_delivery,
                                              height: DimensionConstants.d22.h,
                                              width: DimensionConstants.d22.w,
                                            ),
                                            SizedBox(
                                              width: DimensionConstants.d7.w,
                                            ),
                                            Text('20 mins, 10 EGP').mediumText(
                                                ColorConstants.colorBlack,
                                                DimensionConstants.d13.sp,
                                                TextAlign.center),
                                            SizedBox(
                                              width: DimensionConstants.d15.w,
                                            ),
                                            Text('20 miles away').mediumText(
                                                ColorConstants
                                                    .colorButtonbgColor,
                                                DimensionConstants.d13.sp,
                                                TextAlign.center)
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: DimensionConstants.d86.h,
                      ),
                      Text('Menu').mediumText(ColorConstants.colorBlack,
                          DimensionConstants.d16.sp, TextAlign.center),
                      SizedBox(
                        height: DimensionConstants.d10.h,
                      ),
                      Container(
                        height: DimensionConstants.d38.h,
                        child: Listview(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: menuitems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: DimensionConstants.d2.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            menuindex = index;
                                          });
                                        },
                                        child: Material(
                                          elevation: 3,
                                          borderRadius: BorderRadius.circular(
                                              DimensionConstants.d6.r),
                                          child: RoundCornerShape(
                                              height: DimensionConstants.d32.h,
                                              width: DimensionConstants.d79.w,
                                              bgColor: menuindex == index
                                                  ? ColorConstants
                                                      .colorButtonbgColor
                                                  : ColorConstants.whiteColor,
                                              topRightradius:
                                                  DimensionConstants.d6.r,
                                              topleftradius:
                                                  DimensionConstants.d6.r,
                                              bottomRightradius:
                                                  DimensionConstants.d6.r,
                                              bottomleftradius:
                                                  DimensionConstants.d6.r,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: DimensionConstants
                                                            .d8.h,
                                                        left: DimensionConstants
                                                            .d20.w,
                                                        bottom:
                                                            DimensionConstants
                                                                .d8.h,
                                                        right:
                                                            DimensionConstants
                                                                .d20.w),
                                                    child: Text(
                                                            menuitems[index])
                                                        .mediumText(
                                                            menuindex == index
                                                                ? ColorConstants
                                                                    .whiteColor
                                                                : ColorConstants
                                                                    .blackcolor,
                                                            DimensionConstants
                                                                .d12.sp,
                                                            TextAlign.center),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: DimensionConstants.d8.w,
                                      )
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ),
                      /*Flexible(
                    flex: 1,
                    child: Container(
                      height: 400,
                      child: ScrollableListTabView(
                        tabHeight: 48,
                        bodyAnimationDuration: const Duration(milliseconds: 150),
                        tabAnimationCurve: Curves.easeOut,
                        tabAnimationDuration: const Duration(milliseconds: 200),
                        tabs: [
                          ScrollableListTab(
                              tab: ListTab(
                                  label: Text('Label 1'),
                                  icon: Icon(Icons.group),
                                  showIconOnList: false),
                              body: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (_, index) => ListTile(
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: Colors.grey),
                                    alignment: Alignment.center,
                                    child: Text(index.toString()),
                                  ),
                                  title: Text('List element $index'),
                                ),
                              )),
                          ScrollableListTab(
                              tab: ListTab(label: Text('Label 2'), icon: Icon(Icons.subject)),
                              body: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (_, index) => Card(
                                  child: Center(child: Text('Card element $index')),
                                ),
                              )),
                          ScrollableListTab(
                              tab: ListTab(
                                  label: Text('Label 3'),
                                  icon: Icon(Icons.subject),
                                  showIconOnList: true),
                              body: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (_, index) => Card(
                                  child: Center(child: Text('Card element $index')),
                                ),
                              )),
                          ScrollableListTab(
                              tab: ListTab(label: Text('Label 4'), icon: Icon(Icons.add)),
                              body: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (_, index) => ListTile(
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: Colors.grey),
                                    alignment: Alignment.center,
                                    child: Text(index.toString()),
                                  ),
                                  title: Text('List element $index'),
                                ),
                              )),
                          ScrollableListTab(
                              tab: ListTab(label: Text('Label 5'), icon: Icon(Icons.group)),
                              body: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (_, index) => ListTile(
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: Colors.grey),
                                    alignment: Alignment.center,
                                    child: Text(index.toString()),
                                  ),
                                  title: Text('List element $index'),
                                ),
                              )),
                          ScrollableListTab(
                              tab: ListTab(label: Text('Label 6'), icon: Icon(Icons.subject)),
                              body: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (_, index) => Card(
                                  child: Center(child: Text('Card element $index')),
                                ),
                              )),
                          ScrollableListTab(
                              tab: ListTab(
                                  label: Text('Label 7'),
                                  icon: Icon(Icons.subject),
                                  showIconOnList: true),
                              body: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (_, index) => Card(
                                  child: Center(child: Text('Card element $index')),
                                ),
                              )),
                          ScrollableListTab(
                              tab: ListTab(label: Text('Label 8'), icon: Icon(Icons.add)),
                              body: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (_, index) => ListTile(
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: Colors.grey),
                                    alignment: Alignment.center,
                                    child: Text(index.toString()),
                                  ),
                                  title: Text('List element $index'),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),*/

                      SizedBox(
                        height: DimensionConstants.d12.h,
                      ),
                      Text('Soup').mediumText(ColorConstants.colorBlack,
                          DimensionConstants.d16.sp, TextAlign.center),
                      SizedBox(
                        height: DimensionConstants.d11.h,
                      ),
                      Listview(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    openModalSheet();
                                  },
                                  child: RoundCornerShape(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0.0, 0.75),
                                          blurRadius: 12,
                                          color: ColorConstants.borderColor,
                                        )
                                      ]),
                                      height: DimensionConstants.d138.h,
                                      width: DimensionConstants.d372.w,
                                      bgColor: ColorConstants.whiteColor,
                                      topRightradius: DimensionConstants.d6.r,
                                      topleftradius: DimensionConstants.d6.r,
                                      bottomRightradius:
                                          DimensionConstants.d6.r,
                                      bottomleftradius: DimensionConstants.d6.r,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d10.w,
                                            right: DimensionConstants.d10.w),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: DimensionConstants
                                                          .d11.h,
                                                    ),
                                                    Text('Chicken Zinger')
                                                        .mediumText(
                                                            ColorConstants
                                                                .colorBlack,
                                                            DimensionConstants
                                                                .d16.sp,
                                                            TextAlign.center),
                                                    SizedBox(
                                                      height: DimensionConstants
                                                          .d5.h,
                                                    ),
                                                    Text('Spicy & crispy with garlic')
                                                        .mediumText(
                                                            ColorConstants
                                                                .cartTextcolor,
                                                            DimensionConstants
                                                                .d14.sp,
                                                            TextAlign.center),
                                                    SizedBox(
                                                      height: DimensionConstants
                                                          .d9.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        ImageView(
                                                          path: ImageConstants
                                                              .ic_fire,
                                                          height:
                                                              DimensionConstants
                                                                  .d16.h,
                                                          width:
                                                              DimensionConstants
                                                                  .d16.w,
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              DimensionConstants
                                                                  .d4.w,
                                                        ),
                                                        Text('195Cal').mediumText(
                                                            ColorConstants
                                                                .colorBlack,
                                                            DimensionConstants
                                                                .d14.sp,
                                                            TextAlign.center),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: DimensionConstants
                                                          .d10.h,
                                                    ),
                                                    Text('7999 EGP').mediumText(
                                                        ColorConstants
                                                            .colorHintTextColor,
                                                        DimensionConstants
                                                            .d12.sp,
                                                        TextAlign.center,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough)
                                                  ],
                                                ),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d86.w,
                                                ),
                                                ImageView(
                                                  path: ImageConstants
                                                      .ic_cart_burger,
                                                  height:
                                                      DimensionConstants.d94.h,
                                                  width:
                                                      DimensionConstants.d103.w,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: DimensionConstants.d1.h,
                                            ),
                                            Row(
                                              children: [
                                                Text('7999 EGP').mediumText(
                                                    ColorConstants
                                                        .colorButtonbgColor,
                                                    DimensionConstants.d16.sp,
                                                    TextAlign.center),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d12.w,
                                                ),
                                                ImageView(
                                                  path: ImageConstants.ic_star,
                                                  height:
                                                      DimensionConstants.d14.h,
                                                  width:
                                                      DimensionConstants.d15.w,
                                                ),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d5.w,
                                                ),
                                                Text('4.5').mediumText(
                                                    ColorConstants.blackcolor,
                                                    DimensionConstants.d15.sp,
                                                    TextAlign.center),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d134.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (count[index] > 0) {
                                                      count[index]--;
                                                      setState(() {
                                                        count[index] =
                                                            count[index];
                                                      });
                                                    }
                                                  },
                                                  child: RoundCornerShape(
                                                    height: DimensionConstants
                                                        .d30.h,
                                                    width: DimensionConstants
                                                        .d30.w,
                                                    decoration: const BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            offset: Offset(
                                                                0.0, 0.75),
                                                            blurRadius: 12,
                                                            color: ColorConstants
                                                                .borderColor,
                                                          )
                                                        ]),
                                                    bgColor: ColorConstants
                                                        .whiteColor,
                                                    strokeColor: ColorConstants
                                                        .strokecolor,
                                                    topRightradius:
                                                        DimensionConstants.d6.r,
                                                    topleftradius:
                                                        DimensionConstants.d6.r,
                                                    bottomRightradius:
                                                        DimensionConstants.d6.r,
                                                    bottomleftradius:
                                                        DimensionConstants.d6.r,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left:
                                                              DimensionConstants
                                                                  .d8.w,
                                                          right:
                                                              DimensionConstants
                                                                  .d8.w),
                                                      child: ImageView(
                                                        path: ImageConstants
                                                            .ic_minus,
                                                        height:
                                                            DimensionConstants
                                                                .d3.h,
                                                        width:
                                                            DimensionConstants
                                                                .d12.w,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d10.w,
                                                ),
                                                Text(count[index].toString())
                                                    .boldText(
                                                        ColorConstants
                                                            .darkblackcolor,
                                                        DimensionConstants
                                                            .d16.sp,
                                                        TextAlign.center),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d10.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    count[index]++;
                                                    setState(() {
                                                      count[index] =
                                                          count[index];
                                                    });
                                                  },
                                                  child: RoundCornerShape(
                                                    height: DimensionConstants
                                                        .d30.h,
                                                    width: DimensionConstants
                                                        .d30.w,
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            offset: Offset(
                                                                0.0, 0.75),
                                                            blurRadius: 12,
                                                            color: ColorConstants
                                                                .borderColor,
                                                          )
                                                        ]),
                                                    bgColor: ColorConstants
                                                        .whiteColor,
                                                    strokeColor: ColorConstants
                                                        .strokecolor,
                                                    topRightradius:
                                                        DimensionConstants.d6.r,
                                                    topleftradius:
                                                        DimensionConstants.d6.r,
                                                    bottomRightradius:
                                                        DimensionConstants.d6.r,
                                                    bottomleftradius:
                                                        DimensionConstants.d6.r,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left:
                                                              DimensionConstants
                                                                  .d9.w,
                                                          right:
                                                              DimensionConstants
                                                                  .d9.w),
                                                      child: ImageView(
                                                        path: ImageConstants
                                                            .ic_add,
                                                        height:
                                                            DimensionConstants
                                                                .d11.h,
                                                        width:
                                                            DimensionConstants
                                                                .d11.w,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: DimensionConstants.d20.h,
                                )
                              ],
                            );
                          }),
                      Text('Pizza').mediumText(ColorConstants.colorBlack,
                          DimensionConstants.d16.sp, TextAlign.center),
                      SizedBox(
                        height: DimensionConstants.d11.h,
                      ),
                      Listview(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    openModalSheet();
                                  },
                                  child: RoundCornerShape(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0.0, 0.75),
                                          blurRadius: 12,
                                          color: ColorConstants.borderColor,
                                        )
                                      ]),
                                      height: DimensionConstants.d138.h,
                                      width: DimensionConstants.d372.w,
                                      bgColor: ColorConstants.whiteColor,
                                      topRightradius: DimensionConstants.d6.r,
                                      topleftradius: DimensionConstants.d6.r,
                                      bottomRightradius:
                                          DimensionConstants.d6.r,
                                      bottomleftradius: DimensionConstants.d6.r,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d10.w,
                                            right: DimensionConstants.d10.w),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: DimensionConstants
                                                          .d11.h,
                                                    ),
                                                    Text('Chicken Zinger')
                                                        .mediumText(
                                                            ColorConstants
                                                                .colorBlack,
                                                            DimensionConstants
                                                                .d16.sp,
                                                            TextAlign.center),
                                                    SizedBox(
                                                      height: DimensionConstants
                                                          .d5.h,
                                                    ),
                                                    Text('Spicy & crispy with garlic')
                                                        .mediumText(
                                                            ColorConstants
                                                                .cartTextcolor,
                                                            DimensionConstants
                                                                .d14.sp,
                                                            TextAlign.center),
                                                    SizedBox(
                                                      height: DimensionConstants
                                                          .d9.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        ImageView(
                                                          path: ImageConstants
                                                              .ic_fire,
                                                          height:
                                                              DimensionConstants
                                                                  .d16.h,
                                                          width:
                                                              DimensionConstants
                                                                  .d16.w,
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              DimensionConstants
                                                                  .d4.w,
                                                        ),
                                                        Text('195Cal').mediumText(
                                                            ColorConstants
                                                                .colorBlack,
                                                            DimensionConstants
                                                                .d14.sp,
                                                            TextAlign.center),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: DimensionConstants
                                                          .d10.h,
                                                    ),
                                                    Text('7999 EGP').mediumText(
                                                      ColorConstants
                                                          .colorHintTextColor,
                                                      DimensionConstants.d12.sp,
                                                      TextAlign.center,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d86.w,
                                                ),
                                                ImageView(
                                                  path: ImageConstants
                                                      .ic_cart_burger,
                                                  height:
                                                      DimensionConstants.d94.h,
                                                  width:
                                                      DimensionConstants.d103.w,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: DimensionConstants.d1.h,
                                            ),
                                            Row(
                                              children: [
                                                Text('7999 EGP').mediumText(
                                                    ColorConstants
                                                        .colorButtonbgColor,
                                                    DimensionConstants.d16.sp,
                                                    TextAlign.center),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d12.w,
                                                ),
                                                ImageView(
                                                  path: ImageConstants.ic_star,
                                                  height:
                                                      DimensionConstants.d14.h,
                                                  width:
                                                      DimensionConstants.d15.w,
                                                ),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d3.w,
                                                ),
                                                Text('4.5').mediumText(
                                                    ColorConstants.blackcolor,
                                                    DimensionConstants.d15.sp,
                                                    TextAlign.center),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d134.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (counter[index] > 0) {
                                                      counter[index]--;
                                                      setState(() {
                                                        counter[index] =
                                                            counter[index];
                                                      });
                                                    }

                                                    print(count);
                                                  },
                                                  child: Container(
                                                    height: DimensionConstants
                                                        .d30.h,
                                                    width: DimensionConstants
                                                        .d30.w,
                                                    child: RoundCornerShape(
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              offset: Offset(
                                                                  0.0, 0.75),
                                                              blurRadius: 12,
                                                              color: ColorConstants
                                                                  .borderColor,
                                                            )
                                                          ]),
                                                      height: DimensionConstants
                                                          .d30.h,
                                                      width: DimensionConstants
                                                          .d30.w,
                                                      bgColor: ColorConstants
                                                          .whiteColor,
                                                      strokeColor:
                                                          ColorConstants
                                                              .strokecolor,
                                                      topRightradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      topleftradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      bottomRightradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      bottomleftradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            left:
                                                                DimensionConstants
                                                                    .d8.w,
                                                            right:
                                                                DimensionConstants
                                                                    .d8.w),
                                                        child: ImageView(
                                                          path: ImageConstants
                                                              .ic_minus,
                                                          height:
                                                              DimensionConstants
                                                                  .d3.h,
                                                          width:
                                                              DimensionConstants
                                                                  .d12.w,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d10.w,
                                                ),
                                                Text(counter[index].toString())
                                                    .boldText(
                                                        ColorConstants
                                                            .darkblackcolor,
                                                        DimensionConstants
                                                            .d16.sp,
                                                        TextAlign.center),
                                                SizedBox(
                                                  width:
                                                      DimensionConstants.d10.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    counter[index]++;
                                                    setState(() {
                                                      counter[index] =
                                                          counter[index];
                                                    });
                                                  },
                                                  child: Container(
                                                    child: RoundCornerShape(
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              offset: Offset(
                                                                  0.0, 0.75),
                                                              blurRadius: 12,
                                                              color: ColorConstants
                                                                  .borderColor,
                                                            )
                                                          ]),
                                                      height: DimensionConstants
                                                          .d30.h,
                                                      width: DimensionConstants
                                                          .d30.w,
                                                      bgColor: ColorConstants
                                                          .whiteColor,
                                                      strokeColor:
                                                          ColorConstants
                                                              .strokecolor,
                                                      topRightradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      topleftradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      bottomRightradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      bottomleftradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            left:
                                                                DimensionConstants
                                                                    .d9.w,
                                                            right:
                                                                DimensionConstants
                                                                    .d9.w),
                                                        child: ImageView(
                                                          path: ImageConstants
                                                              .ic_add,
                                                          height:
                                                              DimensionConstants
                                                                  .d11.h,
                                                          width:
                                                              DimensionConstants
                                                                  .d11.w,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: DimensionConstants.d20.h,
                                )
                              ],
                            );
                          })
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }

  void openModalSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: ColorConstants.colorbackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(DimensionConstants.d15.r),
              topRight: Radius.circular(DimensionConstants.d15.r)),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.8,
                // half screen on load
                maxChildSize: 1,
                // full screen on scroll
                minChildSize: 0.7,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RoundCornerShape(
                          height: DimensionConstants.d182.h,
                          width: MediaQuery.of(context).size.width,
                          topRightradius: DimensionConstants.d15.r,
                          topleftradius: DimensionConstants.d15.r,
                          bottomleftradius: 0,
                          bottomRightradius: 0,
                          bgColor: ColorConstants.whiteColor,
                          child: ImageView(
                            path: ImageConstants.ic_cart_burger,
                            height: DimensionConstants.d182.h,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: DimensionConstants.d20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: DimensionConstants.d20.w,
                              right: DimensionConstants.d20.w,bottom: DimensionConstants.d24.h),
                          child: Column(
                            children: [
                              Text('Chicken Zinger').mediumText(
                                  ColorConstants.colorBlack,
                                  DimensionConstants.d22.sp,
                                  TextAlign.center),
                              SizedBox(
                                height: DimensionConstants.d13.h,
                              ),
                              Text('7999 EGP').mediumText(
                                  ColorConstants.colorButtonbgColor,
                                  DimensionConstants.d18.sp,
                                  TextAlign.center),
                              SizedBox(
                                height: DimensionConstants.d7.h,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (bottomcounter > 0) {
                                        bottomcounter--;
                                        setState(() {
                                          bottomcounter = bottomcounter;
                                        });
                                      }
                                    },
                                    child: RoundCornerShape(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0.0, 0.75),
                                          blurRadius: 12,
                                          color: ColorConstants.borderColor,
                                        )
                                      ]),
                                      height: DimensionConstants.d40.h,
                                      width: DimensionConstants.d40.w,
                                      bgColor: ColorConstants.whiteColor,
                                      strokeColor: ColorConstants.strokecolor,
                                      topRightradius: DimensionConstants.d6.r,
                                      topleftradius: DimensionConstants.d6.r,
                                      bottomRightradius:
                                          DimensionConstants.d6.r,
                                      bottomleftradius: DimensionConstants.d6.r,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d12.w,
                                            right: DimensionConstants.d12.w),
                                        child: ImageView(
                                          path: ImageConstants.ic_minus,
                                          height: DimensionConstants.d3.h,
                                          width: DimensionConstants.d17.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: DimensionConstants.d20.w,
                                  ),
                                  Text(bottomcounter.toString()).boldText(
                                      ColorConstants.darkblackcolor,
                                      DimensionConstants.d16.sp,
                                      TextAlign.center),
                                  SizedBox(
                                    width: DimensionConstants.d20.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      bottomcounter++;
                                      setState(() {
                                        bottomcounter = bottomcounter;
                                      });
                                    },
                                    child: RoundCornerShape(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0.0, 0.75),
                                          blurRadius: 12,
                                          color: ColorConstants.borderColor,
                                        )
                                      ]),
                                      height: DimensionConstants.d40.h,
                                      width: DimensionConstants.d40.w,
                                      bgColor: ColorConstants.whiteColor,
                                      strokeColor: ColorConstants.strokecolor,
                                      topRightradius: DimensionConstants.d6.r,
                                      topleftradius: DimensionConstants.d6.r,
                                      bottomRightradius:
                                          DimensionConstants.d6.r,
                                      bottomleftradius: DimensionConstants.d6.r,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: DimensionConstants.d12.w,
                                            right: DimensionConstants.d12.w),
                                        child: ImageView(
                                          path: ImageConstants.ic_add,
                                          height: DimensionConstants.d15.h,
                                          width: DimensionConstants.d15.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: DimensionConstants.d20.h,
                              ),
                              RoundCornerShape(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0.0, 0.75),
                                    blurRadius: 12,
                                    color: ColorConstants.borderColor,
                                  )
                                ]),
                                height: DimensionConstants.d468.h,
                                width: DimensionConstants.d372.w,
                                topRightradius: DimensionConstants.d6.r,
                                topleftradius: DimensionConstants.d6.r,
                                bottomRightradius: DimensionConstants.d6.r,
                                bottomleftradius: DimensionConstants.d6.r,
                                bgColor: ColorConstants.whiteColor,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: DimensionConstants.d15.w,
                                      right: DimensionConstants.d15.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: DimensionConstants.d19.h,
                                      ),
                                      Text('Details').mediumText(
                                          ColorConstants.colorBlack,
                                          DimensionConstants.d18.sp,
                                          TextAlign.center),
                                      SizedBox(
                                        height: DimensionConstants.d2.h,
                                      ),
                                      Text('Spicy & crispy with garlic')
                                          .mediumText(
                                              ColorConstants.colorBlack,
                                              DimensionConstants.d14.sp,
                                              TextAlign.center),
                                      SizedBox(
                                        height: DimensionConstants.d8.h,
                                      ),
                                      Text('Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.')
                                          .mediumText(
                                              ColorConstants.detailsTextcolor,
                                              DimensionConstants.d12.sp,
                                              TextAlign.left,
                                              maxLines: 4),
                                      SizedBox(
                                        height: DimensionConstants.d11.h,
                                      ),
                                      Row(
                                        children: [
                                          ImageView(
                                            path: ImageConstants.ic_fire,
                                            height: DimensionConstants.d18.h,
                                            width: DimensionConstants.d18.w,
                                          ),
                                          SizedBox(
                                            width: DimensionConstants.d2.w,
                                          ),
                                          Text('195Cal').mediumText(
                                              ColorConstants.colorBlack,
                                              DimensionConstants.d14.sp,
                                              TextAlign.center)
                                        ],
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d17.h,
                                      ),
                                      Row(
                                        children: [
                                          ImageView(
                                            path: ImageConstants.ic_star,
                                            height: DimensionConstants.d14.h,
                                            width: DimensionConstants.d16.w,
                                          ),
                                          SizedBox(
                                            width: DimensionConstants.d6.w,
                                          ),
                                          Text('4.5(234)').mediumText(
                                              ColorConstants.blackcolor,
                                              DimensionConstants.d14.sp,
                                              TextAlign.center),
                                          SizedBox(
                                            width: DimensionConstants.d134.w,
                                          ),
                                          ImageView(
                                            path: ImageConstants.ic_delivery,
                                            height: DimensionConstants.d22.h,
                                            width: DimensionConstants.d22.w,
                                          ),
                                          SizedBox(
                                            width: DimensionConstants.d8.w,
                                          ),
                                          Text('20 mins, 10 EGP').mediumText(
                                              ColorConstants.colorBlack,
                                              DimensionConstants.d13.sp,
                                              TextAlign.center),
                                        ],
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d15.h,
                                      ),
                                      Container(
                                        height: DimensionConstants.d1.h,
                                        width: DimensionConstants.d338.w,
                                        color: ColorConstants.gray,
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d12.h,
                                      ),
                                      Text('Extras').mediumText(
                                          ColorConstants.colorBlack,
                                          DimensionConstants.d18.sp,
                                          TextAlign.center),
                                      SizedBox(
                                        height: DimensionConstants.d12.h,
                                      ),
                                      Listview(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          physics: ClampingScrollPhysics(),
                                          itemCount: 2,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    ImageView(
                                                      path: ImageConstants
                                                          .ic_sprite,
                                                      width: DimensionConstants
                                                          .d30.w,
                                                      height: DimensionConstants
                                                          .d54.h,
                                                    ),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d14.w,
                                                    ),
                                                    Text('Sprite').mediumText(
                                                        ColorConstants
                                                            .colorBlack,
                                                        DimensionConstants
                                                            .d18.sp,
                                                        TextAlign.center),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d5.w,
                                                    ),
                                                    Container(
                                                      height: DimensionConstants
                                                          .d1.h,
                                                      width: DimensionConstants
                                                          .d52.w,
                                                      color: ColorConstants
                                                          .colorHintTextColor,
                                                    ),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d5.w,
                                                    ),
                                                    Text('5 EGP').mediumText(
                                                        ColorConstants
                                                            .colorBlack,
                                                        DimensionConstants
                                                            .d18.sp,
                                                        TextAlign.center),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d32.w,
                                                    ),
                                                    RoundCornerShape(
                                                      decoration: const BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              offset: Offset(
                                                                  0.0, 0.75),
                                                              blurRadius: 12,
                                                              color: ColorConstants
                                                                  .borderColor,
                                                            )
                                                          ]),
                                                      height: DimensionConstants
                                                          .d30.h,
                                                      width: DimensionConstants
                                                          .d30.w,
                                                      bgColor: ColorConstants
                                                          .whiteColor,
                                                      strokeColor:
                                                          ColorConstants
                                                              .strokecolor,
                                                      topRightradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      topleftradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      bottomRightradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      bottomleftradius:
                                                          DimensionConstants
                                                              .d6.r,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            left:
                                                                DimensionConstants
                                                                    .d9.w,
                                                            right:
                                                                DimensionConstants
                                                                    .d9.w),
                                                        child: ImageView(
                                                          path: ImageConstants
                                                              .ic_minus,
                                                          height:
                                                              DimensionConstants
                                                                  .d2.h,
                                                          width:
                                                              DimensionConstants
                                                                  .d13.w,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d15.w,
                                                    ),
                                                    Text('1')
                                                        .boldText(
                                                            ColorConstants
                                                                .darkblackcolor,
                                                            DimensionConstants
                                                                .d16.sp,
                                                            TextAlign.center),
                                                    SizedBox(
                                                      width: DimensionConstants
                                                          .d15.w,
                                                    ),
                                                    Container(
                                                      child: RoundCornerShape(
                                                        decoration:
                                                            const BoxDecoration(
                                                                boxShadow: [
                                                              BoxShadow(
                                                                offset: Offset(
                                                                    0.0, 0.75),
                                                                blurRadius: 12,
                                                                color: ColorConstants
                                                                    .borderColor,
                                                              )
                                                            ]),
                                                        height:
                                                            DimensionConstants
                                                                .d30.h,
                                                        width:
                                                            DimensionConstants
                                                                .d30.w,
                                                        bgColor: ColorConstants
                                                            .whiteColor,
                                                        strokeColor:
                                                            ColorConstants
                                                                .strokecolor,
                                                        topRightradius:
                                                            DimensionConstants
                                                                .d6.r,
                                                        topleftradius:
                                                            DimensionConstants
                                                                .d6.r,
                                                        bottomRightradius:
                                                            DimensionConstants
                                                                .d6.r,
                                                        bottomleftradius:
                                                            DimensionConstants
                                                                .d6.r,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left:
                                                                  DimensionConstants
                                                                      .d9.w,
                                                              right:
                                                                  DimensionConstants
                                                                      .d9.w),
                                                          child: ImageView(
                                                            path: ImageConstants
                                                                .ic_add,
                                                            height:
                                                                DimensionConstants
                                                                    .d12.h,
                                                            width:
                                                                DimensionConstants
                                                                    .d12.w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                      DimensionConstants.d16.h,
                                                )
                                              ],
                                            );
                                          }),
                                      Container(
                                        height: DimensionConstants.d1.h,
                                        width: DimensionConstants.d338.w,
                                        color: ColorConstants.gray,
                                      ),
                                      SizedBox(
                                        height: DimensionConstants.d10.h,
                                      ),
                                      Row(
                                        children: [
                                          Text('Total Cost').mediumText(
                                              ColorConstants.darkblackcolor,
                                              DimensionConstants.d15.sp,
                                              TextAlign.center),
                                          SizedBox(
                                            width: DimensionConstants.d187.w,
                                          ),
                                          Text('14.99 EGP').GilroySemiBoldText(
                                              ColorConstants.colorButtonbgColor,
                                              DimensionConstants.d15.sp,
                                              TextAlign.center),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: DimensionConstants.d70.h,
                              ),
                              GestureDetector(
                                child: RoundCornerShape(
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0.0, 0.75),
                                        blurRadius: 12,
                                        color: ColorConstants.borderColor,
                                      )
                                    ]),
                                    width: DimensionConstants.d373.w,
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
                                          const Text(
                                            'Add To Cart',
                                          ).boldText(
                                              ColorConstants.whiteColor,
                                              DimensionConstants.d16.sp,
                                              TextAlign.center),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          });
        });
  }
}

//
