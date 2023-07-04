import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';

Widget cardLittleFlag(Color color, Size size, String countryCode) {
  return Container(
    padding: const EdgeInsets.all(5),
    height: size.height,
    width: size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          right: 0.0,
          child: CircleFlag(countryCode, size: size.height / 2),
        ),
        Positioned(
          left: 0.0,
          child: Text(
            "A2",
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height / 2,
            ),
          ),
        )
      ],
    ),
  );
}
