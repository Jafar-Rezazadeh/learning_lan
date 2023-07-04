import 'package:flutter/material.dart';
import 'package:languege_learning/models/color_pallet.dart';

Widget scoreWidget(Size size, int scoreNumber, bool hasLabel) {
  return Container(
    padding: const EdgeInsets.all(3),
    height: size.height,
    width: size.width,
    decoration: BoxDecoration(
      color: ColorPallet().amberDeepLow.withOpacity(0.13),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //
        Icon(
          Icons.bolt_rounded,
          size: size.height / 1.5,
          color: ColorPallet().amberDeepLow,
        ),
        // score number
        Text(
          scoreNumber.toString(),
          style: TextStyle(
            color: hasLabel ? ColorPallet().brown : ColorPallet().amberDeepLow,
            fontSize: size.height / 2.3,
          ),
        ),
        // label if needed
        hasLabel
            ? Text(
                "امتیاز",
                style: TextStyle(
                  color: ColorPallet().brown,
                  fontSize: size.height / 2.3,
                ),
              )
            : Container(),
      ],
    ),
  );
}
