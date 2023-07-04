import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:languege_learning/models/color_pallet.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget midSection(context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    height: screenHeight / 5.5,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //right Side
        rightSide(screenHeight, screenWidth, 62),
        //left Side
        leftSide(screenHeight, screenWidth),
      ],
    ),
  );
}

// Right side
Widget rightSide(screenHeight, screenWidth, progressed) {
  return Container(
    height: double.infinity,
    width: screenWidth / 2.35,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 5,
          color: Colors.grey.withOpacity(0.3),
          offset: const Offset(-4, 0),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title and progress
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //title
            Text(
              "هدف امروز",
              style: TextStyle(
                color: ColorPallet().midBlue,
                fontSize: screenWidth / 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            //progress
            Container(
              margin: EdgeInsets.only(left: screenWidth / 50),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: screenHeight / 45,
                    lineWidth: screenWidth / 150,
                    percent: double.parse("0.$progressed"),
                    progressColor: ColorPallet().lightGreen,
                    backgroundWidth: screenWidth / 300,
                    backgroundColor: ColorPallet().lightGreen.withOpacity(0.2),
                  ),
                  Text(
                    "$progressed%",
                    style: TextStyle(
                      color: ColorPallet().lightGreen,
                      fontSize: screenWidth / 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // spend time
        Text(
          "16 از 20 دقیقه",
          style: TextStyle(
            color: ColorPallet().midBlue,
            fontSize: screenWidth / 35,
          ),
        ),
        // spendtime title
        Text(
          "زمان صرف شده آموزش",
          style: TextStyle(
            color: ColorPallet().midBlue,
            fontSize: screenWidth / 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

// Left side
Widget leftSide(screenHeight, screenWidth) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    height: double.infinity,
    width: screenWidth / 2.35,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 5,
          color: Colors.grey.withOpacity(0.3),
          offset: const Offset(2, 0),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Title
        Text(
          "عملکرد شما",
          style: TextStyle(
            color: ColorPallet().midBlue,
            fontSize: screenHeight / 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        //chart
        Container(
          padding: const EdgeInsets.all(5),
          height: screenHeight / 12,
          width: double.infinity,
          child: LineChart(
            mainData(),
          ),
        )
      ],
    ),
  );
}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
      getDrawingVerticalLine: (value) {
        return const FlLine(
          color: Colors.black,
          strokeWidth: 1,
          dashArray: [5],
        );
      },
    ),
    titlesData: const FlTitlesData(
      show: true,
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border(
          left: BorderSide(
            width: 1,
            color: ColorPallet().darkBlue,
          ),
          bottom: BorderSide(
            width: 1,
            color: ColorPallet().darkBlue,
          )),
    ),
    minX: 0,
    maxX: 10,
    minY: 0,
    maxY: 5,
    lineBarsData: [
      LineChartBarData(
        spots: List.generate(
          10,
          (i) {
            return FlSpot(
              i.toDouble(),
              (Random.secure().nextDouble() * 5).round().toDouble(),
            );
          },
        ),
        isCurved: false,
        preventCurveOverShooting: false,
        color: ColorPallet().amberDeep,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.pink.withOpacity(0.3)],
          ),
        ),
      ),
    ],
  );
}
