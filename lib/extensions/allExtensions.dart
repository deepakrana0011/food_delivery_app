import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/constants/color_constants.dart';


extension ExtendPedding on Widget {
  addAllSidePadding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }


}

extension ExtendText on Text {

  appBarText(Color color, double textSize, {maxLines, overflow,textAlign}) {
    return Text(
      this.data!,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontFamily: "popins",
          fontWeight: FontWeight.w600,
          fontSize: textSize),
    );
  }




  regularText(Color color, double textSize, {maxLines, overflow,textAlign}) {
    return Text(
      this.data!,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontFamily: "Gilroy",
          fontWeight: FontWeight.w400,
          fontSize: textSize),
    );
  }

  normalText(Color color, double textSize, {maxLines, overflow,textAlign,TextDecoration? decoration}) {
    return Text(
      this.data!,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,



      style: TextStyle(
          color: color,
          fontFamily: "Gilroy",
          fontWeight: FontWeight.w500,
          fontSize: textSize,
        decoration: decoration

      ),
    );
  }



  mediumText(Color color, double textSize, TextAlign alignment,
      
      {maxLines, overflow}) {
    return Text(
      this.data!,
      maxLines: maxLines,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontFamily: "Gilroy",
          fontWeight: FontWeight.w700,
          fontSize: textSize),
    );
  }

  buttonText(Color color, double textSize, TextAlign alignment,
      {maxLines, overflow}) {
    return Text(
      this.data!,
      maxLines: maxLines,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontFamily: "Gilroy",
          fontWeight: FontWeight.w600,
          fontSize: textSize),
    );
  }


  boldText(Color color, double textSize, TextAlign alignment,
      {maxLines, overflow}) {
    return Text(
      this.data!,
      maxLines: maxLines,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontFamily: "Gilroy",
          fontWeight: FontWeight.w800,
          fontSize: textSize),
    );
  }

  semiBoldText(Color color, double textSize, TextAlign alignment,
      {maxLines, overflow}) {
    return Text(
      this.data!,
      maxLines: maxLines,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontFamily: "popins",
          fontWeight: FontWeight.w600,
          fontSize: textSize),
    );
  }


  semiMediumText(Color color, double textSize, TextAlign alignment,
      {maxLines, overflow}) {
    return Text(
      this.data!,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontFamily: "popins",
          fontWeight: FontWeight.w600,
          fontSize: textSize),
    );
  }
}

extension Decoration on Widget {
/*  Widget boxDecoration(
      {double topRight=0,
      double topLeft=0,
      double bottomRight=0,
      double bottomLeft=0,
      Color color}) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ScreenUtil().setHeight(topLeft)),
              topRight: Radius.circular(ScreenUtil().setHeight(topRight)),
              bottomLeft: Radius.circular(ScreenUtil().setHeight(bottomLeft)),
              bottomRight: Radius.circular(ScreenUtil().setHeight(bottomRight)))),
    );
  }*/
}

extension textFiledDecoration on TextField {
  inputDecorationWithCurve(String fieldname, ScreenScaler scaler,
      {IconData? icon}) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          prefixIcon: icon == null
              ? null
              : Icon(
                  icon,
                  size: scaler.getTextSize(12),
                  color: ColorConstants.primaryColor,
                ),
          hintText: fieldname,
          filled: true,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: "popins",
              fontWeight: FontWeight.w500,
              fontSize: scaler.getTextSize(10)),
          isDense: true,
          contentPadding: icon == null
              ? scaler.getPaddingLTRB(1, 0.5, 0.5, 1)
              : scaler.getPaddingLTRB(0.1, 0.1, 0.1, 0.1),
          fillColor: ColorConstants.whiteColor,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorConstants.primaryColor, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    );
  }
}
Widget getTextField({required String hint}) {
  return TextField(
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        contentPadding:
        EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        filled: true,
        fillColor: ColorConstants.whiteColor,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        )),
  );
}