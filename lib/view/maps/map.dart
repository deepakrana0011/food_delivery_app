import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/constants/color_constants.dart';
import 'package:food_delivery_app/constants/decoration.dart';
import 'package:food_delivery_app/constants/dimension_constants.dart';
import 'package:food_delivery_app/constants/image_constants.dart';
import 'package:food_delivery_app/constants/route_constants.dart';
import 'package:food_delivery_app/extensions/allExtensions.dart';
import 'package:food_delivery_app/provider/signup_provider.dart';
import 'package:food_delivery_app/view/base_view.dart';
import 'package:food_delivery_app/widgets/image_view.dart';
import 'package:food_delivery_app/widgets/roundCornerShape.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final searchcontroller=new TextEditingController();
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


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
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstants.colorbackground,
          key: _scaffoldKey,

          body: BaseView<SignUpProvider>(
            onModelReady: (provider) {

            },
            builder: (context, provider, _) {

                return  Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  overflow: Overflow.visible,
                  children: [

                    Container(
                      height: DimensionConstants.loginscreenheight.h,
                      width: DimensionConstants.loginscreenwidth.w,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        mapToolbarEnabled: false,
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                    Positioned(
                        top: DimensionConstants.d23.h,
                        left: DimensionConstants.d20.w,

                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: DimensionConstants.d45.h,
                                width: DimensionConstants.d45.w,
                                child: RoundCornerShape(
                                  bgColor: ColorConstants.whiteColor,
                                  radius: DimensionConstants.d6.r,
                                  child: Padding(
                                    padding:  EdgeInsets.only(top: DimensionConstants.d13.h,left: DimensionConstants.d18.w,bottom: DimensionConstants.d13.h,
                                    right: DimensionConstants.d18.w),
                                    child: ImageView(
                                      path: ImageConstants.ic_back,
                                      height: DimensionConstants.d18.h,
                                      width: DimensionConstants.d10.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: DimensionConstants.d10.w,
                            ),
                            Container(
                              height: DimensionConstants.d45.h,
                              width: DimensionConstants.d319.w,
                              child: RoundCornerShape(
                                bgColor: ColorConstants.whiteColor,
                                radius: DimensionConstants.buttonradius.r,
                                child: TextFormField(
                                  //onChanged: (value) => applicationBloc.searchPlaces(value),
                                  //onTap: () => applicationBloc.clearSelectedLocation(),
                                  controller: searchcontroller,

                                  textCapitalization:
                                  TextCapitalization.sentences,
                                  cursorColor:
                                  ColorConstants.colorButtonbgColor,
                                  style: ViewDecoration.textFieldStyle(
                                      DimensionConstants
                                          .textfieldTextSize.sp),
                                  decoration: ViewDecoration
                                      .inputDecorationWithCurve(
                                      "Search for your address",
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: DimensionConstants
                                                  .d19
                                                  .w,
                                              top: DimensionConstants
                                                  .d12
                                                  .h,
                                              bottom: DimensionConstants
                                                  .d12
                                                  .h,
                                              right: DimensionConstants
                                                  .d12
                                                  .w),
                                          child:  ImageView(
                                            path: ImageConstants.ic_search,
                                            height: DimensionConstants.d22.h,
                                            width: DimensionConstants.d22.w,
                                          )),
                                      suffixIcon: Padding(
                                        padding:  EdgeInsets.only( top: DimensionConstants
                                            .d13
                                            .h,
                                            bottom: DimensionConstants
                                                .d13
                                                .h,
                                            right: DimensionConstants
                                                .d11
                                                .w),
                                        child: ImageView(
                                          path: ImageConstants.ic_address,
                                          height: DimensionConstants.d19.h,
                                          width: DimensionConstants.d19.w,
                                        ),
                                      )
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,

                                ),
                              ),
                            ),
                          ],

                        )),
                    Positioned(
                        top: DimensionConstants.d774.h,
                        left: DimensionConstants.d20.w,

                        child: Container(
                          height: DimensionConstants.d76.h,
                          width: DimensionConstants.d372.w,
                          child: RoundCornerShape(
                            bgColor: ColorConstants.whiteColor,
                            radius: DimensionConstants.d6.r,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: DimensionConstants.d8.h,
                                ),
                                Padding(padding: EdgeInsets.only(left: DimensionConstants.d13.w),
                                child:  Text('Delivery Location').btnText(
                                    ColorConstants.colorHintTextColor,DimensionConstants.d15.sp
                                )),
                                SizedBox(
                                  height: DimensionConstants.d6.h,
                                ),
                                Padding(padding: EdgeInsets.only(left: DimensionConstants.d13.w,bottom: DimensionConstants.d8.h),
                                    child:  Row(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(bottom:DimensionConstants.d6.h ),
                                          child: ImageView(
                                            path: ImageConstants.ic_location,
                                            height: DimensionConstants.d25.h,
                                            width: DimensionConstants.d25.w,
                                          ),
                                        ),
                                        SizedBox(
                                          width: DimensionConstants.d6.w,
                                        ),
                                        Text('Assuit, Main City - AL Gomhuria').btnText(ColorConstants.darkblackcolor,DimensionConstants.d15.sp)
                                      ],
                                    )),

                              ],
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        top: DimensionConstants.d784.h,
                        left: DimensionConstants.d20.w,

                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(RoutesConstants.summary);
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
                                        'Deliver Here',
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
                    ),
                  ],

                );





            },
          )),
    );
  }


}

//
