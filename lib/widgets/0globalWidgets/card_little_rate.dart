import 'package:flutter/material.dart';

Widget cardLittleRate(Color color, Size size, double rate) {
  return Container(
    padding: const EdgeInsets.all(5),
    height: size.height,
    width: size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.black.withOpacity(0.2),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          right: 0.0,
          child: Icon(
            Icons.star_rounded,
            color: color,
            size: size.height / 1.5,
          ),
        ),
        Positioned(
          left: 0.0,
          child: Text(
            rate.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height / 2,
            ),
          ),
        ),
      ],
    ),
  );
}
