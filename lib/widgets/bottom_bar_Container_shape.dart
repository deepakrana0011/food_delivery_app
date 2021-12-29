import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BottomNavigationBarShape extends StatelessWidget {
  Widget child;
  Color bgColor;
  Color strokeColor;
  double topleftradius;
  double topRightradius;
  double bottomleftradius;
  double bottomRightradius;

  BottomNavigationBarShape(
      {required this.child,
        required this.bgColor,
        required this.topleftradius,
        required this.topRightradius,
        required this.bottomleftradius,
        required this.bottomRightradius,
        this.strokeColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler()..init(context);
    return Container(


        child: Material(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: strokeColor),
              borderRadius: scaler.getBorderRadiusCircularLR(topleftradius, topRightradius, bottomleftradius, bottomRightradius)),
          color: bgColor,
          child: child,
        ));
  }
}
