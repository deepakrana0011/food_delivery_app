import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class Listview extends StatelessWidget {
     Axis scrollDirection;
     ScrollPhysics physics;
      bool shrinkWrap;
     Widget Function(BuildContext, int) itemBuilder;
      int itemCount;



      Listview(
      {required this.scrollDirection,
        required this.physics,
        required this.shrinkWrap,
        required this.itemBuilder,
        required this.itemCount
       });

  @override
  Widget build(BuildContext context) {

    return Container(


        child: ListView.builder(
            shrinkWrap: shrinkWrap,
            scrollDirection: scrollDirection,
            itemCount: itemCount,
            itemBuilder: itemBuilder,
            physics: physics,
            ));
  }
}
