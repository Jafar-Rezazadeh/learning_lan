import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:languege_learning/widgets/0globalWidgets/flag_design.dart';
import '../../models/color_pallet.dart';

Widget popularLCard(double screenHeight, double screenWidth, String flagname,
    String lanName, int userCount, int courses) {
  var formatter = NumberFormat('###,000');
  return Container(
    padding: const EdgeInsets.all(10),
    height: screenHeight / 3.8,
    width: screenWidth / 2.32,
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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // flag
        flagDesign(flagname),
        // title
        Text(
          lanName,
          style: TextStyle(
            color: ColorPallet().darkBlue,
            fontSize: screenHeight / 35,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: screenHeight / 50),
        // user count
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // icon
            Icon(
              Icons.person_outline,
              color: ColorPallet().darkBlue,
              size: screenHeight / 35,
            ),
            //
            SizedBox(width: screenWidth / 70),
            // count
            Text(
              formatter.format(userCount),
              style: TextStyle(
                color: ColorPallet().darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: screenHeight / 50,
              ),
            ),
            //
            SizedBox(width: screenWidth / 70),
            // details
            Text(
              "زبان آموز",
              style: TextStyle(
                color: ColorPallet().darkBlue,
                fontSize: screenHeight / 50,
              ),
            )
          ],
        ),
        SizedBox(height: screenHeight / 200),
        // courses
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // icon
            Icon(
              Icons.video_collection_outlined,
              color: ColorPallet().darkBlue,
              size: screenHeight / 35,
            ),
            //
            SizedBox(width: screenWidth / 70),
            // count
            Text(
              courses.toString(),
              style: TextStyle(
                color: ColorPallet().darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: screenHeight / 50,
              ),
            ),
            //
            SizedBox(width: screenWidth / 70),
            // details
            Text(
              "دوره آموزشی",
              style: TextStyle(
                color: ColorPallet().darkBlue,
                fontSize: screenHeight / 50,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
