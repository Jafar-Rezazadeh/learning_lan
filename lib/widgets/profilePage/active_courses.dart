import 'package:flutter/material.dart';
import 'package:languege_learning/models/color_pallet.dart';

Widget activeCourses(screenHeight, screenWidth) {
  return GestureDetector(
    // fire on tap
    onTap: () {},
    // contents
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: ColorPallet().darkBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      height: screenHeight / 9,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            "دوره فعال شما",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenHeight / 40,
            ),
          ),
          // content
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // course title
              Text(
                "آموزش زبان انگلیسی - سطح A2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight / 50,
                ),
              ),
              // action button
              Row(
                children: [
                  Text(
                    "مشاهده",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight / 50,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_left_rounded,
                    size: screenHeight / 30,
                    color: Colors.white,
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
