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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 int ind=0;
  int pageIndex=0;
  int currentPos = 0;
  List listPaths = [
    ImageConstants.ic_restaurant_promo,
    ImageConstants.ic_restaurant_promo,
    ImageConstants.ic_restaurant_promo,
    ImageConstants.ic_restaurant_promo
  ];
  final searchcontroller = TextEditingController();
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
          backgroundColor: ColorConstants.whiteColor,
          key: _scaffoldKey,

          body: BaseView<SignUpProvider>(
            onModelReady: (provider) {},
            builder: (context, provider, _) {
              return SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(left: DimensionConstants.d19.w,right: DimensionConstants.d19.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: DimensionConstants.d32.h,
                      ),
                      Row(
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
                          const Text('4517 Washington Ave. Manchester').mediumText(
                              ColorConstants.colorHintTextColor,
                              DimensionConstants.d12.sp,
                              TextAlign.center)
                        ],
                      ),
                      SizedBox(
                        height: DimensionConstants.d10.h,
                      ),
                      Row(
                        children: [
                          const Text('Hi Noha').mediumText(
                              ColorConstants.headingColor,
                              DimensionConstants.d16.sp,
                              TextAlign.center),
                          const Text('!').mediumText(
                              ColorConstants.colorButtonbgColor,
                              DimensionConstants.d16.sp,
                              TextAlign.center),
                          SizedBox(
                            width: DimensionConstants.d274.w,
                          ),
                          RoundCornerShape(
                            height: DimensionConstants.d32.h,
                            width: DimensionConstants.d32.w,
                            bgColor: ColorConstants.colorButtonbgColor,
                            topRightradius: DimensionConstants.d6.r,
                            topleftradius: DimensionConstants.d6.r,
                            bottomRightradius: DimensionConstants.d6.r,
                            bottomleftradius: DimensionConstants.d6.r,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 3.w,
                                  right: 3.w),
                              child: Center(
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
                      Row(
                        children: [
                          const Text('Find Your Favorit dish').mediumText(
                              ColorConstants.headingColor,
                              DimensionConstants.d14.sp,
                              TextAlign.center),
                        ],
                      ),
                      SizedBox(
                        height: DimensionConstants.d15.h,
                      ),
                      Row(
                        children: [
                          Material(
                            elevation: DimensionConstants.d2,
                            borderRadius: BorderRadius.circular(DimensionConstants.d6.r),
                            child:RoundCornerShape(
                              decoration: const BoxDecoration(

                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 12,
                                      color: ColorConstants.borderColor,
                                    )
                                  ]
                              ),
                              height: DimensionConstants.d45.h,
                              width:
                              DimensionConstants.d319.w,

                              bgColor: ColorConstants.whiteColor,
                              topRightradius: DimensionConstants.d6.r,
                              topleftradius: DimensionConstants.d6.r,
                              bottomRightradius: DimensionConstants.d6.r,
                              bottomleftradius: DimensionConstants.d6.r,
                              child: Center(
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
                            child: RoundCornerShape(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.0, 0.75),
                                      blurRadius: 12,
                                      color: ColorConstants.borderColor,
                                    )
                                  ]
                              ),
                              height: DimensionConstants.d45.h,
                              width: DimensionConstants.d45.w,
                              bgColor: ColorConstants.whiteColor,
                              topRightradius: DimensionConstants.d6.r,
                              topleftradius: DimensionConstants.d6.r,
                              bottomRightradius: DimensionConstants.d6.r,
                              bottomleftradius: DimensionConstants.d6.r,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: DimensionConstants.d12.w,
                                    right: DimensionConstants.d12.w),
                                child: Center(
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
                      SizedBox(
                        height: DimensionConstants.d20.h,
                      ),
                      Column(
                          children: [
                            SizedBox(
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
                          ]),
                      SizedBox(
                        height: DimensionConstants.d23.h,
                      ),
                      const Text('Categories').mediumText(
                          ColorConstants.colorBlack,
                          DimensionConstants.d16,
                          TextAlign.center),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Show all').mediumText(
                              ColorConstants.colorHintTextColor,
                              DimensionConstants.d14.sp,TextAlign.center)
                        ],
                      ),
                      SizedBox(
                        height: DimensionConstants.d2.h,
                      ),
                      Container(
                        color: ColorConstants.whiteColor,
                        height: DimensionConstants.d68.h,
                        child: Listview(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: DimensionConstants.d3.w,

                                  ),
                                  Material(
                                    elevation: 1,

                                    borderRadius: BorderRadius.circular(DimensionConstants.d6.r),
                                    child: RoundCornerShape(
                                      strokeColor: ColorConstants.colorWhitishGray,
                                        decoration: const BoxDecoration(

                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0.0, 2),
                                                blurRadius:6,
                                                color: ColorConstants.colorWhitishGray,
                                              )
                                            ]
                                        ),

                                        height: DimensionConstants.d60.h,
                                        width: DimensionConstants.d67.w,
                                        bgColor:
                                        ColorConstants.whiteColor,
                                        topRightradius: DimensionConstants.d6.r,
                                        topleftradius: DimensionConstants.d6.r,
                                        bottomRightradius: DimensionConstants.d6.r,
                                        bottomleftradius: DimensionConstants.d6.r,
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
                                                .mediumText(
                                                ColorConstants
                                                    .colorBlack,
                                                DimensionConstants
                                                    .d12.sp,
                                                TextAlign.center),
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    width: DimensionConstants.d8.w,

                                  )
                                ],
                              );
                            }),
                      ),
                      SizedBox(
                        height: DimensionConstants.d15.h,

                      ),
                      const Text('Restaurant nearby').mediumText(
                          ColorConstants.colorBlack,
                          DimensionConstants.d16,
                          TextAlign.center),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Show all').mediumText(
                              ColorConstants.colorHintTextColor,
                              DimensionConstants.d14.sp,TextAlign.center)
                        ],
                      ),
                      SizedBox(
                        height: DimensionConstants.d8.h,
                      ),
                      Container(
                        height: DimensionConstants.d400.h,
                        color: Colors.white,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: DimensionConstants.d21.w,
                          physics: const ClampingScrollPhysics(),
                          mainAxisSpacing: DimensionConstants.d20.h,
                          shrinkWrap: true,
                          children: List.generate(restuarntnames.length, (index) {
                            return Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: DimensionConstants.d2.w),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.of(context)
                                          .pushNamed(RoutesConstants.restaurant_details);
                                    },
                                    child: Material(
                                      elevation: 4,
                                      borderRadius: BorderRadius.circular(DimensionConstants.d22.r),
                                      child: RoundCornerShape(
                                        decoration: BoxDecoration(

                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(4, 4),
                                                blurRadius: 30,
                                                color: ColorConstants.whiteColor,
                                              )
                                            ]
                                        ),

                                        height: DimensionConstants.d218.h,
                                        width: DimensionConstants.d173.w,
                                        bgColor: ColorConstants.whiteColor,
                                        topRightradius: DimensionConstants.d22.r,
                                        topleftradius: DimensionConstants.d22.r,
                                        bottomRightradius: DimensionConstants.d22.r,
                                        bottomleftradius: DimensionConstants.d22.r,

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
                                            Text(restuarntnames[index]).boldText(
                                                ColorConstants.colorBlack,
                                                DimensionConstants
                                                    .d16.sp,
                                                TextAlign.center),
                                            SizedBox(
                                              height: DimensionConstants.d5.h,
                                            ),
                                            Text(restauranttimings[index]).mediumText(
                                                ColorConstants.colorBlack,
                                                DimensionConstants.d13.sp,
                                                TextAlign.center
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            );
                          },),
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d20.h,
                      ),
                      const Text('Recomended').mediumText(
                          ColorConstants.colorBlack,
                          DimensionConstants.d16.sp,TextAlign.center),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Show all').mediumText(
                              ColorConstants.colorHintTextColor,
                              DimensionConstants.d14.sp,TextAlign.center)
                        ],
                      ),
                      SizedBox(
                        height: DimensionConstants.d14.h,
                      ),
                      Listview(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: 3,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return Column(
                              children: [
                                Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(DimensionConstants.d6.r),
                                  child: RoundCornerShape(
                                      decoration: const BoxDecoration(

                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0.0, 0.75),
                                              blurRadius: 12,
                                              color: ColorConstants.borderColor,
                                            )
                                          ]
                                      ),
                                      height: DimensionConstants.d103.h,
                                      width: DimensionConstants.d372.w,
                                      bgColor:
                                      ColorConstants.whiteColor,
                                      topRightradius: DimensionConstants.d6.r,
                                      topleftradius: DimensionConstants.d6.r,
                                      bottomRightradius: DimensionConstants.d6.r,
                                      bottomleftradius: DimensionConstants.d6.r,
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
                                                      const Text('Spacy fresh crab').mediumText(
                                                          ColorConstants
                                                              .colorBlack,
                                                          DimensionConstants
                                                              .d15.sp,TextAlign.center),
                                                      SizedBox(
                                                        width:
                                                        DimensionConstants
                                                            .d102.w,
                                                      ),
                                                      const Text('15% off').mediumText(
                                                          ColorConstants
                                                              .percentagecolor,
                                                          DimensionConstants
                                                              .d13.sp,TextAlign.center)
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
                                                        child: const Text('4.5').mediumText(
                                                            ColorConstants
                                                                .colorBlack,
                                                            DimensionConstants
                                                                .d15
                                                                .sp,TextAlign.center),
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
                                                      const Text('20 mins, 10 EGP').mediumText(
                                                          ColorConstants
                                                              .colorBlack,
                                                          DimensionConstants
                                                              .d14.sp,TextAlign.center)
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
                          }),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }


}
