import 'package:flutter/material.dart';
import 'package:languege_learning/widgets/0globalWidgets/flag_design.dart';

import '../../models/color_pallet.dart';

Widget showAllLangs(screenHeight, screenWidth) {
  return Container(
    padding: const EdgeInsets.all(5),
    height: screenHeight / 12,
    width: double.infinity,
    decoration: BoxDecoration(
      color: ColorPallet().bluWhiteLows,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        width: 2,
        color: Colors.white,
        style: BorderStyle.solid,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 20,
          spreadRadius: 2,
        ),
      ],
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        // some flags
        Positioned(
          right: screenWidth / 250,
          child: SizedBox(
            height: screenHeight / 20,
            width: screenHeight / 20,
            child: flagDesign("ES"),
          ),
        ),
        Positioned(
          right: screenWidth / 30,
          child: SizedBox(
            height: screenHeight / 20,
            width: screenHeight / 20,
            child: flagDesign("DE"),
          ),
        ),
        Positioned(
          right: (screenWidth / 30) * 2,
          child: SizedBox(
            height: screenHeight / 20,
            width: screenHeight / 20,
            child: flagDesign("IT"),
          ),
        ),
        // text
        Positioned(
          right: screenWidth / 4.9,
          child: Text(
            "مشاهده تمام زبان ها",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: screenHeight / 45,
            ),
          ),
        ),
        // arrow icon
        Positioned(
          left: 0.0,
          child: Icon(
            Icons.keyboard_arrow_left_rounded,
            color: Colors.black,
            size: screenHeight / 30,
          ),
        )
      ],
    ),
  );
}
