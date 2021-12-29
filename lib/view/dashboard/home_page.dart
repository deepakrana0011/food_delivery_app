import 'dart:async';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:food_delivery_app/helper/keyboard_helper.dart';
import 'package:food_delivery_app/provider/signup_provider.dart';
import 'package:food_delivery_app/view/base_view.dart';
import 'package:food_delivery_app/widgets/bottom_bar_Container_shape.dart';
import 'package:food_delivery_app/widgets/image_view.dart';
import 'package:food_delivery_app/widgets/roundCornerShape.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List categories = [
    'Pasta',
    'Soup',
    'Burger',
    'Pizza',
    'Drinks',
    'Pasta',
    'Soup',
    'Burger',
    'Pizza',
    'Drinks'
  ];
  List categoriesimages = [
    ImageConstants.ic_pasta,
    ImageConstants.ic_soup,
    ImageConstants.ic_burger,
    ImageConstants.ic_pizza,
    ImageConstants.ic_drink,
    ImageConstants.ic_pasta,
    ImageConstants.ic_soup,
    ImageConstants.ic_burger,
    ImageConstants.ic_pizza,
    ImageConstants.ic_drink
  ];
  List navigationitems=['Home','WishList','Home','Cart','Profile'];
  List navigationicons=[ImageConstants.ic_home,ImageConstants.ic_favorite,ImageConstants.ic_dashboard,ImageConstants.ic_cart,ImageConstants.ic_profile];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 int ind=0;

  final searchcontroller = new TextEditingController();

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
          bottomNavigationBar: Container(
            height: DimensionConstants.bottombarheight.h,
            width: DimensionConstants.bottombarwidth.w,
            child: BottomNavigationBarShape(
                topleftradius:
                    DimensionConstants.bottomnavigationbartopleftradius.w,
                bottomRightradius: 0,
                topRightradius:
                    DimensionConstants.bottomnavigationbartoprightradius.w,
                bgColor: ColorConstants.whiteColor,
                bottomleftradius: 0,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: DimensionConstants.nametextfieldleftpadding.w,
                        right: DimensionConstants.nametextfieldleftpadding.w,
                        top: DimensionConstants.bottomrowtoppadding.h,
                        bottom: DimensionConstants.bottomrowbottompadding.h),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: navigationitems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {

                                  setState(() {
                                    ind=index;
                                  });
                                  onItemTapped(index);
                                },
                                child: Container(
                                  height: DimensionConstants
                                      .bottomcontainerheight.h,
                                  width:
                                      DimensionConstants.bottomcontainerwidth.w,
                                  child: BottomNavigationBarShape(
                                    bgColor:
                                    ind==index? ColorConstants.bottomcontainercolor:ColorConstants.whiteColor,
                                   topRightradius:  DimensionConstants.buttonradius.r,
                                    topleftradius: DimensionConstants.buttonradius.r,
                                    bottomRightradius: DimensionConstants.buttonradius.r,
                                    bottomleftradius: DimensionConstants.buttonradius.r,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        ImageView(
                                          path: navigationicons[index],
                                          height: DimensionConstants.d17.h,
                                          width: DimensionConstants.d18.w,
                                          color: ind==index?ColorConstants.colorButtonbgColor:ColorConstants.colorBlack,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(navigationitems[index]).btnText(
                                      ind==index?   ColorConstants.colorButtonbgColor:ColorConstants.whiteColor,
                                            DimensionConstants.d12.sp,maxLines: 2),
                                        SizedBox(
                                          height: 1.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: DimensionConstants.d30.w,
                              ),
                            ],
                          );
                        }))),
          ),
          body: BaseView<SignUpProvider>(
            onModelReady: (provider) {},
            builder: (context, provider, _) {
              return SafeArea(
                child: ScreenUtilInit(
                  designSize: const Size(DimensionConstants.loginscreenwidth,
                      DimensionConstants.loginscreenheight),
                  builder: () {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: DimensionConstants.homescreengap1.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: DimensionConstants.mapiconleftpadding.w),
                            child: Row(
                              children: [
                                ImageView(
                                  path: ImageConstants.ic_map,
                                  height:
                                      DimensionConstants.namelogosizeheight.h,
                                  width:
                                      DimensionConstants.namelogosizeheight.w,
                                ),
                                SizedBox(
                                  width: DimensionConstants.gapsizedbox.w,
                                ),
                                Text('4517 Washington Ave. Manchester').btnText(
                                    ColorConstants.colorHintTextColor,
                                    DimensionConstants.dividertextsize.sp)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.homescreengap2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: DimensionConstants
                                    .emailtextfieldleftpadding.w),
                            child: Row(
                              children: [
                                Text('Hi Noha').btnText(
                                    ColorConstants.headingColor,
                                    DimensionConstants.textfieldTextSize.sp),
                                Text('!').btnText(
                                    ColorConstants.colorButtonbgColor,
                                    DimensionConstants.textfieldTextSize.sp),
                                SizedBox(
                                  width: DimensionConstants.homescreengap3.w,
                                ),
                                Container(
                                  height: DimensionConstants.d32.h,
                                  width: DimensionConstants.d32.w,
                                  child: RoundCornerShape(
                                    bgColor: ColorConstants.colorButtonbgColor,
                                    radius: DimensionConstants.buttonradius.r,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 3.w,
                                          top: 3.h,
                                          bottom: 3.h,
                                          right: 3.w),
                                      child: ImageView(
                                        path: ImageConstants.ic_notification,
                                        height: DimensionConstants.d19.h,
                                        width: DimensionConstants.d15.w,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: DimensionConstants
                                    .emailtextfieldleftpadding.w),
                            child: Row(
                              children: [
                                Text('Find Your Favorit dish').btnText(
                                    ColorConstants.headingColor,
                                    DimensionConstants.noaccounttextsize.sp),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.textfieldgap.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: DimensionConstants
                                    .nametextfieldleftpadding.w,
                                right: DimensionConstants
                                    .nametextfieldleftpadding.w),
                            child: Row(
                              children: [
                                Container(
                                  height: DimensionConstants.d45.h,
                                  width:
                                      DimensionConstants.searchtextboxwidth.w,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    cursorColor:
                                        ColorConstants.colorButtonbgColor,
                                    controller: searchcontroller,
                                    style: ViewDecoration.textFieldStyle(
                                        DimensionConstants
                                            .textfieldTextSize.sp),
                                    decoration: ViewDecoration.inputDecorationWithCurve(
                                        "search".tr(),
                                        prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                left: DimensionConstants
                                                    .searchtextboxlefttoppadding
                                                    .w,
                                                top: DimensionConstants
                                                    .searchtextboxlefttoppadding
                                                    .h,
                                                bottom: DimensionConstants
                                                    .searchtextboxbottompadding
                                                    .h,
                                                right: DimensionConstants
                                                    .searchtextboxrightpadding
                                                    .w),
                                            child: ImageView(
                                              path: ImageConstants.ic_search,
                                              height: DimensionConstants
                                                  .searchiconsize.h,
                                              width: DimensionConstants
                                                  .searchiconsize.w,
                                            ))),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                SizedBox(
                                  width: DimensionConstants.searchtextboxgap.w,
                                ),
                                Container(
                                  height: DimensionConstants.d45.h,
                                  width: DimensionConstants.d45.w,
                                  child: RoundCornerShape(
                                    bgColor: ColorConstants.whiteColor,
                                    radius: DimensionConstants.buttonradius.r,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: DimensionConstants.d12.w,
                                          top: DimensionConstants.d13.h,
                                          bottom: DimensionConstants.d13.h,
                                          right: DimensionConstants.d12.w),
                                      child: ImageView(
                                        path: ImageConstants.ic_filter,
                                        height: DimensionConstants.d19.h,
                                        width: DimensionConstants.d21.w,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: DimensionConstants.d20.w,
                                  right: DimensionConstants.d20.w),
                              child: new CarouselSlider(
                                options: CarouselOptions(
                                    height: 150.0,
                                    viewportFraction: 1.9,
                                    aspectRatio: 4.0,
                                    enlargeCenterPage: true),
                                items: [1, 2, 3, 4, 5].map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                          height: 150,
                                          width: 371.w,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: ImageView(
                                            width: 371.w,
                                            path: ImageConstants.ic_promo,
                                          ));
                                    },
                                  );
                                }).toList(),
                              )),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: DimensionConstants
                                      .nametextfieldleftpadding.w),
                              child: Text('Categories').btnText(
                                  ColorConstants.colorBlack,
                                  DimensionConstants.textfieldTextSize)),
                          SizedBox(
                            height: DimensionConstants.d1.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  right: DimensionConstants.d20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Show all').btnText(
                                      ColorConstants.colorHintTextColor,
                                      DimensionConstants.noaccounttextsize)
                                ],
                              )),
                          SizedBox(
                            height: DimensionConstants.d12.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: DimensionConstants
                                    .nametextfieldleftpadding.w,
                                right: DimensionConstants
                                    .nametextfieldleftpadding.w),
                            child: Container(
                              color: ColorConstants.whiteColor,
                              height: 61.h,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Container(
                                          color: ColorConstants.whiteColor,
                                          height: DimensionConstants.d60.h,
                                          width: DimensionConstants.d67.w,
                                          child: Material(
                                            elevation: 4,
                                            borderRadius: BorderRadius.circular(DimensionConstants.buttonradius.r),
                                            child: RoundCornerShape(
                                                bgColor:
                                                    ColorConstants.whiteColor,
                                                radius: DimensionConstants
                                                    .buttonradius.r,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          DimensionConstants.d9.h,
                                                    ),
                                                    ImageView(
                                                      path:
                                                          categoriesimages[index],
                                                      height: DimensionConstants
                                                          .d25.h,
                                                      width: DimensionConstants
                                                          .d28.h,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          DimensionConstants.d4.h,
                                                    ),
                                                    Text(categories[index])
                                                        .btnText(
                                                            ColorConstants
                                                                .colorBlack,
                                                            DimensionConstants
                                                                .d12.sp),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        )
                                      ],
                                    );
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: DimensionConstants.d26.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: DimensionConstants
                                      .nametextfieldleftpadding.w),
                              child: Text('Restaurant nearby').btnText(
                                  ColorConstants.colorBlack,
                                  DimensionConstants.textfieldTextSize)),
                          SizedBox(
                            height: DimensionConstants.d1.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  right: DimensionConstants.d20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Show all').btnText(
                                      ColorConstants.colorHintTextColor,
                                      DimensionConstants.noaccounttextsize)
                                ],
                              )),
                          SizedBox(
                            height: DimensionConstants.d8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: DimensionConstants.d20.w,
                                  right: DimensionConstants.d20.w),
                              child: Row(
                                children: [
                                  Container(
                                    height: DimensionConstants.d218.h,
                                    width: DimensionConstants.d173.w,
                                    child: RoundCornerShape(
                                      bgColor: ColorConstants.whiteColor,
                                      radius: DimensionConstants.d22.r,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: DimensionConstants.d30.h,
                                          ),
                                          ImageView(
                                            path: ImageConstants.ic_restaurant1,
                                            height: DimensionConstants.d86.h,
                                            width: DimensionConstants.d114.w,
                                          ),
                                          SizedBox(
                                            height: DimensionConstants.d20.h,
                                          ),
                                          Text('Vegan Resto').mediumText(
                                              ColorConstants.colorBlack,
                                              DimensionConstants
                                                  .textfieldTextSize.sp,
                                              TextAlign.center),
                                          SizedBox(
                                            height: DimensionConstants.d5.h,
                                          ),
                                          Text('12 Mins').btnText(
                                            ColorConstants.colorBlack,
                                            DimensionConstants.d13.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: DimensionConstants.d23.w,
                                  ),
                                  Container(
                                    height: DimensionConstants.d218.h,
                                    width: DimensionConstants.d173.w,
                                    child: RoundCornerShape(
                                      bgColor: ColorConstants.whiteColor,
                                      radius: DimensionConstants.d22.r,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: DimensionConstants.d30.h,
                                          ),
                                          ImageView(
                                            path: ImageConstants.ic_restaurant2,
                                            height: DimensionConstants.d86.h,
                                            width: DimensionConstants.d114.w,
                                          ),
                                          SizedBox(
                                            height: DimensionConstants.d20.h,
                                          ),
                                          Text('Healthy Food').mediumText(
                                              ColorConstants.colorBlack,
                                              DimensionConstants
                                                  .textfieldTextSize.sp,
                                              TextAlign.center),
                                          SizedBox(
                                            height: DimensionConstants.d5.h,
                                          ),
                                          Text('8 Mins').btnText(
                                            ColorConstants.colorBlack,
                                            DimensionConstants.d13.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: DimensionConstants.d23.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: DimensionConstants.d20.w,
                                  right: DimensionConstants.d20.w),
                              child: Row(
                                children: [
                                  Container(
                                    height: DimensionConstants.d218.h,
                                    width: DimensionConstants.d173.w,
                                    child: RoundCornerShape(
                                      bgColor: ColorConstants.whiteColor,
                                      radius: DimensionConstants.d22.r,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: DimensionConstants.d30.h,
                                          ),
                                          ImageView(
                                            path: ImageConstants.ic_restaurant3,
                                            height: DimensionConstants.d86.h,
                                            width: DimensionConstants.d114.w,
                                          ),
                                          SizedBox(
                                            height: DimensionConstants.d20.h,
                                          ),
                                          Text('Good Food').mediumText(
                                              ColorConstants.colorBlack,
                                              DimensionConstants
                                                  .textfieldTextSize.sp,
                                              TextAlign.center),
                                          SizedBox(
                                            height: DimensionConstants.d5.h,
                                          ),
                                          Text('12 Mins').btnText(
                                            ColorConstants.colorBlack,
                                            DimensionConstants.d13.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: DimensionConstants.d23.w,
                                  ),
                                  Container(
                                    height: DimensionConstants.d218.h,
                                    width: DimensionConstants.d173.w,
                                    child: RoundCornerShape(
                                      bgColor: ColorConstants.whiteColor,
                                      radius: DimensionConstants.d22.r,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: DimensionConstants.d30.h,
                                          ),
                                          ImageView(
                                            path: ImageConstants.ic_restaurant4,
                                            height: DimensionConstants.d86.h,
                                            width: DimensionConstants.d114.w,
                                          ),
                                          SizedBox(
                                            height: DimensionConstants.d20.h,
                                          ),
                                          Text('Smart Resto').mediumText(
                                              ColorConstants.colorBlack,
                                              DimensionConstants
                                                  .textfieldTextSize.sp,
                                              TextAlign.center),
                                          SizedBox(
                                            height: DimensionConstants.d5.h,
                                          ),
                                          Text('8 Mins').btnText(
                                            ColorConstants.colorBlack,
                                            DimensionConstants.d13.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: DimensionConstants.d36.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: DimensionConstants
                                      .nametextfieldleftpadding.w),
                              child: Text('Recomended').btnText(
                                  ColorConstants.colorBlack,
                                  DimensionConstants.textfieldTextSize)),
                          SizedBox(
                            height: DimensionConstants.d1.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  right: DimensionConstants.d20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Show all').btnText(
                                      ColorConstants.colorHintTextColor,
                                      DimensionConstants.noaccounttextsize)
                                ],
                              )),
                          SizedBox(
                            height: DimensionConstants.d14.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: DimensionConstants.d20.w,
                                  right: DimensionConstants.d20.w),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Container(
                                          height: DimensionConstants.d103.h,
                                          width: DimensionConstants.d372.w,
                                          child: RoundCornerShape(
                                              bgColor:
                                                  ColorConstants.whiteColor,
                                              radius: DimensionConstants
                                                  .buttonradius.r,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: DimensionConstants
                                                            .d11.w,
                                                        top: DimensionConstants
                                                            .d17.h,
                                                        bottom:
                                                            DimensionConstants
                                                                .d16.h),
                                                    child: ImageView(
                                                      path: ImageConstants
                                                          .ic_menu,
                                                      height: DimensionConstants
                                                          .d70.h,
                                                      width: DimensionConstants
                                                          .d70.w,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                          padding: EdgeInsets.only(
                                                              left:
                                                                  DimensionConstants
                                                                      .d12.w,
                                                              top:
                                                                  DimensionConstants
                                                                      .d25.h),
                                                          child: Row(
                                                            children: [
                                                              Text('Spacy fresh crab').btnText(
                                                                  ColorConstants
                                                                      .colorBlack,
                                                                  DimensionConstants
                                                                      .d15.sp),
                                                              SizedBox(
                                                                width:
                                                                    DimensionConstants
                                                                        .d104.w,
                                                              ),
                                                              Text('15% off').btnText(
                                                                  ColorConstants
                                                                      .percentagecolor,
                                                                  DimensionConstants
                                                                      .d13.sp)
                                                            ],
                                                          )),
                                                      Padding(
                                                          padding: EdgeInsets.only(
                                                              left:
                                                                  DimensionConstants
                                                                      .d11.w,
                                                              top:
                                                                  DimensionConstants
                                                                      .d13.h),
                                                          child: Row(
                                                            children: [
                                                              ImageView(
                                                                path:
                                                                    ImageConstants
                                                                        .ic_star,
                                                                height:
                                                                    DimensionConstants
                                                                        .d15.h,
                                                                width:
                                                                    DimensionConstants
                                                                        .d15.w,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    DimensionConstants
                                                                        .d5.w,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: DimensionConstants
                                                                            .d1
                                                                            .h),
                                                                child: Text('4.5').btnText(
                                                                    ColorConstants
                                                                        .colorBlack,
                                                                    DimensionConstants
                                                                        .d15
                                                                        .sp),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    DimensionConstants
                                                                        .d30.w,
                                                              ),
                                                              ImageView(
                                                                path: ImageConstants
                                                                    .ic_delivery,
                                                                height:
                                                                    DimensionConstants
                                                                        .d22.h,
                                                                width:
                                                                    DimensionConstants
                                                                        .d22.w,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    DimensionConstants
                                                                        .d7.w,
                                                              ),
                                                              Text('20 mins, 10 EGP').btnText(
                                                                  ColorConstants
                                                                      .colorBlack,
                                                                  DimensionConstants
                                                                      .d14.sp)
                                                            ],
                                                          ))
                                                    ],
                                                  )
                                                ],
                                              )),
                                        ),
                                        SizedBox(
                                          height: DimensionConstants.d20.h,
                                        )
                                      ],
                                    );
                                  })),
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

  void onItemTapped(int index) {
    if(index==2){
      Navigator.of(context)
          .pushNamed(RoutesConstants.checkout);
    }
    if(index==1){
      Navigator.of(context)
          .pushNamed(RoutesConstants.summary);
    }
  }
}
