import 'dart:async';
import 'dart:io';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
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
import 'package:food_delivery_app/widgets/list_view.dart';
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
  List restuarntnames=['Vegan Resto','Healthy Food','Good Food','Good Food'];
  List restaurantimages= [ImageConstants.ic_restaurant1,ImageConstants.ic_restaurant2,ImageConstants.ic_restaurant3,ImageConstants.ic_restaurant4];
  List restauranttimings=['12 Mins','8 Mins','12 Mins','8 Mins'];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 int ind=0;
  int pageIndex=0;
  int currentPos = 0;
  List listPaths = [
    ImageConstants.ic_restaurant_promo,
    ImageConstants.ic_restaurant_promo,
    ImageConstants.ic_restaurant_promo,
    ImageConstants.ic_restaurant_promo


  ];



  final searchcontroller = new TextEditingController();
  final pageController = PageController(viewportFraction: 1.05);




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
                      height: DimensionConstants.d32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: DimensionConstants.d21.w),
                      child: Row(
                        children: [
                          ImageView(
                            path: ImageConstants.ic_map,
                            height:
                            DimensionConstants.d18.h,
                            width:
                            DimensionConstants.d14.w,
                          ),
                          SizedBox(
                            width: DimensionConstants.d7.w,
                          ),
                          Text('4517 Washington Ave. Manchester').normalText(
                              ColorConstants.colorHintTextColor,
                              DimensionConstants.d12.sp)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: DimensionConstants
                              .d19.w),
                      child: Row(
                        children: [
                          Text('Hi Noha').normalText(
                              ColorConstants.headingColor,
                              DimensionConstants.d16.sp),
                          Text('!').normalText(
                              ColorConstants.colorButtonbgColor,
                              DimensionConstants.d16.sp),
                          SizedBox(
                            width: DimensionConstants.d274.w,
                          ),
                          Container(
                            height: DimensionConstants.d32.h,
                            width: DimensionConstants.d32.w,
                            child: RoundCornerShape(
                              bgColor: ColorConstants.colorButtonbgColor,
                              radius: DimensionConstants.d6.r,
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
                              .d19.w),
                      child: Row(
                        children: [
                          Text('Find Your Favorit dish').normalText(
                              ColorConstants.headingColor,
                              DimensionConstants.d14.sp),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: DimensionConstants
                              .d20.w,
                          right: DimensionConstants
                              .d20.w),
                      child: Row(
                        children: [
                          Material(
                            elevation: DimensionConstants.d2,
                            borderRadius: BorderRadius.circular(DimensionConstants.d6.r),
                            child: Container(
                              height: DimensionConstants.d45.h,
                              width:
                              DimensionConstants.d319.w,
                              child: RoundCornerShape(
                                bgColor: ColorConstants.whiteColor,
                                radius: DimensionConstants.d6.r,
                                child: TextFormField(
                                  textCapitalization:
                                  TextCapitalization.sentences,
                                  cursorColor:
                                  ColorConstants.colorButtonbgColor,
                                  controller: searchcontroller,
                                  style: ViewDecoration.textFieldStyle(
                                      DimensionConstants
                                          .d16.sp),
                                  decoration: ViewDecoration.inputDecorationWithCurve(
                                      "search".tr(),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: DimensionConstants
                                                  .d14
                                                  .w,
                                              top: DimensionConstants
                                                  .d14
                                                  .h,
                                              bottom: DimensionConstants
                                                  .d16
                                                  .h,
                                              right: DimensionConstants
                                                  .d9
                                                  .w),
                                          child: ImageView(
                                            path: ImageConstants.ic_search,
                                            height: DimensionConstants
                                                .d15.h,
                                            width: DimensionConstants
                                                .d15.w,
                                          ))),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: DimensionConstants.d8.w,
                          ),
                          Material(
                            elevation: DimensionConstants.d2,
                            borderRadius: BorderRadius.circular(DimensionConstants.d6.r),
                            child: Container(
                              height: DimensionConstants.d45.h,
                              width: DimensionConstants.d45.w,
                              child: RoundCornerShape(
                                bgColor: ColorConstants.whiteColor,
                                radius: DimensionConstants.d6.r,
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
                        child: Column(
                            children: [
                              Container(
                                height: DimensionConstants.d150.h,
                                width: DimensionConstants.d373.w,
                                child:  CarouselSlider.builder(
                                  itemCount: listPaths.length,
                                  options: CarouselOptions(
                                    reverse: false,
                                      enlargeCenterPage: true,
                                      viewportFraction: 0.79,
                                      aspectRatio:3.5,
                                      initialPage: 1,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentPos = index;
                                        });
                                      }
                                  ), itemBuilder: (BuildContext context, int index, int realIndex) {
                                    return Container(height: DimensionConstants.d150.h,color: ColorConstants.whiteColor,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(DimensionConstants.d6.r),
                                        child: ImageView(
                                          path: ImageConstants.ic_promo,
                                          height: DimensionConstants.d150.h,
                                          width: DimensionConstants.d372.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                },
                                ),
                              ),


                              CarouselIndicator(
                                cornerRadius: DimensionConstants.d20.r,
                                activeColor: ColorConstants.colorButtonbgColor,
                                color: ColorConstants.colorHintTextColor,
                                count: listPaths.length,
                                index: currentPos,
                              ),
                            ])),
                    SizedBox(
                      height: DimensionConstants.d23.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: DimensionConstants
                                .d20.w),
                        child: Text('Categories').normalText(
                            ColorConstants.colorBlack,
                            DimensionConstants.d16)),

                    Padding(
                        padding: EdgeInsets.only(
                            right: DimensionConstants.d20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Show all').normalText(
                                ColorConstants.colorHintTextColor,
                                DimensionConstants.d14)
                          ],
                        )),
                    SizedBox(
                      height: DimensionConstants.d6.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: DimensionConstants
                              .d18.w,
                          right: DimensionConstants
                              .d20.w),
                      child: Container(
                        color: ColorConstants.whiteColor,
                        height: DimensionConstants.d67.h,
                        child: Listview(
                          physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: DimensionConstants.d2.w,
                                  ),
                                  Container(
                                    color: ColorConstants.whiteColor,
                                    height: DimensionConstants.d60.h,
                                    width: DimensionConstants.d67.w,
                                    child: Material(
                                      elevation: 1.4,
                                      borderRadius: BorderRadius.circular(DimensionConstants.d6.r),
                                      child: RoundCornerShape(
                                          bgColor:
                                          ColorConstants.whiteColor,
                                          radius: DimensionConstants
                                              .d6.r,
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
                                                    .d26.h,
                                                width: DimensionConstants
                                                    .d26.w,
                                              ),
                                              SizedBox(
                                                height:
                                                DimensionConstants.d4.h,
                                              ),
                                              Text(categories[index])
                                                  .normalText(
                                                  ColorConstants
                                                      .colorBlack,
                                                  DimensionConstants
                                                      .d12.sp),
                                            ],
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: DimensionConstants.d8.w,
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d18.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: DimensionConstants
                                .d20.w),
                        child: Text('Restaurant nearby').normalText(
                            ColorConstants.colorBlack,
                            DimensionConstants.d16)),
                    SizedBox(
                      height: DimensionConstants.d1.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            right: DimensionConstants.d20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Show all').normalText(
                                ColorConstants.colorHintTextColor,
                                DimensionConstants.d14)
                          ],
                        )),
                    SizedBox(
                      height: DimensionConstants.d8.h,
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        left: DimensionConstants.d20.w,
                      ),
                      child: GridView.count(
                        crossAxisCount: 2,
                        physics: ClampingScrollPhysics(),
                        mainAxisSpacing: DimensionConstants.d23.h,

                        shrinkWrap: true,
                        children: List.generate(restuarntnames.length, (index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context)
                                      .pushNamed(RoutesConstants.restaurant_details);
                                },
                                child: Container(
                                  height: DimensionConstants.d218.h,
                                  width: DimensionConstants.d173.w,
                                  child: BottomNavigationBarShape(
                                    bgColor: ColorConstants.whiteColor,
                                    topRightradius: DimensionConstants.d22.r,
                                    topleftradius: DimensionConstants.d22.r,
                                    bottomleftradius:DimensionConstants.d22.r ,
                                    bottomRightradius: DimensionConstants.d22.r,

                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: DimensionConstants.d30.h,
                                        ),
                                        ImageView(
                                          path: restaurantimages[index],
                                          height: DimensionConstants.d86.h,
                                          width: DimensionConstants.d114.w,
                                        ),
                                        SizedBox(
                                          height: DimensionConstants.d20.h,
                                        ),
                                        Text(restuarntnames[index]).mediumText(
                                            ColorConstants.colorBlack,
                                            DimensionConstants
                                                .d16.sp,
                                            TextAlign.center),
                                        SizedBox(
                                          height: DimensionConstants.d5.h,
                                        ),
                                        Text(restauranttimings[index]).normalText(
                                          ColorConstants.colorBlack,
                                          DimensionConstants.d13.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: DimensionConstants.d23.w,
                              ),
                            ],
                          );
                        },),
                      ),
                    ),

                    SizedBox(
                      height: DimensionConstants.d13.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: DimensionConstants
                                .d20.w),
                        child: Text('Recomended').normalText(
                            ColorConstants.colorBlack,
                            DimensionConstants.d16)),
                    SizedBox(
                      height: DimensionConstants.d1.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            right: DimensionConstants.d20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Show all').normalText(
                                ColorConstants.colorHintTextColor,
                                DimensionConstants.d14)
                          ],
                        )),
                    SizedBox(
                      height: DimensionConstants.d14.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: DimensionConstants.d20.w,
                            right: DimensionConstants.d20.w),
                        child: Listview(
                          scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: 3,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Material(
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(DimensionConstants.d6.r),
                                    child: Container(
                                      height: DimensionConstants.d103.h,
                                      width: DimensionConstants.d372.w,
                                      child: RoundCornerShape(
                                          bgColor:
                                          ColorConstants.whiteColor,
                                          radius: DimensionConstants
                                              .d6.r,
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
                                                          Text('Spacy fresh crab').normalText(
                                                              ColorConstants
                                                                  .colorBlack,
                                                              DimensionConstants
                                                                  .d15.sp),
                                                          SizedBox(
                                                            width:
                                                            DimensionConstants
                                                                .d102.w,
                                                          ),
                                                          Text('15% off').normalText(
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
                                                            child: Text('4.5').normalText(
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
                                                          Text('20 mins, 10 EGP').normalText(
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
          )),
    );
  }


}
