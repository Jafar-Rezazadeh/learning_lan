import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';

Widget flagDesign(flagname) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ]),
    child: CircleFlag(flagname),
  );
}
