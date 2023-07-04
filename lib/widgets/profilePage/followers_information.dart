import 'package:flutter/material.dart';
import 'package:languege_learning/models/color_pallet.dart';

Widget followersInformation(screenHeight, screenWidth) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    height: screenHeight / 10,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
      color: Colors.white,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // followers
        fIItem("دنبال کننده", 532, null, screenHeight, screenWidth),
        //
        VerticalDivider(
          color: Colors.grey.withOpacity(0.3),
          indent: screenHeight / 70,
          endIndent: screenHeight / 70,
        ),
        // following
        fIItem("دنبال شده", 422, null, screenHeight, screenWidth),
        //
        VerticalDivider(
          color: Colors.grey.withOpacity(0.3),
          indent: screenHeight / 70,
          endIndent: screenHeight / 70,
        ),
        // new friends
        GestureDetector(
          onTap: () {},
          child:
              fIItem("دوستان جدید", null, "جستجو", screenHeight, screenWidth),
        )
      ],
    ),
  );
}

// followers information item for row
fIItem(String label, int? nOu, String? topLable, screenHeight, screenWidth) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: screenHeight / 100),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // number of users
        Text(
          topLable ?? nOu.toString(),
          style: TextStyle(
            color: ColorPallet().brown,
            fontSize: screenHeight / 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        //
        SizedBox(
          height: screenHeight / 200,
        ),
        // bottom lable
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorPallet().brown,
            fontSize: screenHeight / 65,
          ),
        )
      ],
    ),
  );
}
