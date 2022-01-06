import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/constants/color_constants.dart';




extension ExtendText on Text {


  mediumText(Color color, double textSize, TextAlign alignment,
      
      {maxLines, overflow,TextDecoration? decoration}) {
    return Text(
      this.data!,
      maxLines: maxLines,
      textAlign: alignment,
      style: TextStyle(
        decoration: decoration,
          color: color,
          fontFamily: "Gilroy",
          fontWeight: FontWeight.w500,
          fontSize: textSize),
    );
  }

  GilroySemiBoldText(Color color, double textSize, TextAlign alignment,
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
          fontWeight: FontWeight.w700,
          fontSize: textSize),
    );
  }

}



